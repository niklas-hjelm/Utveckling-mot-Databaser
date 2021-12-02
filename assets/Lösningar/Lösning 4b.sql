--Skapa en tabell ”ActiveUsers” med all data från ”Users”. Skapa en
--tabell ”DeletedUsers” med samma struktur men utan några rader.
--Skapa sedan en stored procedure ”DeleteUser” som tar ett
--username som argument. När man exekverar SP:n så ska de rader
--som matchar username i ”ActiveUsers” flyttas över till
--”DeletedUsers”. SP:n ska returnera hur många rader som flyttats.

--select * into ActiveUsers from users

--select * into DeletedUsers from users where ID= ''

--select top 0 * into DeletedUsers from users

--select * into DeletedUsers from users
--truncate table DeletedUsers
--delete from DeletedUsers

--select * from ActiveUsers
--select * FROM DeletedUsers


--När man exekverar SP:n så ska de rader
--som matchar username i ”ActiveUsers” flyttas över till
--”DeletedUsers”. SP:n ska returnera hur många rader som flyttats.
Alter procedure spDeleteUser
@username nvarchar(6),
@rowsAffected int = 0 OUTPUT
as
	insert into DeletedUsers 
		select * from ActiveUsers 
		where UserName = @username

	delete from ActiveUsers 
		where UserName = @username
	set @rowsAffected = @@ROWCOUNT
return
GO

DECLARE @test int = 0

EXEC spDeleteUser 'milalb', @rowsAffected = @test OUTPUT
select @test
select * from DeletedUsers where UserName = 'milalb'















	--declare @usersToDelete table
	--(
	--	ID nvarchar(12),
	--	UserName nvarchar(6),
	--	[Password] nvarchar(100),
	--	FirstName nvarchar(20),
	--	LastName nvarchar(20),
	--	Email nvarchar(100),
	--	Phone nvarchar(20)
	--);

	--insert into @usersToDelete
	--select	ID, 
	--		UserName, 
	--		[Password], 
	--		FirstName, 
	--		LastName, 
	--		Email, 
	--		Phone  from ActiveUsers where UserName = @username

	--insert into DeletedUsers select * from @usersToDelete
	--delete from ActiveUsers where UserName = @username