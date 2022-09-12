/*
	给表新增列，例如：
	给表student_info新增一个MEDIUMBLOB数据类型的picture列
*/
ALTER TABLE student_info
ADD picture MEDIUMBLOB;

/*
	给表删除列，例如：
	给表student_info删除一个MEDIUMBLOB数据类型的picture列
*/	
ALTER TABLE student_info
DROP picture MEDIUMBLOB;

/*
	ALTER TABLE的常见用图就是定义外键，例如：
	给表subject创建一个连接到表student_info的student_number列上的外键
*/
ALTER TABLE subject
ADD CONSTRAINT fk_subject_studentinfo
FOREIGN KEY (student_number) REFERENCES student_info (student_number);

/*
	使用ALTER TABLE要极为小心，应该在进行改动前做一个完整的备份（模式和数据的备份）
	数据库的更改是不能撤销的，如果增加了不需要的列，可能不能删除它们，
	同样的，如果删除了不应该删除的列，可能会丢失该列中的所有数据
*/

/*
	重命名表，例如：
	将表名student_info修改为studentInfo
*/
RENAME TABLE student_info TO studentInfo;

-- 同时修改多个表名
RENAME TABLE student_info TO studentInfo,
			 teacher_info TO teacherInfo,
			 subject TO subjectInfo;