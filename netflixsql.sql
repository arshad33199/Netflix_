create database netf

select * from netflix_titles


--with t1 as
(
select count(type) as tv_show , country from netflix_titles
where type ='tv show' and country = 'india' 
group by country) 
--t2 as 
(select count(type) as movie , country  from netflix_titles
where type ='movie' and country = 'india'
group by country) 


select * from (select country ,
count( case when type ='tv show' then 1 end) as tv_show ,
count( case when type ='movie' then 1 end) as movie
from netflix_titles
where country = 'india'
group by country) c
order by tv_show , movie


select count(title) as movies from  netflix_titles
where director = 'David Dhawan' 

 
 select listed_in , title , director from netflix_titles 
  where listed_in = 'Horror Movies, International Movies, Thrillers' 
  

select type ,
sum(case when country='India' then 1 else 0 end) as India,
sum(case when country='United States' then 1 else 0 end) as United_States,
sum(case when country='South Africa' then 1 else 0 end) as South_Africa
from netflix_titles 
group by type


select min(release_year) as min_year , title
from netflix_titles
group by title , release_year


select type , title , country , date_added
from netflix_titles
where release_year = 1925


select type , title , listed_in , release_year
from netflix_titles
where release_year  between 1925 and 2000 and
type ='movie'
order by release_year


select type , title , duration from netflix_titles
where duration = '120 min'


Select
min(release_year) as min_rel_year ,
max(release_year) as max_rel_year , 
count(distinct release_year) as count_rerl_year ,
avg(release_year) as avg_rel_years  
from netflix_titles


ALTER DATABASE netf MODIFY NAME = Netflix;