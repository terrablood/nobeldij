1. Készítsen új adatbázist nobeldij néven!
 A mellékelt adattáblákat importálja az adatbázisba iro és fold néven! 
 A txt típusú adatállományok tabulátorokkal tagoltak, és az első soruk tartalmazza a mezőneveket.

-

2. Beolvasás után ellenőrizze, illetve állítsa be a megfelelő adattípusokat és kulcsokat! 
 A fold táblába ne, de az iro táblába vegyen fel új azonosító mezőt!


-

3. Lekérdezéssel listázza ki évszám szerint növekvően az 1960 és 1970 között irodalmi Nobel-díjat nyert írók nevét!
 A vizsgált időszakba a határok is beletartoznak. (A)

select szemely
from i
where ev between year(1960) and year(1970)
order by ev
;

4. Sorolja fel lekérdezéssel Franciaország Nobel-díjas íróit! (B)

select szemely
from i as i, f as f
where i.Azonosító = f.azon and f.orszag = "Franciaország"
;

5. Adja meg azokat az éveket (mindegyiket egyszer), amikor többen, azaz megosztva kapták a díjat!
 Az évszámokat és az adott évben díjazottak számát jelenítse meg, más mező ne jelenjen meg a lekérdezésben!(C)

select ev, szemely
from i
group by ev
where count(ev) > 1
;

6. Lekérdezéssel határozza meg kontinensenként a díjazottak számát csökkenő sorrendben! (D)

select kontinens, szemely
from i 
group by kontinens
order by count(kontinens)
;

7. Készítsen lekérdezést, amely meghatározza azokat a díjazottakat, akik Pablo Neruda költővel azonos kontinensen születtek!
 Az eredményben a költő neve is szerepelhet. (E)

select i2.szemely
from i as i, f as f, i as i2, f as f2
where i.szemely = "Pablo Neruda" and i.Azonosító = f.azon and i2.Azonosító <> i.Azonosító and 2.Azonosító = f2.azon and f.kontinens = f2.kontinens
group by i2.nev
;

8. Adjon választ lekérdezéssel arra a kérdésre, hogy mely országok írói kaptak több Nobeldíjat Dániánál!
 A válaszban az országok neve és a díjak száma szerepeljen! (F)

select orszag iff(count orszag > (select count(orszag) from f where orszag = "Dánia")), count(orszag) iff(count orszag > (select count(orszag) from f where orszag = "Dánia")),
from f
group by orszag
;

9. Készítsen lekérdezés alapján jelentést az írókról és a Nobel-díj elnyerésének évéről kontinensenként,
 azon belül országonként is csoportszinteket alkotva! (G)

 select i.ev, i.szemely, f.orszag, f.kontinens
 from i as i, f as F
 where i.Azonosító = f.azon
 order by ev 
 group by kontinens
 ;
 