-- create politician table

create table Politicians (ID int primary key,Name varchar(50), country nvarchar(10));  
select * from Politicians;
select * from countries;

-- inserting into table
insert into Politicians (ID,Name,country) values (next value for empno, 'subash','india');
insert into Politicians (ID,Name,country) values (next value for empno, 'lincoln','usa');
insert into Politicians (ID,Name,country) values (next value for empno, 'chandra','india');
insert into Politicians (ID,Name,country) values (next value for empno, 'fidel','cuba');
insert into Politicians (ID,Name,country) values (next value for empno, 'treadeu','canada');
insert into Politicians (ID,Name,country) values (next value for empno, 'bhagath','india');

--creating countries table
create table countries (ID int identity(1,1),name varchar(10));
insert into countries values ('india');
insert into countries values ('usa');
insert into countries values ('cuba');
insert into countries values ('africa');
insert into countries values ('canada');


---update country name with respective country id from countries table
update Politicians set dbo.politicians.country= c.ID from Politicians p inner join countries c on  p.country=c.name ;
--the above statement throwed "multipart identidfier error could not be bound"
--this could be because of the console not able to identify the column name from the tables which maty have same names.
-- this could be rectified by using alias names and selecting columns from the intellisense suggestions.

select * from Politicians p join countries c on p.country=c.ID;
-- ERROR MSG: Conversion failed when converting the nvarchar value 'canada' to data type int.
-- beacuse canada is not in the countries table and also the data type of country in Politicians is different fromcountries id.

-- alter table Politician. add country id column(int) and  enter respective country id;
alter table Politicians add  Country_id int; 
update Politicians set dbo.politicians.country_id = c.ID from Politicians p join countries c on p.country=c.ID;
-- now delete country name column
alter table politicians drop column  country;

select p.ID,p.Name,c.name from Politicians p join countries c on p.country_id=c.ID;



--- create portfolio table
create table Portfolio (ID int primary key identity(1,1),Name varchar(20));
insert into Portfolio values ('IT');
insert into Portfolio values ('RAILWAYS');
insert into Portfolio values ('DEFENSE');
insert into Portfolio values ('FINANCE');
select * from Portfolio;
select * from Politicians;
select * from countries;
SELECT * FROM politicians_portfolios;


-- create table for politicians and portfolio id
create table politicians_portfolios ( Pf_ID int CONSTRAINT FK_PORT_POLIT foreign key references portfolio(id),
										Pol_ID int CONSTRAINT FK_POLIT_PORT foreign key  references politicians(id));

insert into politicians_portfolios values(1,5);
insert into politicians_portfolios values(1,4);
insert into politicians_portfolios values(2,6);
insert into politicians_portfolios values(2,8);
insert into politicians_portfolios values(1,4);
insert into politicians_portfolios values(3,9);
insert into politicians_portfolios values(4,9);
insert into politicians_portfolios values(3,6);

SELECT p.ID,p.Name,pf.Name 'portfolio',c.name 'country name' from Politicians p join politicians_portfolios pp on p.ID=pp.Pol_ID
										join Portfolio pf on pf.ID=pp.Pf_ID
										join countries c on p.country_id = c.ID ;
--- for alias names to the columns we can use single quotes t project column name.

---
select concat(p.country_id,p.Name) from Politicians p;
