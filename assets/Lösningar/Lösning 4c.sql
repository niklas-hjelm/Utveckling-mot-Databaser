--Skapa en SP som tar ett startdatum och ett slutdatum som
--parameterar och visar (select) en kolumn med datum och en
--kolumn med veckodag f�r alla dagar mellan (inklusive) start- och
--slutdatumet.

CREATE PROCEDURE spGetDays
@startDate date,
@endDate date
as
	DECLARE @currentDate date = @startDate
	DECLARE @tempTable TABLE([date] date, [weekday] nvarchar(9))

	WHILE @currentDate <= @endDate
	BEGIN
		INSERT INTO @tempTable VALUES(@currentDate, DATENAME(WEEKDAY, @currentDate))
		SET @currentDate = DATEADD(DAY, 1, @currentDate)
	END
	SELECT * FROM @tempTable ORDER BY date
GO

CREATE PROC spGetWeekDayFromDate
    @StartDate date,
    @EndDate date
AS
    WITH tmpTable AS
    (
        SELECT
            @StartDate AS dt
        UNION ALL
        SELECT DATEADD(dd, 1, dt)
            FROM tmpTable
            WHERE DATEADD(dd, 1, dt) <= @EndDate
    )
    SELECT
        dt AS [Date],
        DATENAME(weekday, dt) AS [Weekday]
    FROM tmpTable
	OPTION (MAXRECURSION 0)
GO

set statistics time on
EXEC spGetWeekDayFromDate '1921-10-12','2021-10-15'
set statistics time off
GO

set statistics time on
EXEC spGetDays '1921-10-12','2021-10-15'
set statistics time off	