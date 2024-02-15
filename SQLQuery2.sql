select name from sys.databases;
create database ExampleDb;

use ExampleDb;
select name from sys.tables;

create table course(
CourseId int primary Key,
CourseName nvarchar(50) not null unique,
CreditHour decimal(5,2) default(4) not null,
remarks nvarchar(max) null
);

insert into Course(courseId,courseName)
values(1, 'DotNet');

select * from course;

update Course set remarks = 'Nothing';
alter table Course alter column remarks nvarchar(max) not null;

insert into Course(courseId,courseName, remarks)
values(2, 'JavaScript', 'DOM and BOM');

insert into Course(courseId,courseName, remarks, creditHour)
values(3, 'Network', 'Network Programming', 3);

-- create another table named Subject

--create table [Subject]	--Subject is pre-defined so it should be kept in bracket
create table CourseDetail(
id int,
cName nvarchar(100) not null,
fee decimal(12,2) not null check(fee>=1000),
duration smallint not null,
cId int not null foreign key references Course(courseId),
primary key(id),
unique(cName),
);

select * from CourseDetail;

insert into CourseDetail(id, cName, fee, duration, cID) values
(1, 'Asp.Net Mvc', 5000, 90, 1),
(2, 'Winform Application', 3000, 45, 1),
(3, 'DotNet MAUI', 10000, 100, 1),
(4, 'Oracle DBA', 7000, 60, 2),
(5, 'PL/SQL Developer', 8000,90,2),
(6, 'CCNA', 6000, 90,3)

select * from course inner join coursedetail on courseid = cid;

select courseName, count(*) course_count from 
course inner join coursedetail on courseid=cid group by courseName;

insert into course(courseId, courseName, creditHour, remarks)
values(4, 'java', 2, 'OPP')

select courseName,
(select count(*) from courseDetail where cid = course.courseId) [count] from course;

create table Trainee(
traineeId bigint,
traineeName nvarchar(40) not null,
traineePhone nvarchar(20) not null check(len(traineePhone) = 10),
referanceSource nvarchar(255),
constraint pk_trainee primary key(traineeId)
);

insert into Trainee values (101, 'Raman', '9846837534', 'sayam');

insert into Trainee (traineeId, traineeName, traineePhone, referanceSource) values
(102, 'Taman', '9846837538', 'Rayam'),
(103, 'Baman', '9846837539', 'Bayam'),
(104, 'Saman', '9846837530', 'Tayam'),
(105, 'Paman', '9846837531', 'Payam'),
(106, 'Yaman', '9846837532', 'Layam'),
(107, 'Baman', '9846837533', null);

select * from Trainee;

-- new table

create table Enrollment(
eId bigint not null,
enrollDate date default(getdate()),
traineeId bigint not null,
cId int not null,

);

--drop table Enrollment
alter table Enrollment add constraint pk_enroll primary key(eId);

alter table Enrollment add constraint uk_enroll unique(traineeId, cId);

alter table Enrollment add constraint fk_trainee_enroll foreign key(traineeId) references Trainee(traineeId);

alter table Enrollment add constraint fk_course_enroll foreign key(cId) references courseDetail(Id) on delete cascade on update cascade;

insert into Enrollment(eid,traineeid,cid) values
(1,101,1),
(2,101,2),
(3,101,5),
(4,103,2),
(5,104,4),
(6,105,2),
(7,106,1),
(8,106,5),
(9,106,6),
(10,107,1),
(11,107,4),
(12,107,5)

select * from Enrollment;

select name from sys.views  -- list akk views in the database

create view traineeView as
select traineeName,cName as Course_Name, courseName as Main_Course,fee,enrollDate from Trainee inner join Enrollment 
on Trainee.traineeId=Enrollment.traineeId inner join CourseDetail on Enrollment.cId=CourseDetail.Id inner join Course 
on CourseDetail.cId=Course.CourseId;

select * from TraineeView;
select * from TraineeView where fee between 4000 and 8000;
select * from TraineeView where fee >= 4000 and fee <= 8000;
select * from TraineeView order by fee desc offset 5 rows fetch next 5 rows only;


-- stored procedure
create procedure getAllCourse
as 
begin
	select * from course
end;
select name from sys.procedures;

Execute getAllCourse

-- proc and procedure is same 
create or alter proc AddCourse(@cid int, @cname nvarchar(50), @chour decimal(5,2)=4, @rem nvarchar(max)='No Remarks')
as begin
	set nocount on; 
	insert into Course(courseId, courseName, creditHour, remarks)
	values
	(@cid, @cname,@chour, @rem);
	print 'New Course added successfully.' 
end;

exec AddCourse @cid=5, @cname='AI', @rem='AI is powerful' ;

drop procedure getAllCourse;
select name from sys.procedures;

create procedure getCourseCount(@ct as int output)
as 
begin 
	/*
	select * from course
	set @ct=@@ROWCOUNT;		--assign a value to the variable
	[ OR down code is same ]
	*/
	select @ct=count(*) from Course;
end;


--select @@version  [version of sql]

declare @courseCount as int;	--variable declaration
exec getCourseCount @courseCount output;
print 'No.of Course: ' + cast(@courseCount as nvarchar);

create or alter procedure GetTraineeList (@page int=1, @size int=5) as 
begin 
	select * from TraineeView order by TraineeName
	offset (@page-1)*@size rows fetch next @size rows only;
end;
exec getTraineeList 2;

--trigger
create table CourseLog(
logId int primary key identity(1,1),
courseName nvarchar(50) not null,
creditHour decimal(5,2) not null,
remarks nvarchar(max) not null,
logDate date default(getdate()) not null,
logType nvarchar(20) check(logType='Inserted' or logType='Deleted')
);
create trigger tgr_course_add on Course after insert as
begin 
	insert into CourseLog(courseName,creditHour,remarks,logtype) 
	select courseName,creditHour,remarks,'Inserted' from inserted;
end;
create trigger tgr_course_remove on course after delete as
begin 
	insert into CourseLog(courseName,creditHour,remarks,logtype) 
	select courseName,creditHour,remarks,'Deleted' from deleted;
end;
create trigger tgr_course_update on Course after update as
begin 
	insert into CourseLog(courseName,creditHour,remarks,logtype) 
	select courseName,creditHour,remarks,'inserted' from inserted
end;
select * from CourseLog;
select * from course;
insert into course values(8,'Accounting',2,'Tally package');
delete from course where courseid=4;
update course set coursename='Programming Language', creditHour=4 where courseId=6;

--[the below commented are not comment they are the function's]
-- disable trigger all on Course;
-- enable trigger tgr_course update on Course;
-- drop trigger tgr_course_update;

create trigger tgr_course on course on course after insert, update, delete
as 
begin 
	insert into CourseLog(courseName,creditHour,remarks,logtype) 
	select courseName,creditHour,remarks,'Deleted' from deleted union select sourseName,
	creditHour, remarks, 'inserted' from insertion;
end;

select * from course;
select * from courseLog;
delete from course where courseid=6;

create table NewCourse(
CourseId int primary Key,
CourseName nvarchar(50) not null unique,
CreditHour decimal(5,2) default(4) not null,
remarks nvarchar(max),
isApproved bit not null default(0)
);

create or alter trigger tgr_course_register on Course 
instead of insert
as
begin
	insert into NewCourse(courseId, courseName, creditHour, remarks)
	select * from inserted;
end;
insert into newcourse values(9, 'graphics Design', 2, 'Using insted of trigger')

select * from NewCourse;	

