-- 1
select title, count(title)
from genre g 
left join performer_genre pg on g.id = pg.genre_id 
group by 1;


-- 2. Сменил года, т.к у меня нет альбомов за эти года
select a.title, count(s.id)
from album a 
left join soundtrack s on a.id = s.album_id 
where released_date::date between '2016-01-01' and '2017-12-31'
group by 1


-- 3
select a.title, avg(duration)
from album a 
left join soundtrack s on a.id = s.album_id 
group by 1


-- 4
select p.title, a.title
from performer p 
left join performer_album pa on p.id = pa.performer_id 
left join album a on pa.album_id  = a.id
where extract(year from a.released_date) != '2018'


-- 5
select c.title, s.title
from compilation c
left join soundtrack_compilation sc on c.id  = sc.compilation_id 
left join soundtrack s on s.id = sc.soundtrack_id 
left join album a on a.id = s.album_id 
left join performer_album pa on pa.album_id = a.id 
left join performer p on p.id = pa.performer_id 
where p.title = 'Gorillaz'


-- 6
select a.title
from album a 
left join performer_album pa on pa.album_id = a.id 
left join performer p on p.id = pa.performer_id
inner join 
	(
	select p.title, count(g.title)
	from performer p 
	left join performer_genre pg on pg.performer_id = p.id 
	left join genre g on g.id = pg.genre_id 
	group by 1
	having count(g.title) > 1
	) sq on p.title = sq.title

	
-- 7
select s.title
from soundtrack s 
left join soundtrack_compilation sc on s.id  = sc.soundtrack_id 
where sc.soundtrack_id is null

	
-- 8
select title
from soundtrack
where duration = 
	(
	select min(duration)
	from soundtrack
	)

	
-- 9
with t as
	(
	select a.title, count(s.title) as cnt
	from album a 
	left join soundtrack s on a.id = s.album_id 
	group by 1
	)
select title
from t
where cnt = (select min(cnt) from t)