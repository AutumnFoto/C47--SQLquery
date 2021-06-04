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
/*4. Write a SELECT query that lists all the Artists that have a Pop Album


SELECT 
distinct
a.ArtistName

FROM Artist a
LEFT JOIN Album al on al.ArtistId = a.id
LEFT JOIN Genre g on al.GenreId = g.id

WHERE g.Name = 'rock'; */
-------------------------------------------

/*5.Write a SELECT query that lists all the Artists that have a Jazz or Rock Album

SELECT
distinct
a.ArtistName,
g.Name,
b.Title

FROM Album b
Left Join Artist a on b.ArtistId = a.id
Left Join Genre g on b.GenreId = g.id
where name= 'rock' OR name='jazz';*/

/*6.Write a SELECT statement that lists the Albums with no songs

SELECT al.title

FROM Album al
left join song s on s.albumid = al.id
where s.albumid is NULL

-------------------------------------------------
7. Using the INSERT statement, add one of your favorite artists to the Artist table.
Insert into Artist (ArtistName, YearEstablished) Values ('Fleetwood Mac', 2021);
-------------------------------------------------
8. Using the INSERT statement, add one, or more, albums by your artist to the Album table.
Select * from Artist
Select * from Genre
Select * from Album
Insert into Album (Title, ReleaseDate, AlbumLength, Label, ArtistId, GenreId) Values ('Rumors', 1977, 18, 'Studio Album', 29, 2);
-------------------------------------------------
10. Write a SELECT query that provides the song titles, album title, and artist name for all of the data you just entered in.
    Use the LEFT JOIN keyword sequence to connect the tables, and the WHERE keyword to filter the results to the album and artist you added.
select 
	Song.title,
	Album.title,
	Artist.ArtistName
from Album
left join Song
	on Song.AlbumId = Album.Id
left join Artist
	on Artist.Id = Album.ArtistId
where ArtistName = 'Radiohead';
-------------------------------------------------
11. Write a SELECT statement to display how many songs exist for each album. You'll need to use the COUNT() function and the GROUP BY keyword sequence.
select
	Count(Song.Title), album.Title
from Album
	left join Song
	on Song.AlbumId = Album.Id
group by Album.Title
order by 1 desc;
-------------------------------------------------
12. Write a SELECT statement to display how many songs exist for each artist. You'll need to use the COUNT() function and the GROUP BY keyword sequence.
select
	Count(Song.Title), Artist.ArtistName
from Artist
	left join Song
	on Song.ArtistId = Artist.Id
group by Artist.ArtistName
order by 1 desc;
-------------------------------------------------
13. Write a SELECT statement to display how many songs exist for each genre. You'll need to use the COUNT() function and the GROUP BY keyword sequence.
select
	COUNT(Song.Title), Genre.Name
from Genre
	left join Song
	on Song.GenreId = Genre.Id
group by Genre.Name
order by 1 desc;
-------------------------------------------------
14. Write a SELECT query that lists the Artists that have put out records on more than one record label. Hint: When using GROUP BY instead of using a WHERE clause, use the HAVING keyword
select
	COUNT(Album.Label), Artist.ArtistName
	from Album
	left join Artist
	on album.ArtistId = Artist.Id
	group by Artist.ArtistName
	having count (album.label) > 1;
-------------------------------------------------
15. Using MAX() function, write a select statement to find the album with the longest duration. The result should display the album title and the duration.
select album.Title,
		album.AlbumLength
from Album
where album.AlbumLength in
	(select max(albumlength)
	from Album);
-------------------------------------------------
16. Using MAX() function, write a select statement to find the song with the longest duration. The result should display the song title and the duration.
select 
	song.Title,
	song.SongLength
from Song
where song.SongLength in
	(select MAX(songlength)
	from Song);
-------------------------------------------------
17. Modify the previous query to also display the title of the album.
select
	song.Title,
	song.SongLength,
	Album.Title
from Song
	left join Album
	on song.AlbumId = Album.Id
where song.SongLength in 
	(select MAX(songlength)
	from Song);