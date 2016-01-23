create table cusipcomp (prim_cusip varchar(5), rd double, rank int, decile int);
insert into cusipcomp (select prim_cusip,rd,rank,round(10*(cnt-rank+1)/cnt,0) as decile from   
(SELECT  prim_cusip,rd,@curRank := @curRank + 1 AS rank
FROM      (select prim_cusip,conm,rd from firmmetrics where firm_year='2007' and rd is not null group by prim_cusip,conm)
p, (SELECT @curRank := 0) r
ORDER BY  rd desc ) as dt,(select count(distinct prim_cusip) as cnt from
firmmetrics) as ct);

select * from edgelist_2006 a inner join cusipcomp b on a.cusip1=b.prim_cusip;
drop table withinwithout;
create table withinwithout (cusip1 varchar(5),cusip2 varchar(5),prim_cusip varchar(5), rd double, rank int, decile int);
delete from withinwithout;
insert into withinwithout (select * from edgelist_2007 a inner join cusipcomp b on a.cusip1=b.prim_cusip);
delete from delete_edge;
insert into delete_edge(select a.cusip1,a.cusip2 from edgelist_2007 a left join softwarealliances b on a.cusip1 = b.prim_cusip where a.cusip1 in (select prim_cusip from softwarealliances where innet='1') and a.cusip2 in (select prim_cusip from softwarealliances where innet='0'));
select distinct a.cusip,a.cusip1,b.decile from delete_edge a left join withinwithout b on a.cusip=b.prim_cusip where decile is not null;
