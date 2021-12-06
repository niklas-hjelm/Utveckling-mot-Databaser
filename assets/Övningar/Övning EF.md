# Utveckla en databasapp med Entity Framework Core
I denna övning utvecklar vi en applikation i C# som använder Entity Framework Core
för att låta användaren läsa och uppdatera data i en databas. Ni väljer själva om ni
vill göra en Console- eller WPF-App, så länge funktionaliteten är på plats.
Ni kan välja på ett av de föreslagna projekten nedan, eller hitta på en egen idé och
skapa en databas med code first och migrations.
## Förslag 1
Skriv en applikation kopplad mot databasen för bokhandel som ni skapade i lab2.
Användaren ska kunna lista lagersaldo för de olika butikerna, samt
kunna lägga till och ta bort böcker från butikerna. När man lägger till böcker ska
man kunna välja från samtliga böcker som redan finns i sortimentet (boktabellen).
Användaren ska dessutom kunna lägga till nya titlar i sortimentet,
och då kunna välja bland befintliga författare. Man ska även kunna lägga till nya
författare. När man lägger in nya böcker/författare måste man kunna mata in all
data om dessa, som t.ex antal sidor, pris, och utgivningsdatum. Man ska även
kunna redigera och ta bort titlar och författare.
## Förslag 2
Skriv en applikation kopplad mot schema music i everyloop.
Användaren ska kunna skapa nya, ta bort, samt modifiera befintliga
playlists genom att välja från biblioteket av låtar (från tabellen tracks).
Användaren ska dessutom kunna lägga in nya artister, album och
låtar, samt redigera och ta bort dessa. Förutom titlar ska man kunna se och
redigera längden på låtarna. 
## Egna projekt
Ni kan föreslå egna projekt, men kom ihåg att ni i så fall ska beskriva idén och
omfånget och få den godkänd av mig innan ni påbörjar utvecklingsarbetet.
Minst två tabeller och att användaren både kan läsa
och uppdatera data i databasen på något sätt.
Samt ytterligare någon eller några tabeller och mer funktionalitet. Se
förslag 1 och 2 ovan för att få en idé om hur stort omfånget på projektet bör vara.
Några förslag på idéer:
App där man kan bygga ihop lekar av pokemon-/magic-kort från en databas.
Frågespel där man får 4 alternativ, och kan lägga in egna frågor i olika kategorier.
Kokbok-app där användare kan lägga in recept och kommentera och betygsätta. 