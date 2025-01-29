
--select name from sys.databases;
--create database test;
--use test;

--create table Test2(
--TestId int primary key identity(1,1),
--TestDescription nvarchar(50) ,
--TestedBy nvarchar(50),);


--insert into Test2(TestDescription,TestedBy)
--values('Testing89','Raameshos'),('testing90', 'ram'),('testing91','hari'),('testing92','sita');


select * from Test2
	--delete from Test2;  
	--[ here everything gets deleted and down program gets error ]

update test2 set TestedBy='Ramesh';

	--alter table Test drop column TestDescription  
	--[error is shown]

	--alter table Test add TestedBy nvarchar(50)

alter table Test2 alter column TestedBy nvarchar(50) not null;

select count (*) from test2;  
	-- everything from the tabe gets counted

select count (distinct testedBy) from test2;   
	--to remove duplicate and only select one

select distinct TestedBy from Test2;  --
	-- update Test2 set TestedBy 'Ram' where TestId>1;   [here also error is shown]

select count (distinct testedBy) as Tester_count from Test2;
	--to give heading from count

--execute sp_rename 'Test2', 'Test23';
	--to change name [ don't run this above line two times otherwise test 2 is shown error besause it's name is changed to test 23]
--execute sp_rename 'test23','test2';
	--execute this after the above line code is shown error

--execute sp_rename 'Test2.TestedByy', 'TestedBy','COLUMN';
	--to change column 


--left to add date ... i have removed the column date from the table 
	--change to next table if only table in need to copy 

--select * into newTest from Test2 where testid=0;
	--if to copy data 
--select * into newTest2 from Test2; 

--select * from newTest2

-- to get data of highest id record 
select top 50 percent * from test2;



use BCA4;
select name from sys.tables;
select * from students;
update students set stdroll = 102 where std_id = 1 or std_id = 4;


	wildcard character: % and _
	% means zero or many unknown characters
	_ means one and only one unknown character

use faculty;
select * from sys.tables;
select * from student;
select * from course;

-- join topic read

