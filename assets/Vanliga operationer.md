### Datatype
**SELECT** len(firstname), firstname **FROM** users</br></br>
**SELECT** len(firstname), DATALENGTH(firstname), firstname **FROM** users -- stränglängd och datalängd</br>
**SELECT** IDENTITY(int, 1, 1) as Ident, * into users2 **FROM** users -- skapa identitykolumn med **SELECT** into</br>

### Datetime
**SELECT** getdate() -- Dagens datum och tid</br>
**SELECT** getUTCdate() -- Dagens datum och tid UTC (GMT)</br>
**SELECT** dateadd(year, 3, dateadd(hour, 2, getdate())) -- addera på tid</br>
**SELECT** dateadd(year, -5, '2018-10-12 15:10:00.13') -- ett exempel till..</br>
**SELECT** datediff(year, '1981-02-04', getdate()) -- diff mellan två datum</br>
**SELECT** DATE **FROM** PARTS (1981, 2, 4);</br>
**SELECT** isdate('2018-13-12 15:10:00.13') -- Korrekt datum?</br>
set datefirst 1
**SELECT** datepart(WEEKDAY, getdate()) -- Ta ut del av datetime som int</br>
--year, month, week, day, hour, minute, second, millisecond</br>
--dayofyear, quarter, weekday</br>

### Math function
**SELECT** abs(-5)</br>
**SELECT** sin(1), sin(1 + 2 * pi()), cos(1), tan(1)</br>
**SELECT** DEGREES(pi()) -- omvandla radianer till grader.</br>
**SELECT** Radians(180.0) -- omvandla grader till radianer.</br>
**SELECT** FLOOR(4.7), CEILING(4.7), ROUND(4.743534, 2)</br>
**SELECT** power(10, 3) -- Upphöjt</br>
**SELECT** rand(123), rand(), rand() -- random värde mellan 0 och 1</br>
**SELECT** round(rand() * 4 + 3.5, 0) -- random värde mellan ?</br>
**SELECT** sign(-15), sign(0), sign(37) -- plus eller minus?</br>
**SELECT** square(3) -- Kvadrat</br>
**SELECT** sqrt(9) -- Square root</br>

### Logical
**SELECT** choose(1, 'röd', 'grön', 'blå', 'vit'); -- välj ett värde genom index.</br>
**SELECT** iif(1=2, 'japp', 'nope') -- if sats som funktion.</br>

### String
**SELECT** ascii('A') -- Ger ASCII-koden för ett tecken</br>
**SELECT** char(65) -- Ger tecknet för angiven ASCII-kod</br>
**SELECT** unicode(N'庪') -- Ger unicode för ett tecken</br>
**SELECT** nchar(24234) -- Get tecknet för given unicode</br>
**SELECT** concat('röd', 'grön', 'blå') -- Lägg ihop strängar .. (konvererar automatiskt andra datatyper till varchar)</br>
**SELECT** 'röd' + 'grön' + 'blå' -- ... man kan även göra så här!</br>
**SELECT** concat_ws(', ', 'röd', 'grön', 'blå') -- concat With Separator</br>
**SELECT** format(getdate(), 'yyyy-MM-dd') -- formatera till nvarchar med c# formats</br>
**SELECT** left('Fredrik', 3), right('Fredrik', 4) -- första X bokstäver från vänster, respektive höger.</br>
**SELECT** len('Fredrik') -- längd på sträng</br>
**SELECT** lower('Fredrik'), upper('Fredrik') -- lower och uppercase</br>
**SELECT** '-' + ltrim('   X    ') + '-', '-' + trim('    X    ') + '-', '-' + rtrim('   X    ') + '-' -- ta bort inledande och avslutande spaces</br>
**SELECT** trim('x' **FROM** 'xxxyyxxxzzzxxx') -- som trim fast med annat tecken än space</br>
**SELECT** replace('Hello world!', 'world', 'there') -- byt ut alla förekomster av sökord i sträng.</br>
**SELECT** reverse('Fredrik') -- Vänd bakochfram.</br>
**SELECT** replicate('hej', 5) -- upprepar en sträng x antal gånger</br>
**SELECT** '-' + space(5) + '-'; -- ger en sträng med x antal space/mellanslag</br>
**SELECT** stuff('Hello world!', 3, 5, 'xxx') -- klipp in en sträng i en annan.</br>
**SELECT** substring('Hello world!', 2, 3) -- del av sträng</br>
**SELECT** charindex('or', 'Hello world!') -- få ett index på första träffen på en sökning i sträng</br>

### Övrigt
**SELECT** isnull(null, 'hej')
**SELECT** isnull(dst, '-') **FROM** Airports -- ge ett alternativt värde om första är null</br>
**SELECT** coalesce(null, null, null, 'test', null, 'hej') -- ge första värdet som inte är null</br>
**SELECT** coalesce(dst, time, ICAO, IATA) **FROM** Airports -- exempel på coalesce med flera kolumner</br>
**SELECT** newid() -- generar ett GUID</br>
**SELECT** top 10 * **FROM** users order by newid() -- trick för att sortera i random ording</br>