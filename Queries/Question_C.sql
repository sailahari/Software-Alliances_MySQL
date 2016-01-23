
drop table tobin;
create table tobin (prim_cusip varchar(5),conm varchar(100),firm_year int,tobinsq double,nacis2d int);
delete from tobin;
insert into tobin(select prim_cusip,conm,firm_year,((pref_stock+(stock_prices*sharesout)+current_liabilities-currassets+invent+itdebt)/(total_assets)) as tobinsq, naics2d from firmmetrics group by prim_cusip, conm, firm_year having tobinsq is not null);

select a.cusip1,a.cusip2, b.tobinsq, b.nacis2d from edgelist_2009 a inner join tobin b on a.cusip1=b.prim_cusip and firm_year='2009';
create table tobin1 (prim_cusip varchar(5),conm varchar(100),firm_year int,tobinsq double,nacis4d int);
delete from tobin1;
insert into tobin1(select prim_cusip,conm,firm_year,((pref_stock+(stock_prices*sharesout)+current_liabilities-currassets+invent+itdebt)/(total_assets)) as tobinsq, naics4d from firmmetrics group by prim_cusip, conm, firm_year having tobinsq is not null);

select a.cusip1,a.cusip2, b.tobinsq, b.nacis4d from edgelist_2009 a inner join tobin1 b on a.cusip2=b.prim_cusip and firm_year='2009';
