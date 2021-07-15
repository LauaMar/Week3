-- join per tabella di bridge - order by - 

SELECT * FROM Attori
SELECT * FROM Films
SELECT * FROM AttoriFilm

-- join per tabella di bridge
--Select *
--from Films f
--INNER JOIN AttoriFilm af
--on f.ID = af.FilmID
--	INNER JOIN Attori a
--	On a.ID = af.AttoriID
--WHERE f.ID = 3

-- ORDER BY
Select *
from Films f
INNER JOIN AttoriFilm af
on f.ID = af.FilmID
	INNER JOIN Attori a
	On a.ID = af.AttoriID
--ORDER BY f.ID, a.ID DESC -- ordina in ordine crescente di FilmID e in ordine decrescente di ID autore
ORDER BY f.ID DESC, a.cachet -- ordina in ordine decrescente di FilmID e in ordine crescente di cachet autore
