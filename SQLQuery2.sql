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


