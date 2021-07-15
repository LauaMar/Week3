--LIKE, ANY/ALL, select into, funzioni

-- se ar.Argomento fosse una stringa del tipo 'Notizie; Viaggi; Sport
Select pub.*
from Argomento ar
inner join Pubblicazione pub
on ar.ID = pub.ArgomentoID
where ar.Argomento LIKE '%Viaggi%'

Select --*
	a.Titolo as [Titolo articolo]
	, a.DataPubblicazione as [Data di pubblicazione]
	, pub.Titolo as[pubblicato su]
From Pubblicazione pub
inner join Articolo a
on pub.ID=a.PubblicazioneID
--where LEFT(a.DataPubblicazione,4) = '2012' AND pub.Titolo ='CucinareBene'
where DataPubblicazione LIke '%2012%' AND pub.Titolo ='CucinareBene'

--copia le pubblicazioni che sono giornali in Giornali usando una tabella identica (stesse colonne, stessi nomi)
Select * into #Giornali
from Pubblicazione p
where p.TipoPubblicazioneID = 2;

Select * from #Giornali

Drop table #Giornali

Select * from #Giornali

--copia le pubblicazioni che sono giornali in Giornali usando una proiezione (tabella diversa, con diverse colonne e/o diversi nomi)
Select ID, Titolo, ArgomentoID into #Giornali
from Pubblicazione p
where p.TipoPubblicazioneID = 2;

Select *, dbo.ufnIncrement(a.Prezzo, 10) as [Incremento previsto]
from Abbonamento a

Select *
from dbo.ufnPubblicazioniPerTipo('1') pub
inner join Argomento a
on pub.argomentoID= a.ID

Select CONCAT(a.Nome, ' ', UPPER(a.Cognome)) as FullName
, SUBSTRING (a.Nome, 2,2) as Mid
from Abbonato a

Select *
from Articolo a
where a.DataPubblicazione Between dateadd(month, -1, getdate()) and getdate()

select getdate()

SELECT DATEDIFF(year, '2017/08/25', '2011/08/25') AS DateDiff;
SELECT ABS(DATEDIFF(day, '2017/08/25', '2011/08/25')) AS DateDiff
SELECT ABS(DATEDIFF(MILLISECOND, '2017/08/25', '2011/08/25')) AS DateDiff --il risultato di questa differenza in millisecondi
--non entra in un intero (parliamo di 6 anni in millisecondi)

SELECT CONVERT(datetime, '2017-08-25'); 
SELECT CONVERT(datetime, '2017-08-25 13:09'); 

--If isdate('pippo') = 1
If isdate('2021-09-09') = 1
begin
	SELECT CONVERT(datetime, '2017-08-25'); 
end