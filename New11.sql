create table if not exists music_genre(
	mg_id serial primary key, 
	name_mg varchar (60) unique not null	
);

create table if not exists performers(
	perf_id serial primary key, 
	name_perf varchar (60) unique not null,
	mg_id INTEGER NOT NULL references music_genre(mg_id)
);

create table if not exists music_genreperformers(
	mg_id INTEGER REFERENCES music_genre(mg_id),
	perf_id INTEGER REFERENCES performers(perf_id),
	CONSTRAINT pk PRIMARY KEY (mg_id, perf_id)
);

create table if not exists albums(
	alb_if serial primary key,
	name_alb varchar (60) unique not null,
	Year_of_release int,
	perf_id integer references performers(perf_id),
	check(Year_of_release > 1950 AND Year_of_release < 2023)
);

create table if not exists performersalbums(
	perf_id integer references performers(perf_id),
	alb_if integer references albums(alb_if),
	CONSTRAINT pd PRIMARY KEY (perf_id, alb_if)
);

create table if not exists tracks(
	tracks_id serial primary key, 
	name_tracks varchar (60) unique not null,
	Duration int,
	alb_if integer references albums(alb_if),
	check(Duration > 1 and Duration < 600)
);

create table if not exists collection(
	coll_id serial primary key,
	name_coll varchar (60) unique not null,
	Year_of_release_coll int,
	tracks_id integer references tracks(tracks_id),
	alb_if integer references albums(alb_if),
	check (Year_of_release_coll > 1950 and Year_of_release_coll < 2023)
);


create table if not exists trackscollection(
	tracks_id integer references tracks(tracks_id),
	coll_id integer references collection(coll_id),
	CONSTRAINT tc PRIMARY KEY (tracks_id, coll_id)
);


	