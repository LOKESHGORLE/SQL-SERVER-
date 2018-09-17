
----///// insert procedure////---------

create or alter procedure Proc_StockAssignment(@pStockName nvarchar(30),
										@pExchange nvarchar(20),
										@psymbol nvarchar(20),
										@pPriceEarningRatio int) 
as
begin
if exists
 (select * from proc_stocks ps where upper(StockName)=upper(@pStockName) and upper(Exchange)=upper(@pExchange))
 
PRINT N'already exists'

else
begin
if (@pPriceEarningRatio<500) 
print 'exchange cant be less than 500';
else
insert into proc_stocks(StockName,Exchange,stocksymbol,PriceEarningsRatio) values (@pStockName,@pExchange,@psymbol,@pPriceEarningRatio);
--PRINT N'success';
end

end 
exec Proc_StockAssignment 'acu','nasdaq','apl',600;


----------/////// procedure for update validations////////-------

create or alter procedure Proc_UpdateStock ( @pStockName nvarchar(30),
											@pExchange nvarchar(20),
											@psymbol nvarchar(20),
											@pPriceEarningRatio int)
as
begin
if(@pPriceEarningRatio<500)
print 'PriceEarningRatio cannot be less than 500'
else
begin
if exists
 (select * from proc_stocks ps where upper(StockName)=upper(@pStockName) and (upper(stocksymbol)=upper(@psymbol) or upper(Exchange)=upper(@pExchange)))
 print ' stock name already exists for other stock'
 else
 update Stocks set StockName=@pStockName where (upper(stocksymbol)!=upper(@psymbol) and upper(Exchange)!=upper(@pExchange))
 end

 end

 
 exec Proc_UpdateStock 'apple inc','nasdaq','aapl',1400

 ------ delete procedure------

 create or alter procedure proc_StockDelete (@pStockName varchar(30),
											@pExchange varchar(20) )
as
declare @RecCount int
begin
select  @RecCount=count(*) from proc_stocks where Exchange=@pExchange;
 if (@RecCount<2)
 print'final redcord cannot be deleted'
 else 
 delete from proc_stocks where StockName = @pStockName and Exchange= @pExchange;
end

exec proc_StockDelete 'acu','nasdaq'


----- alter table proc
alter table proc_stocks add constraint CK_PER_LESS_THAN_500 check(PriceEarningsRatio!<500)

--select * from proc_stocks;

/*------------------------------------------ bank account statement ---------------*/

create table AccAudit (Account_ID int identity(1,1) primary key, AccName varchar(20),LastTrans date);
create table AccBalance(Account_id int foreign key references AccAudit(Account_id) , balance float, Ason date);
create table BalSummary (Account_ID int foreign key references AccAudit(Account_id), TransType varchar(10),TransAmt float,OpenBal float default 5000, CloseBal float) ;


insert into AccAudit values('abc',GETDATE())
insert into AccBalance(Account_id) select Account_ID from  AccAudit
select * from AccBalance;
select * from AccAudit;
select * from BalSummary;
update AccBalance set balance=5000;
 update AccBalance set ason=getdate();

create or alter procedure Proc_AccMaintain (@pAccountID int,
											@pTransType varchar(10),
											@pTransAmt float)
as
declare @ClosingBal int =0;
declare @OpeningBal int =0;
declare @LastTrans date;
begin
 begin transaction;
 select @LastTrans=max( LastTrans) from AccAudit where Account_ID=@pAccountID;
 select @OpeningBal=balance from AccBalance where Account_ID=@pAccountID and Ason=@LastTrans;
 if (upper(@pTransType)='DEBIT')
set @ClosingBal = @OpeningBal-@pTransAmt
else 
set @ClosingBal = @OpeningBal+@pTransAmt

  insert into BalSummary values (@pAccountID,@pTransType,@pTransAmt,@OpeningBal,@ClosingBal)
  insert into AccBalance values (@pAccountID,@ClosingBal,GETDATE())
  update AccAudit set LastTrans=GETDATE() where Account_ID=@pAccountID;

  commit transaction;
  end;
 
 exec Proc_AccMaintain 2,'credit',1000




