--create database course;
/*create table course(
courseId smallint identity(1,1) primary key,
courseName nvarchar(50) not null unique
);*/
/*select * from course;
insert into course (courseName) values
('Science'),
('Arts'),
('Engineering'),
('Business');
select * from course order by courseId;*/

/*create table students(
stdId int identity (101 ,1)primary key,stdName nvarchar(50) not null,
stdRoll tinyint check(stdRoll > 0 and stdRoll < 100) not null,
stdAddress nvarchar(30) null, sex bit not null, -- 0 female and 1 for male
fee decimal (12,2) default(2000),
facId smallint foreign key references
course(courseId)not null );*/

select * from students;

-- inserting data into students table 
insert into students (stdName, stdRoll, stdAddress, sex, fee, facId) values 
('john Doe', 25, '123 main st', 1, 2500.50, 1 ),
('hari prasd', 26, 'kathmandu', 1, 50000.55, 2);




