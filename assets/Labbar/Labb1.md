# Manipulera data i befintlig databas med hjälp av SQL
Vi vill skapa nya tabeller från befintlig data i databasen ”everyloop”, och sedan
manipulera och ta ut data från dessa nya tabeller med hjälp av SQL.<br>
<br>
Laborationen redovisas i form av ett (1) SQL-script som steg för steg löser
uppgifterna i den ordning som de finns beskrivna nedan. Varje steg ska avskiljas
med en blank rad, följt av ”GO”, följt av ytterligare en blank rad. Alltså:
<br>
```sql
SELECT ...

GO

UPDATE ...

GO

Etc ...
```

## MoonMissions

Använd ”select into” för att ta ut kolumnerna ’Spacecraft’, ’Launch date’,
’Carrier rocket’, ’Operator’, samt ’Mission type’ för alla lyckade uppdrag
(Successful outcome) och sätt in i en ny tabell med namn ”SuccessfulMissions”.</br>
</br>
```sql
GO
```
</br>
I kolumnen ’Operator’ har det smugit sig in ett eller flera mellanslag före
operatörens namn skriv en query som uppdaterar ”SuccessfulMissions” och tar
bort mellanslagen kring operatör.</br>

```sql
GO
```

### För betyg väl godkänt:

I ett flertal fall har värden i kolumnen ’Spacecraft’ ett alternativt namn som står
inom parantes, t.ex: ”Pioneer 0 (Able I)”. Skriv en query som uppdaterar
”SuccessfulMissions” på ett sådant sätt att alla värden i kolumnen ’Spacecraft’
endast innehåller originalnamnet, dvs ta bort alla paranteser och deras
innehåll. Ex: ”Pioneer 0 (Able I)” => ”Pioneer 0”.</br>
```sql
GO
```
</br>
Skriv en select query som tar ut, grupperar, samt sorterar på kolumnerna
’Operator’ och ’Mission type’ från ”SuccessfulMissions”. Som en tredje kolumn
’Mission count’ i resultatet vill vi ha antal uppdrag av varje operatör och typ. Ta
bara med de grupper som har fler än ett (>1) uppdrag av samma typ och
operatör.

```sql
GO
```

## Users

Ta ut samtliga rader och kolumner från tabellen ”Users”, men slå ihop
’Firstname’ och ’Lastname’ till en ny kolumn ’Name’, samt lägg till en extra
kolumn ’Gender’ som du ger värdet ’Female’ för alla användare vars näst sista
siffra i personnumret är jämn, och värdet ’Male’ för de användare där siffran är
udda. Sätt in resultatet i en ny tabell ”NewUsers”.</br>
```sql
GO
```

Skriv en query som returnerar en tabell med alla användarnamn i ”NewUsers”
som inte är unika i den första kolumnen, och antalet gånger de är duplicerade i
den andra kolumnen.</br>
```sql
GO
```
Skriv en följd av queries som uppdaterar de användare med dubblerade
användarnamn som du fann ovan, så att alla användare får ett unikt
användarnamn. D.v.s du kan hitta på nya användarnamn för de användarna, så
länge du ser till att alla i ”NewUsers” har unika värden på ’Username’.</br>
```sql
GO
```
Skapa en query som tar bort alla kvinnor födda före 1970 från ”NewUsers”.</br>
```sql
GO
```
Lägg till en ny användare i tabellen ”NewUsers”.</br>
```sql
GO
```

### För betyg väl godkänt:

Skriv en query som returnerar två kolumner ’gender’ och ’avarage age’, och två
rader där ena raden visar medelåldern för män, och andra raden visar
medelåldern på kvinnor för alla användare i tabellen ”NewUsers”. </br>
## Redovisning
Skriv queries som löser problemen ovan och spara i en .sql fil som du döper till
ditt för- och efternamn. Exempel: "NiklasHjelm.sql”.
Ladda upp filen för inlämning på ITHSdistans.se
Kan lösas individuellt eller i mindre grupper (2-3 personer). Om ni jobbat ihop
med någon så skriv det som en kommentar när ni lämnar in på ithsdistans.

## Betygskriterier
#### För godkänt krävs:
* SQL-scriptet ska lämnas in till läraren.
* SQL-koden ska vara formaterad i ett lättläsligt format.
* Queries ska i tur och ordning lösa uppgifterna i laborationen.
* Alla delmoment ska vara avskiljda med GO för att tydligt hålla isär dem.
* Alla delmoment förutom de 2 som är märkta ”För betyg väl godkänt” ska
vara korrekt lösta.
#### För väl godkänt krävs även:
* Alla delmoment inklusive de 2 som är märkta ”För betyg väl godkänt” ska
vara lösta. 