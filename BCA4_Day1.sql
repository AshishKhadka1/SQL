-- create database BCA4;

use BCA4;

create table Faculty(
facultyID smallint primary key,
facultyName nvarchar(30) not null unique
);

select * from Faculty;
insert into Faculty(facultyid, facultyname) values(1, 'BCA');--insert BCA
insert into Faculty(facultyid, facultyname) values(2, 'BIT');--insert BIT
insert into Faculty(facultyid, facultyname) values(3, 'BBA');--insert BBA
select * from faculty order by facultyId



create table students(
std_id int primary key,
stdname nvarchar(50) not null,
stdroll tinyint check(stdroll>0 and stdroll>100)not null
);


--   day 2

--drop table Faculty;
--create database Facultydb;
--drop database Facultydb;
--select name from sys.tables;


--select * from students;

insert into students(std_id, stdname, stdroll) Values (1, 'aman', 101);
insert into students(std_id, stdname, stdroll) values (2, 'sayam', 102);
insert into students(std_id, stdname, stdroll) values (3, 'ashish', 103),(4, 'prasanga', 104);


select * from students;
select count(*) from students; -- returns the total count of rows
select count(distinct stdname)from students; -- distinct doesn't count the repeated text
select distinct stdroll from students;

--execute sp_rename'student','students';

select * from students;
select top 1* from students; -- select top 1 from table








