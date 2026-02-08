CREATE TABLE IF NOT EXISTS Genres(
		genre_id serial PRIMARY KEY,
		name VARCHAR(40) NOT NULL 
		);


CREATE TABLE IF NOT EXISTS Performers(
		performer_id serial PRIMARY KEY,
		name VARCHAR(40) NOT NULL
		);


CREATE TABLE IF NOT EXISTS Albums(
		album_id serial PRIMARY KEY,
		name VARCHAR(40) NOT NULL,
		release_year INTEGER CHECK (release_year > 1900 AND release_year < 2100)
		);


CREATE TABLE IF NOT EXISTS Tracks(
		track_id serial PRIMARY KEY,
		name VARCHAR(40) NOT NULL,
		duration INTEGER,
		album_id INTEGER REFERENCES Albums(album_id)
		);


CREATE TABLE IF NOT EXISTS Collection(
		collection_id serial PRIMARY KEY,
		name VARCHAR(40) NOT NULL,
		release_year INTEGER CHECK (release_year > 1900 AND release_year < 2100)
		);


CREATE TABLE IF NOT EXISTS GenresPerformers(
		genre_id INTEGER REFERENCES Genres(genre_id),
		performer_id INTEGER REFERENCES Performers(performer_id),
		PRIMARY KEY(genre_id, performer_id)
		);


CREATE TABLE IF NOT EXISTS AlbumPerformers(
		album_id INTEGER REFERENCES Albums(album_id),
		performer_id INTEGER REFERENCES Performers(performer_id),
		PRIMARY KEY(album_id, performer_id)
		);


CREATE TABLE IF NOT EXISTS CollectionTrack(
		collection_id INTEGER REFERENCES Collection(collection_id),
		track_id INTEGER REFERENCES Tracks(track_id),
		PRIMARY KEY(collection_id, track_id)
		);