--IN & Subquery - CASE
Select * --sostituibile con IN
From Attori
Where Cognome ='Stallone' OR Cognome= 'Fiennes'

Select * -- NON sostituibile con IN
From Attori
Where Cognome ='Stallone' OR Nome= 'Joseph'

Select *
From Attori
Where Cognome IN ( -- se siamo sicuri che la subquery restituisce un solo valore, al posto di IN posso mettere =
SELECT DISTINCT Cognome FROM Attori WHERE LEFT(Cognome,1) ='F' --subquery
-- LEFT(Cognome,1) ='F' restituisce i cognomi che iniziano per F
)

Select *
From Attori
Where Cognome IN ('Stallone', 'Fiennes')

SELECT 
	f.ID as FilmID
	, Count(*) as [Numero di Attori]
	, SUM(a.Cachet) as [Cachet Totale]

FROM Films f
inner join AttoriFilm af
ON f.ID = af.FilmID
	inner join Attori a 
	ON a.ID = af.AttoriID
group by f.ID

Select
	f.* -- tutto quello che c'è in films
	, filmTotals.[Numero di Attori] -- aggiunge la colonna "numero di attori"
	, filmTotals.[Cachet Totale] -- aggiunge la colonna "cachet totale"
From
Films f --tabella che effettivamente esiste
Inner join
(  -- tra queste parentesi tonde sto creando al volo una tabella nuova
SELECT 
	f.ID as FilmID
	, Count(*) as [Numero di Attori]
	, SUM(a.Cachet) as [Cachet Totale]

FROM Films f
inner join AttoriFilm af
ON f.ID = af.FilmID
	inner join Attori a 
	ON a.ID = af.AttoriID
group by f.ID
) filmTotals  --subquery
ON f.ID = filmTotals.FilmID

-- Stesso esempio di prima, con il case
Select
	f.* -- tutto quello che c'è in films
	, filmTotals.[Numero di Attori] -- aggiunge la colonna "numero di attori"
	, filmTotals.[Cachet Totale]
	, CASE
	WHEN filmTotals.[Cachet Totale]>100 THEN 'Costosuccio' -- dopo il then posso anche mettere equazioni, per estrarre valori calcolati
	WHEN filmTotals.[Cachet Totale] BETWEEN 40 AND 100 THEN 'In budget'
	ELSE 'Economico'
	END AS [Valutazione Cachet]
	, CASE
	WHEN filmTotals.[Cachet Totale]>100 THEN filmTotals.[Cachet Totale] * 1.05 -- 5% in più
	WHEN filmTotals.[Cachet Totale] BETWEEN 40 AND 100 THEN filmTotals.[Cachet Totale]*1.1 -- 10% in più
	ELSE filmTotals.[Cachet Totale]*1.5 -- 50% in più
	END AS [Liminte Massimo Cachet]
From
Films f --tabella che effettivamente esiste
Inner join
(  -- tra queste parentesi tonde sto creando al volo una tabella nuova
SELECT 
	f.ID as FilmID
	, Count(*) as [Numero di Attori]
	, SUM(a.Cachet) as [Cachet Totale]

FROM Films f
inner join AttoriFilm af
ON f.ID = af.FilmID
	inner join Attori a 
	ON a.ID = af.AttoriID
group by f.ID
) filmTotals  --subquery
ON f.ID = filmTotals.FilmID