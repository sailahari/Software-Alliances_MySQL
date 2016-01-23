	drop table cusipcomp;
create table cusipcomp (prim_cusip varchar(5), employees double, rank int, decile int);

select prim_cusip,employees,rank,round(10*(cnt-rank+1)/cnt,0) as decile from   
(SELECT  prim_cusip,employees,@curRank := @curRank + 1 AS rank
FROM      (select prim_cusip,conm,employees from firmmetrics where firm_year='2006' and employees is not null group by prim_cusip,conm)
p, (SELECT @curRank := 0) r
ORDER BY  employees desc ) as dt,(select count(distinct prim_cusip) as cnt from
firmmetrics) as ct;

insert into cusipcomp (select prim_cusip,employees,rank,round(10*(cnt-rank+1)/cnt,0) as decile from   
(SELECT  prim_cusip,employees,@curRank := @curRank + 1 AS rank
FROM      (select prim_cusip,conm,employees from firmmetrics where firm_year='2006' and employees is not null group by prim_cusip,conm)
p, (SELECT @curRank := 0) r
ORDER BY  employees desc ) as dt,(select count(distinct prim_cusip) as cnt from
firmmetrics) as ct);

select * from edgelist_2006 a inner join cusipcomp b on a.cusip1=b.prim_cusip;
select * from edgelist_2006 a inner join cusipcomp b on a.cusip2=b.prim_cusip;

select prim_cusip,employees,rank,round(10*(cnt-rank+1)/cnt,0) as decile from   
(SELECT  prim_cusip,employees,@curRank := @curRank + 1 AS rank
FROM      (select prim_cusip,conm,employees from firmmetrics where firm_year='2007' and employees is not null group by prim_cusip,conm)
p, (SELECT @curRank := 0) r
ORDER BY  employees desc ) as dt,(select count(distinct prim_cusip) as cnt from
firmmetrics) as ct;

delete from cusipcomp;

insert into cusipcomp (select prim_cusip,employees,rank,round(10*(cnt-rank+1)/cnt,0) as decile from   
(SELECT  prim_cusip,employees,@curRank := @curRank + 1 AS rank
FROM      (select prim_cusip,conm,employees from firmmetrics where firm_year='2007' and employees is not null group by prim_cusip,conm)
p, (SELECT @curRank := 0) r
ORDER BY  employees desc ) as dt,(select count(distinct prim_cusip) as cnt from
firmmetrics) as ct);

select * from edgelist_2007 a inner join cusipcomp b on a.cusip1=b.prim_cusip;
select * from edgelist_2007 a inner join cusipcomp b on a.cusip2=b.prim_cusip;

select prim_cusip,employees,rank,round(10*(cnt-rank+1)/cnt,0) as decile from   
(SELECT  prim_cusip,employees,@curRank := @curRank + 1 AS rank
FROM      (select prim_cusip,conm,employees from firmmetrics where firm_year='2008' and employees is not null group by prim_cusip,conm)
p, (SELECT @curRank := 0) r
ORDER BY  employees desc ) as dt,(select count(distinct prim_cusip) as cnt from
firmmetrics) as ct;

delete from cusipcomp;

insert into cusipcomp (select prim_cusip,employees,rank,round(10*(cnt-rank+1)/cnt,0) as decile from   
(SELECT  prim_cusip,employees,@curRank := @curRank + 1 AS rank
FROM      (select prim_cusip,conm,employees from firmmetrics where firm_year='2008' and employees is not null group by prim_cusip,conm)
p, (SELECT @curRank := 0) r
ORDER BY  employees desc ) as dt,(select count(distinct prim_cusip) as cnt from
firmmetrics) as ct);

select * from edgelist_2008 a inner join cusipcomp b on a.cusip1=b.prim_cusip;
select * from edgelist_2008 a inner join cusipcomp b on a.cusip2=b.prim_cusip;

select prim_cusip,employees,rank,round(10*(cnt-rank+1)/cnt,0) as decile from   
(SELECT  prim_cusip,employees,@curRank := @curRank + 1 AS rank
FROM      (select prim_cusip,conm,employees from firmmetrics where firm_year='2009' and employees is not null group by prim_cusip,conm)
p, (SELECT @curRank := 0) r
ORDER BY  employees desc ) as dt,(select count(distinct prim_cusip) as cnt from
firmmetrics) as ct;

delete from cusipcomp;

insert into cusipcomp (select prim_cusip,employees,rank,round(10*(cnt-rank+1)/cnt,0) as decile from   
(SELECT  prim_cusip,employees,@curRank := @curRank + 1 AS rank
FROM      (select prim_cusip,conm,employees from firmmetrics where firm_year='2009' and employees is not null group by prim_cusip,conm)
p, (SELECT @curRank := 0) r
ORDER BY  employees desc ) as dt,(select count(distinct prim_cusip) as cnt from
firmmetrics) as ct);

select * from edgelist_2009 a inner join cusipcomp b on a.cusip1=b.prim_cusip;
select * from edgelist_2009 a inner join cusipcomp b on a.cusip2=b.prim_cusip;
