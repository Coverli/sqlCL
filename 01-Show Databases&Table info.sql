-- 进入mysql命令行
/*
	-u username:用户名
	-p password:数据库密码，进入mysql的命令建议不要写密码，不安全
	-h hostname:指定连接的主机名，
	-P port:MySQL端口号，注意是大写P
	完整的命令行选项和参数列表可在CMD运行窗口输入 mysql --help 获得
*/
mysql -u username -p password -h hostname -P port

-- 进入数据库之后命令需用;或\g结束
-- 进入数据库输入help或\h可获得帮助，也可以获得特定命令的帮助例如help SELECT

-- 查看数据库
SHOW DATABASES;

-- 选择数据库
USE school;

-- 查看指定数据库下的表
SHOW TABLES;

-- 查看表列信息
SHOW COLUMNS FROM student_info;
-- MySQL支持用 DESCRIBE 作为 SHOW COLUMNS FROM 的一种快捷方式，即可以使用以下命令代替 SHOW COLUMNS FROM student_info;
DESCRIBE student_info;

-- 显示广泛的服务器状态和信息
SHOW STATUS；

-- 显示创建特定数据库的MySQL语句
SHOW CREATE DATABASES;

-- 显示创建特定表的MySQL语句
SHOW CREATE TABLES；

-- 显示授予用户
SHOW GRANTS;

-- 显示服务器错误信息
SHOW ERRORS;

-- 显示服务器警告信息
SHOW WARNING;

-- 查看数据库存储引擎
SHOW ENGINES;

-- 查看已有表的所有字段的注释
SHOW FULL COLUMNS FROM TABLE;