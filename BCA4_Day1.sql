-- create database BCA4;
use BCA4;
/*create table Faculty(
facultyID smallint primary key,
facultyName nvarchar(30) not null unique
);*/
/*select * from Faculty;
insert into Faculty(facultyid, facultyname) values(1, 'BCA');--insert BCA
insert into Faculty(facultyid, facultyname) values(2, 'BIT');--insert BIT
insert into Faculty(facultyid, facultyname) values(3, 'BBA');--insert BBA
select * from faculty order by facultyId;*/

/*create table student(
stdid int identity(101, 1) primary key,
stdname nvarchar(50) not null,
stdroll tinyint check(stdroll>0 and stdroll>100)not null
);*/

select * from student;
insert  into student(stdid, stdname, stdroll) values
(111, 'Ashish', 6),(112, 'prasanga', 5),(113, Abijeet, 3);



