--create database course;
/*
create table course(
courseId smallint identity(1,1) primary key,
courseName nvarchar(50) not null unique
);
*/

/*select * from course;
insert into course (courseName) values
('Science'),
('Arts'),
('Engineering'),
('Business');
select * from course order by courseId;
*/
/*
create table student(
stdId int identity (101 ,1)primary key,stdName nvarchar(50) not null,
stdRoll tinyint check(stdRoll > 0 and stdRoll < 100) not null,
stdAddress nvarchar(30) null, sex bit not null, -- 0 female and 1 for male
fee decimal (12,2) default(2000),
facId smallint foreign key references
course(courseId)not null ),
primary key(stdid),
unique(stdRoll,facid);
*/

--select * from student;

 --inserting data into student table 
--insert into student (stdName, stdRoll, stdAddress, sex, fee, facId) values 
--('john Doe', 25, '123 main st', 1, 2500.50, 1 ),
--('hari prasd', 26, 'kathmandu', 1, 50000.55, 2);

-- day 4

--drop table student;
--create table student(
--stdId int identity(1,1),
--stdName nvarchar(50) not null,
--stdRoll tinyint not null,
--stdAddress nvarchar(30) null,
--sex bit not null,
--fee decimal(12,2) default(2000),
--facid smallint not null,
--constraint pk_student primary key(stdId)
--);

alter table student drop constraint pk_student; 
	--drop existing constraint
alter table student add constraint pk_student primary key(stdId);
	-- add new constraint
--alter table student add constraint uk_student_roll unique(stdRoll, facid);
--alter table student
--add constraint fk_std_fac foreign key(facId) references course(courseId);

--alter table student drop constraint fk_std_fac;
	--error above line
--alter table student
--add constraint fk_std_fac foreign key(facId) references course(courseId) on delete cascade; --on update cascade;

--insert into student(stdName, stdRoll, sex, facid) values ('ram', 12, 0,1);
--insert into student(stdName, stdRoll, sex, facid) values ('raman', 13, 1,2);









