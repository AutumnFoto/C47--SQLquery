-- 1. Query all of the entries in the Genre table
--SELECT * FROM Genre;
--------------------------------------------------------
--2. Query all the entries in the Artist table and order by the artist's name. HINT: use the ORDER BY keywords
--Select * from Artist order by ArtistName;

----------------------------------------------------------
--3. Write a SELECT query that lists all the songs in the Song table and include the Artist name
 /* SELECT s.Title,
    a.ArtistName
 FROM Song s
      LEFT JOIN Artist a on s.ArtistId = a.id;*/
-----------------------------------------------------------

SELECT 
distinct
a.ArtistName

FROM Artist a
LEFT JOIN Album al on al.ArtistId = a.id
LEFT JOIN Genre g on al.GenreId = g.id

WHERE g.Name = 'rock';
mds;ds 