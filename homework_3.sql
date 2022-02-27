create table performer 
(
id serial primary key,
title text not null,
alias text
);


create table genre
(
id serial primary key,
title varchar(100)
);


create table performer_genre
(
performer_id int4,
genre_id int4,
primary key  (performer_id, genre_id),
constraint fk_performer_id
	foreign key (performer_id)
	references performer(id),
constraint fk_genre_id
	foreign key (genre_id)
	references genre(id)
);


create table album
(
id serial primary key,
title text not null,
released_date timestamp not null
);


create table performer_album
(
performer_id int4,
album_id int4,
primary key  (performer_id, album_id),
constraint fk_performer_id
	foreign key (performer_id)
	references performer(id),
constraint fk_album_id
	foreign key (album_id)
	references album(id)
);


create table soundtrack
(
id serial primary key,
album_id integer,
title text not null,
duration integer not null,
constraint fk_album_id
	foreign key (album_id)
	references album(id)
);


create table compilation
(
id serial primary key,
title text not null,
released_date timestamp not null
);


create table soundtrack_compilation
(
soundtrack_id int4,
compilation_id int4,
primary key  (soundtrack_id, compilation_id),
constraint fk_soundtrack_id
	foreign key (soundtrack_id)
	references soundtrack(id),
constraint fk_compilation_id
	foreign key (compilation_id)
	references compilation(id)
);


--drop table performer cascade;
--drop table genre cascade;
--drop table performer_genre cascade;
--drop table album cascade;
--drop table performer_album cascade;
--drop table soundtrack cascade;
--drop table compilation cascade;
--drop table soundtrack_compilation cascade;