-- Create the database
CREATE DATABASE bca80;

-- Use the created database
USE bca80;

-- Create the department table
CREATE TABLE department (
    deptId INT PRIMARY KEY,
    deptName VARCHAR(50),
    stdCount INT
);

-- Insert some sample data into the department table
INSERT INTO department (deptId, deptName, stdCount) VALUES
(1, 'Department A', 0),
(2, 'Department B', 0),
(3, 'Department C', 0),
(4, 'Department D', 0),
(5, 'Department E', 0);

-- Create the student table
CREATE TABLE student (
    stdId INT PRIMARY KEY IDENTITY,
    stdName NVARCHAR(MAX),
    StdRoll SMALLINT,
    deptId INT,
    FOREIGN KEY (deptId) REFERENCES department(deptId)
);

-- Create or alter the stored procedure RegisterStudent
-- This procedure updates the student count in the department table and inserts a new student
CREATE OR ALTER PROCEDURE RegisterStudent 
    @name AS NVARCHAR(MAX),
    @roll AS SMALLINT,
    @Id AS INT
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRAN; -- transaction has started
    BEGIN TRY
        UPDATE department SET stdCount = stdCount + 1 WHERE deptId = @Id;
        INSERT INTO student (stdName, StdRoll, deptId) VALUES (@name, @roll, @Id);
        PRINT 'Record Inserted';
        COMMIT; -- transaction commit here
    END TRY
    BEGIN CATCH
        PRINT 'Error while registering student';
        ROLLBACK; -- any changes made by the transaction are rollbacked due to runtime error
    END CATCH;
END;

-- Test the stored procedure by executing it with sample data
EXEC dbo.RegisterStudent 'nabin', 12, 5;

-- Check the contents of the student and department tables after the procedure execution
SELECT * FROM student;
SELECT * FROM department;
