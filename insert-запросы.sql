--Задание 1

INSERT INTO genres (name) VALUES 
							('Rock'), 
							('Pop'), 
							('Hip Hop');


INSERT INTO performers (name) VALUES
							('Nirvana'), 
							('Lady GaGa'), 
							('Eminem'), 
							('Kanye West'),
							('Metallica');


INSERT INTO albums (name, release_year) VALUES
							('Nevermind', 1991), 
							('The Fame', 2008), 
							('Music to Be Murdered By', 2020),
							('Graduation', 2007),
							('Metallica', 1991);


INSERT INTO tracks (name, duration, album_id) VALUES 
							('Smells Like Teen Spirit', 301, 1),
							('Poker Face', 238, 2),
							('Unaccommodating', 217, 3),
							('Premonition (Intro)', 174, 3),
							('Good Morning', 195, 4),
							('Stronger', 312, 4),
							('my frend of misery', 410, 5),
							('Sad by True', 325, 5);


INSERT INTO collection (name, release_year) VALUES
							('Rock Hits 1990s', 2005),
							('Hip Hop Hits 2020', 2020),
							('Pop Hits', 2026),
							('Hits 2000s', 2015);


INSERT INTO genresperformers (genre_id, performer_id) VALUES
							(1, 1),
							(2, 2),
							(3, 3),
							(3, 4),
							(1, 5),
							(2, 4);


INSERT INTO albumperformers (album_id, performer_id) VALUES
							(1, 1),
							(2, 2),
							(3, 3),
							(4, 4),
							(5, 5);


INSERT INTO collectiontrack (collection_id, track_id) VALUES
							(1, 1),
							(2, 3),
							(2, 4),
							(3, 2),
							(4, 2),
							(4, 5),
							(4, 6),
							(1, 7);
