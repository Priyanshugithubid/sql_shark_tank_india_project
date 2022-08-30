use project;
SELECT * FROM project.`shark tank dataas`;

-- total episodes
SELECT count(distinct `Ep. No.`) FROM project.`shark tank dataas`;
SELECT max(`Ep. No.`) FROM project.`shark tank dataas`;

-- pitches 
select count(distinct brand) from project.`shark tank dataas`;

-- pitches converted

select cast(sum(a.converted_not_converted) as float) /cast(count(*) as float) from (
select `amount invested lakhs` , case when `amount invested lakhs`>0 then 1 else 0 end as converted_not_converted from project.`shark tank dataas`) a;

-- total male

select sum(male) from project.`shark tank dataas`;

-- total female

select sum(female) from project.`shark tank dataas`;

-- gender ratio

select sum(female)/sum(male) from project.`shark tank dataas`;

-- total invested amount

select sum(`amount invested lakhs`) from project.`shark tank dataas`;

-- avg equity taken

select avg(b.`Equity Taken %`) from
(select * from project.`shark tank dataas` where `Equity Taken %`>0) b;

-- highest deal taken

select max(`Amount Invested lakhs`) from project.`shark tank dataas`; 

-- highest equity taken

select max(`Equity Taken %`) from project.`shark tank dataas`;

-- startups having at least women
select sum(c.female_count) from (
select Female,case when Female>0 then 1 else 0 end as female_count from project.`shark tank dataas`) c;

-- pitches converted having at least one women

select * from project.`shark tank dataas`;


select sum(b.female_count) from(

select case when a.female>0 then 1 else 0 end as female_count ,a.*from (
(select * from project.`shark tank dataas` where deal!='No Deal')) a)b;

-- avg team members

select avg(`Team members`) from project.`shark tank dataas`;

-- amount invested per deal

select avg(a.`Amount Invested lakhs`) amount_invested_per_deal from
(select * from project.`shark tank dataas` where deal!='No Deal') a ;

-- avg age group of contestants

select `Avg age`,count(`Avg age`) cnt from project.`shark tank dataas` group by `Avg age` order by cnt desc;

-- location group of contestants

select location,count(location) cnt from project.`shark tank dataas` group by location order by cnt desc;

-- sector group of contestants

select sector,count(sector) cnt from project.`shark tank dataas` group by sector order by cnt desc;

-- partner deals

select partners,count(partners) cnt from project.`shark tank dataas`  where partners!='-' group by partners order by cnt desc;

-- making the matrix


select * from project.`shark tank dataas`;

select 'Ashnner' as keyy,count(`Ashneer Amount Invested`) from project.`shark tank dataas` where `Ashneer Amount Invested` is not null;


select 'Ashnner' as keyy,count(`Ashneer Amount Invested`) from project.`shark tank dataas` where `Ashneer Amount Invested` is not null AND `Ashneer Amount Invested`!=0;

SELECT 'Ashneer' as keyy,SUM(C.`Ashneer Amount Invested`),AVG(C.`Ashneer Equity Taken %`) 
FROM (SELECT * FROM PROJECT.`shark tank dataas`  WHERE `Ashneer Equity Taken %`!=0 AND `Ashneer Equity Taken %` IS NOT NULL) C;

select m.keyy,m.total_deals_present,m.total_deals,n.total_amount_invested,n.avg_equity_taken from
(select a.keyy,a.total_deals_present,b.total_deals from(
select 'Ashneer' as keyy,count(`Ashneer Amount Invested`) total_deals_present from project.`shark tank dataas` where `Ashneer Amount Invested` is not null) a
inner join (
select 'Ashneer' as keyy,count(`Ashneer Amount Invested`) total_deals from project.`shark tank dataas`
where `Ashneer Amount Invested` is not null AND `Ashneer Amount Invested`!=0) b
on a.keyy=b.keyy) m

inner join 

(SELECT 'Ashneer' as keyy,SUM(C.`Ashneer Amount Invested`) total_amount_invested,
AVG(C.`Ashneer Equity Taken %`) avg_equity_taken
FROM (SELECT * FROM PROJECT.`shark tank dataas`  WHERE `Ashneer Equity Taken %`!=0 AND `Ashneer Equity Taken %` IS NOT NULL) C) n
on m.keyy=n.keyy

-- which is the startup in which the highest amount has been invested in each domain/sector



;
select c.* from 
(select Brand,Sector,`Amount Invested lakhs`,rank() over(partition by sector order by `Amount Invested lakhs` desc) rnk 
from project.`shark tank dataas`) c
where c.rnk=1


