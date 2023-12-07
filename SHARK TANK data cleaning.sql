create database`shark tank`;
use `shark tank`;

select * from `data`;

describe `data`;

-- to change text to date, first change the format before u alter

select str_to_date(`original air date`, "%d-%M-%y") from data; 

-- TO CHANGE DATE FORMAT LIKE DD-MM-YY 
select date_format( Str_to_date(`original air date`, "%d-%M-%y"), "%y-%M-%d") from data;

-- modify the format of the originam air date
update data
set `original air date` = Str_to_date(`original air date`, "%d-%M-%y");

-- change the datatype of original air date from text to date
alter table data
modify `original air date` date;

-- to check all the empty spaces 
select * from data
where `total deal amount` = "";

-- update the total deal amount to 0 where they are empty
update data
set `total deal amount` = 0
where `total deal amount` = "";

-- change the data type or total deal amount from text to int
alter table data
modify `total deal amount` int;

-- apllying same process to total deal equity from the data table

-- update the total deal equity to 0 where they are empty
update data
set `total deal equity` = 0
where `total deal equity` = "";

-- change the data type or total deal equity from text to int
alter table data
modify `total deal equity` int;

select * from data;

/*-- for deal valuation, number of sharks in deal, investment amount per shark, equity per shark
update data
set `deal valuation` = 0
where `deal valuation` = "";

alter table data
modify `number of sharks in deal` int;
set `deal valuation` = 0
where `deal valuation` = "";

-- change the data type or total deal equity from text to int
alter table data
modify `deal valuation` int; */

update data
set `number of sharks in deal` = 0
where `number of sharks in deal` = "";

alter table data
modify `number of sharks in deal` int;

update data
set `investment amount per shark` = 0
where `investment amount per shark` = "";

alter table data
modify `investment amount per shark` int;

update datax
set `equity per shark` = 0
where `equity per shark` = "";

alter table data
modify `equity per shark` int;

/*Barbara Corcoran Investment Amount
Barbara Corcoran Investment Equity
Mark Cuban Investment Amount Mark Cuban Investment Equity
Lori Greiner Investment Amount Lori Greiner Investment Equity
Robert Herjavec Investment Amount Robert Herjavec Investment Equity
Daymond John Investment Amount Daymond John Investment Equity
Kevin O Leary Investment Amount Kevin O Leary Investment Equity
Guest Investment Amount Guest Investment Equity
*/

update data
set `Guest Investment Equity` = 0
where `Guest Investment Equity` = "";

alter table data
modify `Guest Investment Equity` int;

update data
set `loan` = 0
where `loan` = "";

alter table data
modify `Barbara Corcoran Investment Equity` int;



