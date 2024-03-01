create or alter function getDeepartmentCount()
returns nvarchar(max)
as 
begin 
	declare @c as int;
	select @c=count(*) from department;
	return 'Total No. of Department is: '+cast(@c as nvarchar(max));
end;


	  


























