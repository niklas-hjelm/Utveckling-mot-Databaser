SELECT Title, 
		'S' + FORMAT(Season, '00') + 'E' + FORMAT(EpisodeInSeason, '00') AS Episode
FROM GameOfThrones;

SELECT Title,
CASE
    WHEN EpisodeInSeason > 9 THEN 'S0' + CAST(Season AS varchar) + 'E' + CAST(EpisodeInSeason AS varchar)
    WHEN EpisodeInSeason < 10 THEN 'S0' + CAST(Season AS varchar) + 'E0' + CAST(EpisodeInSeason AS varchar)
END AS Episode
FROM GameOfThrones;

SELECT 
    Title, 
Case
    WHEN EpisodeInSeason <= 9 THEN CONCAT('S0', Season, 'E0', EpisodeInSeason)
    WHEN EpisodeInSeason > 9 THEN CONCAT('S0', Season, 'E', EpisodeInSeason)
END AS Episode
FROM GameOfThrones;

select * into users2 from users;
select * from users2;

UPDATE users2 
SET UserName = LOWER(SUBSTRING(FirstName, 0, 3) + SUBSTRING(LastName, 0, 3))

select SUBSTRING('Fredrik', 1, 2)

UPDATE Users 
SET UserName =  LOWER(SUBSTRING(FirstName, 1, 2)) + LOWER(SUBSTRING(LastName, 1, 2));

UPDATE UsersB
SET UserName = LOWER(CONCAT(SUBSTRING("FirstName", 1, 2),SUBSTRING("LastName", 1, 2)));

UPDATE Users2
SET UserName =  LOWER(LEFT(FirstName, 2) + LEFT(LastName, 2));
SELECT * FROM Users2;


select left('Fredrik', 3)
select right('Fredrik', 3)


-- Uppdatera (kopia p�) tabellen airports s� att alla null-v�rden i kolumnerna
-- Time och DST byts ut mot �-�

--drop table airports2
select * into Airports3 from Airports
select * from Airports2

select * from Airports3

update airports2 set [time] = ISNULL([time],'-'),  dst = ISNULL(dst,'-');

UPDATE Airports2
SET Time = '-', DST = '-'
WHERE Time IS NULL OR DST IS NULL

UPDATE Airports2 SET [Time] = '-' WHERE [Time] IS NULL;
UPDATE Airports2 SET DST = '-' WHERE DST IS NULL;

UPDATE Airports
SET DST = ISNULL(DST,'-'), Time = ISNULL(Time,'-');


-- Ta bort de rader fr�n (kopia p�) tabellen Elements d�r �Name� �r n�gon av
-- f�ljande: 'Erbium', 'Helium', 'Nitrogen', 'Platinum', 'Selenium', samt alla
-- rader d�r �Name� b�rjar p� n�gon av bokst�verna d, k, m, o, eller u. 

select * into Elements2 from Elements
select * from Elements2

select * FROM
    Elements
WHERE
    Name = 'Erbium'
    or    Name = 'Helium'
    or    Name = 'Nitrogen'
    or    Name = 'Platinum'
    or    Name = 'Selenium'
    or Name like '[dkmou]%'

select *
from
    Elements2
where
Name Like 'd%' or
    Name like 'k%' or
    Name like 'm%' or
    Name like 'o%' or
    Name like 'u%' or
    Name like 'Helium%'or
    Name like 'Nitrogen%'or
    Name like 'Platinum%'or
    Name like 'Erbium%' or
    Name like 'Selenium%'

select * from Elements2 
where name in ('Erbium', 'Helium', 'Nitrogen', 'Platinum', 'Selenium') or name like '[dkmou]%';

-- Skapa en ny tabell med alla rader fr�n tabellen Elements. Den nya tabellen
-- ska inneh�lla �Symbol� och �Name� fr�n orginalet, samt en tredje kolumn
-- med v�rdet �Yes� f�r de rader d�r �Name� b�rjar med bokst�verna i
-- �Symbol�, och �No� f�r de rader d�r de inte g�r det.
-- Ex: �He� -> �Helium� -> �Yes�, �Mg� -> �Magnesium� -> �No�. 

SELECT 
    Symbol, Name,
	Symbol + '%' as 'Pattern',
    CASE
        WHEN Name LIKE Symbol + '%' then 'Yes'
        ELSE 'No'
    END AS 'ContainsSymbol'
INTO
    Elements3
FROM 
    Elements;

select * from Elements3

select Name,Symbol,
	--len(Symbol) as 'Length of symbol',
	--SUBSTRING(Name,1,len(Symbol)) as 'substring',
    case
     when SUBSTRING(Name,1,len(Symbol)) = Symbol then 'Yes'
     else 'No'
     end as "Yes/No"
--     into FinishedElement2
from
    Elements;

select * from FinishedElement2


-- Kopiera tabellen Colors till Colors2, men skippa kolumnen �Code�. G�r
-- sedan en select fr�n Colors2 som ger samma resultat som du skulle f�tt fr�n
-- select * from Colors; (Dvs, �terskapa den saknade kolumnen fr�n RGBv�rdena i resultatet). 

select Name, Red, Green, Blue into Colors2 from Colors

select * from Colors2

select 
    name, 
    '#' + format(red, 'X2') + format(green, 'X2') + format(blue, 'X2') as 'Code',
    Red,
    Green,
    Blue
from colors2;

select
    Name, Red, Green, Blue,
	CONVERT(VARBINARY(1), Red) +
    CONVERT(VARBINARY(1), Green) +
    CONVERT(VARBINARY(1), Blue))
     As Code
from
    Colors2

select convert(varbinary(1), 16)


Select Name, Red, Green, Blue,
CONVERT(VARBINARY(1), Red) +
CONVERT(VARBINARY(1), Green) +
CONVERT(VARBINARY(1), Blue)
AS Code
from Colors2;

Alter table Colors2
ADD Code VARBINARY(8)

ALTER TABLE Colors2
DROP COLUMN Code;

UPDATE Colors2
SET Code = CONVERT(VARBINARY(1), Red) +
CONVERT(VARBINARY(1), Green) +
CONVERT(VARBINARY(1), Blue)

SELECT Name, Red, Green, Blue,
+ '#' + CONVERT(VARCHAR(1000), Code, 2) 
AS Code
from Colors2;

select * from Colors2;


-- Kopiera kolumnerna �Integer� och �String� fr�n tabellen �Types� till en ny
-- tabell. G�r sedan en select fr�n den nya tabellen som ger samma resultat
-- som du skulle f�tt fr�n select * from types; 

select Integer, String into types2 from types

select * from types2

declare @Date DateTime2 = '2018-12-31 09:00:00'

select
    Integer,
    String,
    cast(Integer as float)/100 as Float,
	integer % 2,
    case
        when Integer%2=0 then '0'
        else '1'
    end as Bool,
    DATEADD(mi,Integer,DATEADD(DAY,integer,@Date)) as DateTime,
	datetime2fromparts(2019,1,Integer, 9, Integer, 0, 0, 7) as 'Date Time'
from
    types2


select 9 / 2
select 9 % 2
select 9.0 / 2.0


select datetime2fromparts(2019,1,5, 9, 12, 0, 3254, 6)



