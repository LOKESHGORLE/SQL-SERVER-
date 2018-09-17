select * into SalesDuplicate from sales ;
select * from SalesDuplicate;

CREATE TABLE SalesDuplicate(
	[SalesID] [int] identity(1,1) NOT NULL,
	[FirstName] [varchar](30) NULL,
	[LastName] [varchar](30) NULL,
	[QuantityPurchased] [int] NULL,
	[PricePerItem] [float] NULL
)

drop table SalesDuplicate;
delete from SalesDuplicate where salesid=4;

alter table SalesDuplicate add constraint PK_SalesID primary key(salesid)
delete from sales where salesid=4

create or alter procedure Proc_Dummy
as
declare @rowid int;
begin
set nocount on

 insert into SalesDuplicate(FirstName,LastName,QuantityPurchased,PricePerItem)
		values('lo','ke',4,10)
			print 10
	set @rowid = SCOPE_IDENTITY()
	select @rowid ;
	print cast(@rowid as varchar)
	print convert(varchar,@rowid) 
	print @rowid
	print 10

	
	end		

	exec Proc_Dummy