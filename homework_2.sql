create table performer 
(
performer_id serial primary key,
title text,
alias text
);


create table genre
(
performer_id integer primary key,
title varchar(100),
constraint fk_performer_id
	foreign key (performer_id)
	references performer(performer_id)
);


create table album
(
performer_id integer,
album_id serial primary key,
title text,
released_date timestamp,
constraint fk_performer_id
	foreign key (performer_id)
	references performer(performer_id)
);


create table soundtrack
(
album_id integer,
soundtrack_id serial primary key,
title text,
length interval,
constraint fk_album_id
	foreign key (album_id)
	references album(album_id)
);


--drop table soundtrack;
--drop table album;
--drop table genre;
--drop table performer;
