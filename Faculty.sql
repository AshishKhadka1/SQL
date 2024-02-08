use faculty;
select name from sys.tables;
select * from course;
select * from student;
select name from sys.views;
select stdName, stdRoll, stdAddress, sex, fee, facid from student,course where facid = courseId;

-- create view using above query [this is a comment and the others below commented are a part of code]

--create view studentView as
select stdName, stdRoll, stdAddress, Sex, Fee, facid from student inner join course on facid = courseId;

select * from studentView;
--create view studentNameList as select stdName from Student

select * from studentNameList;
create or alter view studentNameList as select row_number() over (order by stdName) as SN, stdName from Student;

--drop view studentNameList;
select * from studentNameList where SN=1;
create view stdView as select stdId, stdName, stdRoll, sex, facid from student;
insert into stdView (stdname, stdroll, sex, facid) values
('muskan', 12, 1,4);






