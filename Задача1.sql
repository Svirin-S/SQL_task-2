create table if not exists music_genre(
	id serial primary key,
	Name_genre varchar (60) not null,
	description text not null
);


create table if not exists performers(
	performers_id serial primary key,
	Name_perfomens varchar (60) not null,
	music_genre_id integer not null references music_genre(id),
	number integer not null,
	description text not null
);


create table if not exists albums(
	albums_id serial primary key,
	Name_albums varchar (60) not null,
	Year_of_release varchar (60) not null,
	performers_id integer not null references performers(performers_id),
	number integer not null,
	description text not null
);	

create table if not exists tracks(
	tracks_id serial primary key,
	Name_tracks varchar (60) not null,
	Duration varchar (60) not null,
	albums_id integer not null references albums(albums_id),
	number integer not null,
	description text not null
);


create table if not exists collection(
	collection_id serial primary key,
	Name_collection varchar (60) not null,
	Year_of_release_coll varchar (60) not null, 
	tracks_id integer not null references tracks(tracks_id),
	albums_id integer not null references albums(albums_id),
	number integer not null,
	description text not null  
);	


	