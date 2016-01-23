create table investcap (prim_cusip varchar(5),conm varchar(100), firm_year int, investmentcapacity double);
insert into investcap (select prim_cusip, conm, firm_year, ((rd+adv+physcap)/total_assets) as investmentcapacity from firmmetrics group by prim_cusip, conm, firm_year having investmentcapacity is not null);
select cusip1, investmentcapacity, count(cusip1)  from edgelist_2006 a inner join investcap b on a.cusip1=b.prim_cusip and firm_year ='2006' group by cusip1 ;
select cusip2, investmentcapacity, count(cusip2)  from edgelist_2006 a inner join investcap b on a.cusip2=b.prim_cusip and firm_year ='2006' group by cusip2 ;

select cusip1, investmentcapacity, count(cusip1)  from edgelist_2007 a inner join investcap b on a.cusip1=b.prim_cusip and firm_year ='2007' group by cusip1 ;
select cusip2, investmentcapacity, count(cusip2)  from edgelist_2007 a inner join investcap b on a.cusip2=b.prim_cusip and firm_year ='2007' group by cusip2 ;

select cusip1, investmentcapacity, count(cusip1)  from edgelist_2008 a inner join investcap b on a.cusip1=b.prim_cusip and firm_year ='2008' group by cusip1 ;
select cusip2, investmentcapacity, count(cusip2)  from edgelist_2008 a inner join investcap b on a.cusip2=b.prim_cusip and firm_year ='2008' group by cusip2 ;

select cusip1, investmentcapacity, count(cusip1)  from edgelist_2009 a inner join investcap b on a.cusip1=b.prim_cusip and firm_year ='2009' group by cusip1 ;
select cusip2, investmentcapacity, count(cusip2)  from edgelist_2009 a inner join investcap b on a.cusip2=b.prim_cusip and firm_year ='2009' group by cusip2 ;