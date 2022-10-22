#select the relevant information + creating a temporary table + isolating months and years
create temporary table if not exists reviews_data
select id, anonymous, program, school, overallScore, graduatingYear, date_format(str_to_date(createdAt,"%m/%d/%Y"),"%m") as month, date_format(str_to_date(createdAt,"%m/%d/%Y"),"%Y") as year
from comments2
order by anonymous desc;

#temporary table result
select *
from reviews_data;

#how many students gave the score in same graduation's year
select count(overallScore)
from reviews_data
where graduatingYear = year;

#how many students gave the score in different graduation's year
select count(overallScore)
from reviews_data
where graduatingYear != year;

#understanding the same period of reviews per school
select count(overallScore) as tot_reviews
from reviews_data;

#understanding the same period of reviews per school
select avg(overallScore), min(overallScore), max(overallScore)
from reviews_data
where anonymous = 1;

select avg(overallScore), min(overallScore), max(overallScore)
from reviews_data
where anonymous != 1;

select count(overallScore)
from reviews_data
where overallScore < 3 and anonymous = 1;

select count(overallScore)
from reviews_data
where overallScore < 3 and anonymous != 1;
