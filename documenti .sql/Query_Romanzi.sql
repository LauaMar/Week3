
--Q1: Il titolo dei romanzi del 19° secolo 
Select* from Romanzo

Select titolo
from Romanzo
where AnnoPubblicazione between 1801 and 1900

Select *
From dbo.ufnStampaTitoliPerIntervalloTemporale(1801,1900)

--Q2: Il titolo, l’autore e l’anno di pubblicazione dei romanzi di autori russi, ordinati per autore e, 
-- per lo stesso autore, ordinati per anno di pubblicazione 

Select* from Romanzo
Select* from Autore

Select r.Titolo, a.Nome, r.AnnoPubblicazione
from Romanzo r
inner join Autore a
ON r.Autore_id = a.ID
where a.Nazione='Rus'
order by a.Nome, r.AnnoPubblicazione

--Q3: I personaggi principali (ruolo =”Protagonista”) dei romanzi di autori viventi
Select p.Nome, a.Nome, a.AnnoNascita
from Personaggio p
inner join RomanzoPersonaggio rp
ON p.ID=rp.Personaggio_id
	inner join Romanzo r
	ON rp.Romanzo_id=r.ID
		inner join Autore a
		ON r.Autore_id=a.ID
where p.Ruolo = 'Protagonista' AND a.AnnoMorte IS NULL 


--Q4: Per ogni autore italiano, l’anno del primo e dell’ultimo romanzo 
Select *
from Autore a
inner join Romanzo r
ON a.ID=r.Autore_id
where a.Nazione='ITA' 


Select 
	a.Nome as [Nome Autore], 
	MIN(r.AnnoPubblicazione) as [Anno primo Romanzo], 
	MAX(r.AnnoPubblicazione) as [Anno ultimo Romanzo]
from Autore a
inner join Romanzo r
ON a.ID=r.Autore_id
where a.Nazione='ITA' 
group by a.Nome

-- Q5: I nomi dei personaggi che compaiono in più di un romanzo, ed il numero dei romanzi nei quali compaiono 
Select *
From Personaggio p
inner join RomanzoPersonaggio rp
ON p.ID=rp.Personaggio_id
	inner join Romanzo r
	ON rp.Romanzo_id=r.ID

Select p.Nome, count(*) as [numero Comparizioni]
From Personaggio p
inner join RomanzoPersonaggio rp
ON p.ID=rp.Personaggio_id
	inner join Romanzo r
	ON rp.Romanzo_id=r.ID
group by p.Nome
having count(*)>1
order by [numero Comparizioni]

-- Q6: Il titolo dei romanzi i cui personaggi principali sono tutti femminili 
Select *
From Personaggio p
inner join RomanzoPersonaggio rp
ON p.ID=rp.Personaggio_id
	inner join Romanzo r
	ON rp.Romanzo_id=r.ID


Select r.Titolo, Count(*) as [num Attori]
From Personaggio p
inner join RomanzoPersonaggio rp
ON p.ID=rp.Personaggio_id
	inner join Romanzo r
	ON rp.Romanzo_id=r.ID
	group by r.Titolo

where p.Sesso ='F'

--Q7: Mostrare il titolo di un romanzo e di fianco un’etichetta che stabilisce che si tratta
--di un romanzo ‘Antico’ se il suo anno di pubblicazione è precedente al 1800,
--Neoclassico se l’anno di pubblicazione è compreso tra il 1800 e il 2000, moderno se oltre gli anni 2000

Select *
	, CASE 
	WHEN r.AnnoPubblicazione<1800 THEN 'Antico'
	WHEN r.AnnoPubblicazione between 1801 and 2000 THEN 'NeoClassico'
	WHEN r.AnnoPubblicazione>2000 THEN 'Moderno'
	ELSE 'Fuori range'
	END AS [Tipo Romanzo]
from Romanzo r




