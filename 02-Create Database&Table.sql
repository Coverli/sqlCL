-- 创建数据库school
CREATE DATABASE school;

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

/*
	删除表student_info
	IF EXISTS 表示如果表student_info存在则删除，可以不使用
	创建新表时，指定的表名必须不存在，否则会出错
	如果要防止意外覆盖已有的表，SQL要求先手工删除再重建，而不是简单地用创建表语句覆盖它
*/
DROP TABLE IF EXISTS student_info;

/*
	创建表student_info
	IF NOT EXISTS表示在表student_info不存在时新增
	使用IF NOT EXISTS仅仅查看表名是否存在并在表名不存在时创建它
	IF NOT EXISTS并不会检查已有表的模式是否与打算新建的表模式匹配
*/
/*
	NOT NULL：存储内容不能为空
	AUTO_INCREMENT：将该列数据设置为自增
	CHARACTER SET utf8 COLLATE utf8_bin：设置列编码格式为UTF-8，可换成其他编码
	DEFAULT NULL：默认为空，NULL可修改为任意符合数据类型的值
	COMMENT '学生姓名'：添加注释
	PRIMARY KEY (student_number)：student_number为主键，可设置多个列，用,隔开
	FOREIGN KEY (student_number) REFERENCES student_info (student_number)：将student_number设为外键，连接到表student_info的student_number上
	USING BTREE：使用B-Tree索引
	ENGINE=InnoDB：设置该表所使用的存储引擎，较为常用的有InnoDB、MyISAM、Memory
	AUTO_INCREMENT = 4：用“AUTO_INCREMENT=n”选项来指定一个自增的初始值
	CHARACTER SET = utf8 COLLATE = utf8_bin：设置表编码格式为UTF-8，可换成其他编码
	ROW_FORMAT = DYNAMIC：动态表
*/

/*
	关于NULL的补充说明：
		NULL并不等于空串，NULL值是没有值
		如果指定''（两个单引号，其间没有字符），这在NOT NULL列中是允许的。空串是一个有效值，它并不是无值
		NULL值用关键字NULL而不是空串指定
*/
/*
	MySQL中有四种Key: Primary Key, Unique Key, Key 和 Foreign Key
*/
/*
	主键说明：
		主键为其值唯一标识表中每行的列，即表中的每行必须具有唯一的主键值
		如果主键使用单个列，则它的值必须唯一；如果使用多个列，则这些列的组合值必须唯一
		主键中只能使用不允许NULL值的列；允许NULL值的列不能作为唯一标识
	主键的最好习惯：
		不更新主键列中的值
		不重用主键列中的值
		不在主键列中使用可能会更改的值
*/
/*
	使用外键的好处：
		信息不重复，不浪费时间和空间
		如有信息变更，可只更新单个记录
		数据无重复，处理数据更简单
*/
/*
	如何确定AUTO_INCREMENT的值：
		由于AUTO_INCREMENT是自动增加的，所以我们会不知道这些值的多少
		使用last_insert_id()这个函数获取最后一个AUTO_INCREMENT的值，如下所示
			SELECT last_insert_id();
*/
/*
	默认值的限制：
		与大多数DMBS不同，MySQL不允许使用函数作为默认值，它只支持常量和NULL值
*/
/*
	MySQL支持的引擎具体如下
	+--------------------+---------+----------------------------------------------------------------+--------------+------+------------+
	| Engine             | Support | Comment                                                        | Transactions | XA   | Savepoints |
	+--------------------+---------+----------------------------------------------------------------+--------------+------+------------+
	| MEMORY             | YES     | Hash based, stored in memory, useful for temporary tables      | NO           | NO   | NO         |
	| MRG_MYISAM         | YES     | Collection of identical MyISAM tables                          | NO           | NO   | NO         |
	| CSV                | YES     | CSV storage engine                                             | NO           | NO   | NO         |
	| FEDERATED          | NO      | Federated MySQL storage engine                                 | NULL         | NULL | NULL       |
	| PERFORMANCE_SCHEMA | YES     | Performance Schema                                             | NO           | NO   | NO         |
	| MyISAM             | YES     | MyISAM storage engine                                          | NO           | NO   | NO         |
	| InnoDB             | DEFAULT | Supports transactions, row-level locking, and foreign keys     | YES          | YES  | YES        |
	| BLACKHOLE          | YES     | /dev/null storage engine (anything you write to it disappears) | NO           | NO   | NO         |
	| ARCHIVE            | YES     | Archive storage engine                                         | NO           | NO   | NO         |
	+--------------------+---------+----------------------------------------------------------------+--------------+------+------------+
	较为常用的有InnoDB、MyISAM、Memory：
		InnoDB：是一个可靠的事务处理引擎，它不支持全文本搜索
		MyISAM：是一个性能极高的引擎，它支持全文本搜索，但不支持事务处理
		Memory：在功能等同于MyISAM，但由于数据库存储在内存中，速度很快，适用于临时表
	在同一个数据库里引擎类型可以混用，但注意外键不能跨引擎，即使用一个引擎的表不能引用具有不同引擎的表的外键
	在DMBS里，数据库存储引擎是有默认的，即你可以不使用ENGINE = xxx来指定引擎，但默认引擎并不是所有的表都适用，所以建议在建表时指定存储引擎
*/
/*
	B-TREE索引
		B-TREE索引的特点
			B-TREEB-TREE以B+树结构存储数据，大大加快了数据的查询速度
			B-TREE索引在范围查找的SQL语句中更加适合（顺序存储）
 		B-TREE索引使用场景
			1、全值匹配的查询SQL，如 where act_id= '1111_act'
			2、联合索引汇中匹配到最左前缀查询，如联合索引 KEY idx_actid_name(act_id,act_name) USING BTREE，只要条件中使用到了联合索引的第一列，就会用到该索引，但如果查询使用到的是联合索引的第二列act_name，该SQL则便无法使用到该联合索引（注：覆盖索引除外）
			3、匹配模糊查询的前匹配，如where act_name like '11_act%'
			4、匹配范围值的SQL查询，如where act_date > '9865123547215'（not in和<>无法使用索引）
			5、覆盖索引的SQL查询，就是说select出来的字段都建立了索引
	HASH索引
		HASH的特点
			Hash索引基于Hash表实现，只有查询条件精确匹配Hash索引中的所有列才会用到hash索引
			存储引擎会为Hash索引中的每一列都计算hash码，Hash索引中存储的即hash码，所以每次读取都会进行两次查询
			Hash索引无法用于排序
			Hash不适用于区分度小的列上，如性别字段
*/
/*
	在建表之后可用ALTER TABLE table_name AUTO_INCREMENT=n命令来重设自增的起始值
	当插入记录时，如果为AUTO_INCREMENT数据列明确指定了一个数值，则会出现两种情况，
		情况一，如果插入的值与已有的编号重复，则会出现出错信息，因为AUTO_INCREMENT数据列的值必须是唯一的；
		情况二，如果插入的值大于已编号的值，则会把该插入到数据列中，并使在下一个编号将从这个新值开始递增。也就是说，可以跳过一些编号。
		如果自增序列的最大值被删除了，则在插入新记录时，该值被重用。
		如果用UPDATE命令更新自增列，如果列值与已有的值重复，则会出错。如果大于已有值，则下一个编号从该值开始递增。

	在使用AUTO_INCREMENT时，应注意以下几点：
		1、AUTO_INCREMENT是数据列的一种属性，只适用于整数类型数据列。
		2、设置AUTO_INCREMENT属性的数据列应该是一个正数序列，所以应该把该数据列声明为UNSIGNED，这样序列的编号个可增加一倍
		3、AUTO_INCREMENT数据列必须有唯一索引，以避免序号重复(即是主键或者主键的一部分)。
		4、AUTO_INCREMENT数据列必须具备NOT NULL属性。
		5、AUTO_INCREMENT数据列序号的最大值受该列的数据类型约束，如TINYINT数据列的最大编号是127,如加上UNSIGNED，则最大为255。一旦达到上限，AUTO_INCREMENT就会失效。
		6、当进行全表删除时，MySQL AUTO_INCREMENT会从1重新开始编号。
*/
/*
	若一张表里面存在varchar、text以及其变形、blob以及其变形的字段的话，那么这个表其实也叫动态表，即该表的 row_format是dynamic，就是说每条记录所占用的字节是动态的。其优点节省空间，缺点增加读取的时间开销。
	反之，这张表叫静态表，该表 row_format为fixed,即每条记录占用字节一样。优点读取快，缺点浪费部分空间。

	row_format还有其他一些值：DEFAULT、FIXED、DYNAMIC、COMPRESSED、REDUNDANT、COMPACT

	修改行格式
		ALTER TABLE table_name ROW_FORMAT = DEFAULT
	修改过程注意事项：
		fixed--->dynamic: 这会导致CHAR变成VARCHAR
		dynamic--->fixed: 这会导致VARCHAR变成CHAR
*/
/*
	查看已有表的所有字段的注释呢
		show full columns from test;
	创建表的时候写注释
		create table test1 ( 
    		field_name int comment '字段的注释' 
		)comment='表的注释'; 
	修改表的注释
		alter table test1 comment '修改后的表的注释';
	修改字段的注释
		alter table test1 modify column field_name int comment '修改后的字段注释'; 
		-- 注意：字段名和字段类型照写就行
	查看表注释的方法
		-- 在生成的SQL语句中看 
		show  create  table  test1; 
		-- 在元数据的表里面看
		use information_schema; 
		select * from TABLES where TABLE_SCHEMA='my_db' and TABLE_NAME='test1' \G
	查看字段注释的方法
		-- show 
		show  full  columns  from  test1; 
		-- 在元数据的表里面看 
		select * from COLUMNS where TABLE_SCHEMA='my_db' and TABLE_NAME='test1' \G
*/
CREATE TABLE student_info IF NOT EXISTS (
	id int(10) NOT NULL AUTO_INCREMENT COMMENT '主键id',
	student_name CHAR(4) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT NULL COMMENT '学生姓名',
	student_number int(10) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT NULL COMMENT '学生学号',
	student_sexy ENUM('男','女') CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT NULL COMMENT '性别'
	student_phone_number int(11) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT NULL COMMENT '手机号码',
	home_address VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT NULL COMMENT '家庭地址',
	PRIMARY KEY (student_number) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '学生信息' ROW_FORMAT = DYNAMIC;

DROP TABLE IF EXISTS teacher_info;
CREATE TABLE teacher_info IF NOT EXISTS (
	id int(10) NOT NULL AUTO_INCREMENT COMMENT '主键id',
	teacher_name CHAR(4) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT NULL COMMENT '教师姓名',
	teacher_number int(10) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT NULL COMMENT '教师号',
	teacher_sexy ENUM('男','女') CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT NULL COMMENT '性别'
	teacher_phone_number int(11) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT NULL COMMENT '手机号码',
	PRIMARY KEY (teacher_number) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '教师信息' ROW_FORMAT = FIXED;

DROP TABLE IF EXISTS score;
CREATE TABLE score IF NOT EXISTS (
	id int(10) NOT NULL AUTO_INCREMENT COMMENT '主键id',
	student_number int(10) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT NULL COMMENT '学生学号',
	subject CHAR(15) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT NULL COMMENT '课程名',
	subject_number int(5) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT NULL COMMENT '课程号'
	middle FLOAT() CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT NULL COMMENT '期中成绩',
	final FLOAT() CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT NULL COMMENT '期末成绩',
	Overall FLOAT() CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT NULL COMMENT '总评',
	GPA DOUBLE() CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT NULL COMMENT '绩点',
	PRIMARY KEY (id) USING BTREE,
	FOREIGN KEY (student_number) REFERENCES student_info (student_number)
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '学生成绩表' ROW_FORMAT = FIXED;

DROP TABLE IF EXISTS subject;
CREATE TABLE subject IF NOT EXISTS (
	id int(10) NOT NULL AUTO_INCREMENT COMMENT '主键id',
	subject CHAR(15) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT NULL COMMENT '课程名',
	subject_number int(5) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT NULL COMMENT '课程号',
	teacher_number int(10) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT NULL COMMENT '教师号',
	PRIMARY KEY (subject_number) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '课程信息表' ROW_FORMAT = FIXED;

DROP TABLE IF EXISTS DataType;
CREATE TABLE DataType (
	id01 CHAR(4),
	id02 ENUM('男', '女'),
	id03 TEXT,
	id04 TINYTEXT,
	id05 MEDIUMTEXT,
	id06 LONGTEXT,
	id07 SET('A','B','C','D'),
	id08 VARCHAR(10),

	id09 BIT,
	id10 BOOLEAN, -- id101 bool,
	id11 REAL,
	id12 DECIMAL, -- id121 DEC,
	id13 FLOAT,
	id14 DOUBLE,
	id15 TINYINT,
	id16 SMALLINT,
	id17 MEDIUMINT,
	id18 INT(10),
	id19 INTEGER(10),
	id20 BIGINT,

	id21 DATE,
	id22 TIME,
	id23 DATETIME,
	id24 TIMESTAMP,
	id25 YEAR,

	id26 TINYBLOB,
	id27 BLOB,
	id28 MEDIUMBLOB,
	id29 LONGBLOB
);

SET FOREIGN_KEY_CHECKS = 1;