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

 insert into Enrollment(eId, traineeId, cId) values
 (1, 101, 1),
 (2, 102, 2),
 (3, 103, 3),
 (4, 104, 4),
 (5, 105, 5),
 (6, 106, 6),
 (7, 107, 7),
 (8, 108, 8)



 select traineeName, cName as Course_Name, courseName as Main_Course, fee, enrollDate from Trainee inner join enrollment on Trainee.traineeId=Enrollment.traineeId inner join courseDetail on Enrollment.cId=CourseDetail.Id;





