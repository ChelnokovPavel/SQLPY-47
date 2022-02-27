-- Задание 1
insert into performer (title, alias) values
('Linkin Park', 'LP'),
('Morgenstern', ''),
('The Chemical Brothers', ''),
('Игорь Николаев', ''),
('Tokyomane', ''),
('GSPD', ''),
('Johnyy Cash', ''),
('Gorillaz', '');


insert into genre (title) values
('Rock'), ('Rap'), ('Fonk'), ('Pop'), ('Dance');


insert into performer_genre values
(1, 1),
(2, 2),
(3, 4),
(3, 5),
(4, 1),
(5, 3),
(6, 5),
(7, 4),
(8, 4),
(8, 5);


insert into album (title, released_date) values
('Hybrid Theory', '2000-10-24'),
('До того как стал известен', '2018-10-12'),
('Push the Button', '2005-01-24'),
('Линия жизни', '2014-12-10'),
('Ленинградский Электроклуб', '2021-01-29'),
('The Johnny Cash Childrens Album', '1975-01-01'),
('Demon Days', '2005-05-11'),
('Humanz', '2017-04-28');


insert into performer_album values
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(6, 5),
(7, 6),
(8, 7),
(8, 8);


insert into soundtrack (album_id, title, duration) values
(1, 'Crawling', 208),
(1, 'In the End', 208),
(2, 'Танцуй', 224),
(3, 'Galvanize', 393),
(3, 'Hold Tight London', 360),
(3, 'Close Your Eyes', 383),
(4, 'Поздняя весна', 333),
(4, 'Мы совпали с тобой', 192),
(4, 'Завораживает', 162),
(4, 'Немного жаль', 334),
(5, 'ЭЛЕКТРОКЛУБ', 168),
(6, 'My Grandfathers Clock', 220),
(7, 'Feel Good Inc.', 221),
(7, 'DARE', 244),
(8, 'Momentz', 196);


insert into compilation (title, released_date) values
('Сборник 1', '2016-01-01'),
('Сборник 2', '2017-01-02'),
('Сборник 3', '2018-01-03'),
('Сборник 4', '2019-01-04'),
('Сборник 5', '2020-01-05'),
('Сборник 6', '2021-01-06'),
('Сборник 7', '2022-01-07'),
('Сборник 8', '2022-01-08');


insert into soundtrack_compilation values
(1, 1),
(1, 2),
(1, 6),
(3, 5),
(3, 6),
(14, 1),
(14, 8),
(7, 5),
(7, 3),
(13, 3),
(13, 4),
(13, 7);


-- Задание 2
-- 1
select title, released_date
from album
where extract(year from released_date) = '2018'


-- 2
select title, duration 
from soundtrack
where duration = (select max(duration) from soundtrack)


-- 3
select title
from soundtrack
where duration >= 210


-- 4
select title 
from compilation
where released_date::date between '2018-01-01' and '2020-12-31'


-- 5
select title
from performer
where title not like '% %'


-- 6
select title 
from soundtrack
where title ilike '%my%'