
SELECT *
FROM GitaTuristica g
where g.DataPartenza Between '2021-01-01' AND '2021-12-31'

SELECT *
FROM GitaTuristica

SELECT *
FROM Responsabile

SELECT *
FROM Responsabile
WHERE EXISTS(
SELECT ID FROM GitaTuristica WHERE ResponsabileID=1
)
AND ID =1