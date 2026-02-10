--Задание 2

SELECT name, duration FROM tracks
WHERE duration = (SELECT max(duration) FROM tracks);

SELECT name FROM tracks
WHERE duration >= 210;

SELECT name FROM  collection
WHERE release_year BETWEEN 2018 AND 2020;

SELECT name FROM performers 
WHERE name NOT LIKE '% %';

SELECT name FROM tracks
WHERE name ILIKE 'my %' 
	OR name ILIKE '% my'
	OR name ILIKE '% my %'
	OR name LIKE 'my';


--Задание 3

SELECT g.name, COUNT(gp.performer_id) count_performers FROM genres g
LEFT JOIN genresperformers gp ON g.genre_id = gp.genre_id
GROUP BY g.name, gp.genre_id 
ORDER BY count_performers DESC;

SELECT COUNT(t.track_id) FROM tracks t
JOIN albums a ON t.album_id = a.album_id
WHERE a.release_year BETWEEN 2019 AND 2020;

SELECT a.name, AVG(t.duration) avg_duration FROM tracks t
JOIN albums a ON t.album_id = a.album_id
GROUP BY a.name;

SELECT p.name FROM performers p
WHERE p.performer_id NOT IN (
    SELECT p2.performer_id
    FROM performers p2
    JOIN albumperformers ap ON p2.performer_id = ap.performer_id
    JOIN albums a ON ap.album_id = a.album_id
    WHERE a.release_year = 2020);

SELECT DISTINCT c.name FROM collection c 
JOIN collectiontrack ct ON c.collection_id = ct.collection_id 
JOIN tracks t ON ct.track_id = t.track_id 
JOIN albums a ON a.album_id = t.album_id 
JOIN albumperformers ap ON ap.album_id = a.album_id 
JOIN performers p ON p.performer_id = ap.performer_id 
WHERE p.name = 'Eminem';


--Задание 4

SELECT DISTINCT a.name FROM albums a
JOIN albumperformers ap ON a.album_id = ap.album_id
JOIN performers p ON ap.performer_id = p.performer_id
JOIN genresperformers gp ON p.performer_id = gp.performer_id
GROUP BY a.album_id, a.name, p.performer_id
HAVING COUNT(gp.genre_id) > 1;

SELECT t.name FROM tracks t
LEFT JOIN collectiontrack ct ON t.track_id = ct.track_id
WHERE ct.track_id IS NULL ;

SELECT p.name FROM performers p 
JOIN albumperformers ap ON p.performer_id = ap.performer_id
JOIN albums a ON ap.album_id = a.album_id
JOIN tracks t ON a.album_id = t.album_id
WHERE t.duration = (SELECT MIN(duration) FROM tracks);

SELECT a.name, COUNT(t.name) count_tracks FROM albums a 
JOIN tracks t ON a.album_id = t.album_id 
GROUP BY a.album_id, a.name
HAVING COUNT(t.name) = (SELECT MIN(track_count) FROM 
(SELECT COUNT(*) as track_count FROM tracks 
GROUP BY album_id) counts);