-- aggregazione

Select * 
from Films f
INNER JOIN AttoriFilm af
on f.ID = af.FilmID
	INNER JOIN Attori a
	on a.ID = af.AttoriID

--Select af.FilmID, COUNT(*) AS [Numero Attori] -- COUNT(*) significa che non importa che proprietà conta, tanto sto contando le righe
--from Films f
--INNER JOIN AttoriFilm af
--on f.ID = af.FilmID
--Group by af.FilmID


--Select af.FilmID, SUM(a.Cachet) as [Cachet Totale] -- 
--from Films f
--INNER JOIN AttoriFilm af
--on f.ID = af.FilmID
--	INNER JOIN Attori a
--	on a.ID = af.AttoriID
--Group by af.FilmID

Select nazionalita, Count(*) as [NUMERO ATTORI]
from Attori a
where Nazionalita ='USA' or Nazionalita ='ITA'
group by a.Nazionalita
--having COUNT(*) >1
Order by COUNT(*) DESC