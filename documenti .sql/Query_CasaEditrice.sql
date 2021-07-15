-- Q1: Dato il titolo di una pubblicazione, ricercare gli articoli pubblicati nell’anno 2012
Select *
From Pubblicazione pub
inner join Articolo a
on pub.ID=a.PubblicazioneID

Select --*
	a.Titolo as [Titolo articolo]
	, a.DataPubblicazione as [Data di pubblicazione]
	, pub.Titolo as[pubblicato su]
From Pubblicazione pub
inner join Articolo a
on pub.ID=a.PubblicazioneID
--where LEFT(a.DataPubblicazione,4) = '2012' AND pub.Titolo ='CucinareBene'
--where DataPubblicazione between '2012-01-01' and '2012-12-31' 
where YEAR(a.DataPubblicazione)=2012
AND pub.Titolo ='CucinareBene'

-- Q1 alternativa alla precedente
select
	a.Titolo as [Titolo articolo]
	, a.DataPubblicazione as [Data di pubblicazione]
	, pub.Titolo as[pubblicato su]
from 
	(Select * from Pubblicazione where titolo = 'CucinareBene') pub
	inner join
	(Select * from Articolo where DataPubblicazione between'2012-01-01' and '2012-12-31')a
	on pub.ID=a.PubblicazioneID

-- Dato il titolo di una pubblicazione, ricercare gli abbonati 

Select* from Abbonamento
Select* from Pubblicazione
Select* from Abbonamento
Select* from AbbonatoAbbonamento

Select ab.Nome, ab.Cognome
From Pubblicazione pub
inner join Abbonamento a
on a.PubblicazioneID = pub.ID
	inner join AbbonatoAbbonamento aa
	on aa.AbbonamentoID = a.ID
		inner join Abbonato ab
		on aa.AbbonatoID=ab.ID
where a.PeriodoValidità = 12
		AND pub.Titolo ='4Ruote'

-- Q3: Dato il nominativo di un abbonato, stabilire a quante riviste è abbonato
Select Count(*) as [numero abbonamenti]
From  Abbonato a
inner join AbbonatoAbbonamento aa
On a.ID=aa.AbbonatoID
	inner join Abbonamento ab
	on aa.AbbonamentoID=ab.ID
		--inner join Pubblicazione pub -- la doppia inner join non serviva, perché non mi serviva il nome della pubblicazione
		--on ab.PubblicazioneID=pub.ID
where a.Nome ='Mario' AND a.Cognome ='Rossi'

select *
from dbo.ufnNumAbbonamentiAbbonato('Mario','Rossi')


-- Q3 alternativa
Select *
From Pubblicazione pub
inner join Abbonamento a
on a.PubblicazioneID = pub.ID
	inner join AbbonatoAbbonamento aa
	on aa.AbbonamentoID = a.ID
		inner join Abbonato ab
		on aa.AbbonatoID=ab.ID
where ab.Nome ='Mario' AND ab.Cognome='Rossi'


 -- Q4: Dato un argomento, elencare le pubblicazioni in cui è trattato
 --nel campo argomento scrivo: 'Attualità; Scienza; Sport'
Select pub.*
from Argomento ar
inner join Pubblicazione pub
on ar.ID = pub.ArgomentoID
where ar.Argomento = 'Notizie'

-- Q5: Riportare per ogni pubblicazione il numero di abbonamenti
Select *
from pubblicazione pub
inner join Abbonamento ab
on pub.ID=ab.PubblicazioneID

Select ab.PubblicazioneID, count(*) as [numero abbonati]
from pubblicazione pub
inner join Abbonamento ab
on pub.ID=ab.PubblicazioneID
group by ab.PubblicazioneID


-- Q5 alternativa che da qualche informazione in più
Select 
 pub.Titolo as [Titolo]
 , nAbbonati.[numero abbonati]
from
pubblicazione pub
inner join
(
Select ab.PubblicazioneID, count(*) as [numero abbonati]
from pubblicazione pub
inner join Abbonamento ab
on pub.ID=ab.PubblicazioneID
group by ab.PubblicazioneID
) nAbbonati
on pub.ID = nAbbonati.PubblicazioneID

-- Q6: Visualizzare i giornali con almeno 5000 abbonati annuali
select * from Abbonamento

Select titolo, count(*) as [numero abbonamenti annuali]
from
(
select ab.ID as ID, pub.Titolo, ab.PeriodoValidità
from Pubblicazione pub
inner join Abbonamento ab
on ab.PubblicazioneID=pub.ID
where pub.TipoPubblicazioneID = 2 AND ab.PeriodoValidità =12
) [abbonamenti annuali giornali]
group by Titolo
having count(*)>1 --5000







