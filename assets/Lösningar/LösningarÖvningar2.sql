-- Ta ut (select) en rad f�r varje (unik) period i tabellen �Elements� med
-- f�ljande kolumner: �period�, �from� med l�gsta atomnumret i perioden,
-- �to� med h�gsta atomnumret i perioden, �average isotopes� med
-- genomsnittligt antal isotoper visat med 2 decimaler, �symbols� med en
-- kommaseparerad lista av alla �mnen i perioden. 

select * from Elements order by Period

select
	Period,
	min(number) as 'From',
	max(number) as 'To',
	format(avg(cast (stableisotopes as float)), 'N2') as 'Average Isotopes',
	format(sum(cast(stableisotopes as float)) / count(stableisotopes), 'N2') as 'Average Isotopes',
	format(sum(cast(isnull(stableisotopes, 0) as float)) / count(isnull(stableisotopes, 0)), 'N2') as 'Average Isotopes',
	format(sum(cast(stableisotopes as float)) / count(*), 'N2') as 'Average Isotopes',
	string_agg(symbol, ', ') as 'Symbols'
from
	Elements
group by 
	Period;

--select count(*), count(Stableisotopes), count(Boilingpoint) from elements


-- F�r varje stad som har 2 eller fler kunder i tabellen Customers, ta ut
-- (select) f�ljande kolumner: �Region�, �Country�, �City�, samt
-- �Customers� som anger hur m�nga kunder som finns i staden. 

select
	Region,
	Country,
	City,
	count(City) as 'Customers'
from
	company.customers
group by 
	Region, Country, City
having
	count (City) >= 2 ;



-- Skapa en varchar-variabel och skriv en select-sats som s�tter v�rdet:
-- �S�song 1 s�ndes fr�n april till juni 2011. Totalt
-- s�ndes 10 avsnitt, som i genomsnitt s�gs av 2.5
-- miljoner m�nniskor i USA.�, f�ljt av radbyte/char(13), f�ljt av
-- �S�song 2 s�ndes �� osv.
-- N�r du sedan skriver (print) variabeln till messages ska du allts� f� en rad
-- f�r varje s�song enligt ovan, med data sammanst�llt fr�n tabellen
-- GameOfThrones.
-- Tips: Ange �sv� som tredje parameter i format() f�r svenska m�nader

declare @text nvarchar(max) = '';

select 
	@text += 'S�song ' + convert(nvarchar, Season) + ' s�ndes fr�n '
	         + format(min([Original air date]), 'MMMM', 'sv') + ' till ' 
	         + format (max([Original air date]), 'MMMM yyyy', 'sv') + '. Totalt s�ndes '
             + convert(nvarchar, count(Season)) + ' avsnitt, som i genomshitt s�gs av '
             + format (avg([U.S. viewers(millions)]), 'N1') + ' miljoner m�nniskor i USA.' 
			 + char(13)
from 
	GameOfThrones
group by 
	Season;

print @text;



-- Ta ut (select) alla anv�ndare i tabellen �Users� s� du f�r tre kolumner:
-- �Namn� som har fulla namnet; ��lder� som visar hur m�nga �r personen
-- �r idag (ex. �45 �r�); �K�n� som visar om det �r en man eller kvinna.
-- Sortera raderna efter f�r- och efternamn.

Select
	FirstName + ' ' + LastName 'Name',
	CAST(DATEDIFF(day, CONVERT(datetime2, '19' + LEFT(ID, 6)), Getdate()) / 365.25 as int),
	Year(Getdate()) - ('19' + left(id, 2)) 'Age',
	ID,
	iiF(SUBSTRING(ID ,len(id)-1,1) % 2 <> 1, 'Female', 'Male') 'Gender'
from
	users
order by
	FirstName,
	LastName


-- Ta ut en lista �ver regioner i tabellen �Countries� d�r det f�r varje region
-- framg�r regionens namn, antal l�nder i regionen, totalt antal inv�nare,
-- total area, befolkningst�theten med 2 decimaler, samt
-- sp�dbarnsd�dligheten per 100.000 f�dslar avrundat till heltal. 

select * from Countries order by Region

select 
    Region,
    COUNT(Country) 'Countries',
    SUM(CAST([Population] as bigint)) 'Population',
    FORMAT(SUM(CAST([Area (sq# mi#)] as bigint)), 'N0') 'Total area',
    AVG(CAST(replace([Pop# Density (per sq# mi#)], ',', '.') as float)) 'Population density',
	SUM(CAST([Population] as bigint)) / SUM(CAST([Area (sq# mi#)] as bigint))

--    AVG(CAST([Infant mortality (per 1000 births)] as bigint))
from 
    Countries
group by 
    Region

--select cast(replace('48,5', ',', '.') as float)

--select replace('48,5', ',', '.')

select * from Airports