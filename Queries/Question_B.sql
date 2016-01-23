drop table tobin;
create table tobin (prim_cusip varchar(5),conm varchar(100),firm_year int,tobinsq double);
delete from tobin;
insert into tobin(select prim_cusip,conm,firm_year,((pref_stock+(stock_prices*sharesout)+current_liabilities-currassets+invent+itdebt)/(total_assets)) as tobinsq from firmmetrics group by prim_cusip, conm, firm_year having tobinsq is not null);

select a.cusip2, b.tobinsq, count(a.cusip2)  from edgelist_2009 a inner join tobin b on a.cusip2=b.prim_cusip and firm_year ='2009' group by a.cusip2;
