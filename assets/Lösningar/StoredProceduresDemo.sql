
--CREATE PROCEDURE spSelectAllCustomers
--AS
--	SELECT * FROM company.customers;

--CREATE PROCEDURE spDemo @id nvarchar(30) 
--AS
--	select * from company.customers
--	where Id = @id

--CREATE PROCEDURE spDemo2 @id nvarchar(30), @comName nvarchar(max)
--AS
--	select Id from company.customers
--	where Id = @id OR CompanyName = @comName

--EXEC spSelectAllCustomers

--EXEC spDemo2 @comname = 'Trallala', @id = (select Id from company.customers)

--CREATE PROCEDURE spDemo3 @id nvarchar(30) = 'CONSH'
--AS
--	select * from company.customers
--	where Id = @id

EXEC spDemo3 @id = 'BOTTM'