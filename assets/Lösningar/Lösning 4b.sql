--Skapa en tabell �ActiveUsers� med all data fr�n �Users�. Skapa en
--tabell �DeletedUsers� med samma struktur men utan n�gra rader.
--Skapa sedan en stored procedure �DeleteUser� som tar ett
--username som argument. N�r man exekverar SP:n s� ska de rader
--som matchar username i �ActiveUsers� flyttas �ver till
--�DeletedUsers�. SP:n ska returnera hur m�nga rader som flyttats.

--select * into ActiveUsers from users

--select * into DeletedUsers from users where ID= ''

--select top 0 * into DeletedUsers from users

--select * into DeletedUsers from users
--truncate table DeletedUsers
--delete from DeletedUsers

--select * from ActiveUsers
--select * FROM DeletedUsers


--N�r man exekverar SP:n s� ska de rader
--som matchar username i �ActiveUsers� flyttas �ver till
--�DeletedUsers�. SP:n ska returnera hur m�nga rader som flyttats.
--create procedure spDeleteUser @username nvarchar(6)
--as
--	insert into DeletedUsers 
--		select * from ActiveUsers 
--		where UserName = @username

--	delete from ActiveUsers 
--		where UserName = @username
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

--EXEC spDeleteUser 'alvlin'

--select * from DeletedUsers where UserName = 'alvlin'