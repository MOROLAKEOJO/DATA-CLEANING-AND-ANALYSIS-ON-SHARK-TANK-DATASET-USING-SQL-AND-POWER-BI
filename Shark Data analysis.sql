use `shark tank`;
select * from `data`;
create view `number of pitchers` as
select count(`pitch number`) `total number of pitchers` from `data`;
-- distribution od startup in months
create view `distribution of startup in months` as
select  distinct(monthname(`original air date`)), count(`startup name`)
from `data`
group by monthname(`original air date`)
order by count(`startup name`) desc;

-- 1. What is the distribution of startups across different seasons of Shark Tank?
create view `distribution of startup across different seasons` as
select `season number`, count(`startup name`) `count of pitchers` from `data`
group by `season number`
order by `count of pitchers` desc;

-- 2. What industries were most commonly represented in the show?
create view `most represented show` as
select count(industry) `number of industry`, industry 
from `data`
group by industry
order by count(industry) desc;

-- 3. How was the gender distribution among the entrepreneurs who pitched their startups?
create view `entrepreneurs by gender` as
select `pitchers gender`, count(`pitchers gender`) from `data`
group by `pitchers gender`
order by count(`pitchers gender`) desc;

-- 4. Which city and state were most entrepreneurs from?
create view `Entrepreneurs by city and state` as
select  distinct(count(`pitchers city`)), `pitchers city`, `pitchers state`
from `data`
group by `pitchers city`,`pitchers state`
order by count(`pitchers city`) desc;

-- 5. How many of the pitches actually got a deal with the sharks?
create view `Pitchers that got deal` as
select count(`got deal`) `number of people that got deal`, `got deal`
 from `data`
 group by 2;
 
select count(`got deal`) from `data`
where `got deal` = 1;


-- 6. What was the total amount secured by startups in deals?
create view `Total amount secured by startups` as
select sum(`investment amount per shark`) `total amount`
from `data`
where `got deal` =1;

-- 7. What was the total average equity given up by startups in each industry when got deals?
create view `Average equity given by startup per industry` as
select industry, round(avg(`total deal equity`),2) `average equity`
from `data`
where `total deal equity` <> 0
group by industry;

--  8. How much did Barbara Corcoran typically invest in startups, and what equity did she receive?
create view `Barbara investment and equity` as
SELECT SUM(`BARBARA CORCORAN INVESTMENT AMOUNT`) `TOTAL AMOUNT`, SUM(`BARBARA CORCORAN INVESTMENT EQUITY`) AS `TOTAL EQUITY`
FROM `DATA`;

-- 9. How much did Mark Cuban typically invest in startups, and what equity did he receive?
create view `Mark Cuban investment and Equity` as
SELECT SUM(`MARK CUBAN INVESTMENT AMOUNT`) `TOTAL AMOUNT`, SUM(`MARK CUBAN INVESTMENT EQUITY`) AS `TOTAL EQUITY`
FROM `DATA`;

-- 10. How much did Lori Greiner typically invest in startups, and what equity did she receive?
create view `Lori Greiner investment and equity` as
SELECT SUM(`LORI GREINER INVESTMENT AMOUNT`) `TOTAL AMOUNT`, SUM(`LORI GREINER INVESTMENT EQUITY`) AS `TOTAL EQUITY`
FROM `DATA`;

-- 11. How much did Robert Herjavec typically invest in startups, and what equity did he receive?
create view `Robert Herjaec investment and Equity` as
SELECT SUM(`ROBERT HERJAVEC INVESTMENT AMOUNT`) `TOTAL AMOUNT`, SUM(`ROBERT HERJAVEC INVESTMENT EQUITY`) AS `TOTAL EQUITY`
FROM `DATA`;

-- 12. How much did Daymond John typically invest in startups, and what equity did he receive?
create view `Daymond John Inestment and Equity` as
SELECT SUM(`DAYMOND JOHN INVESTMENT AMOUNT`) `TOTAL AMOUNT`, SUM(`DAYMOND JOHN INVESTMENT EQUITY`) AS `TOTAL EQUITY`
FROM `DATA`;

-- 13. How much did Kevin O'Leary typically invest in startups, and what equity did he receive?
create view `Kevin O Leary Investment and Equity` as
SELECT SUM(`Kevin O Leary Investment Amount`) `TOTAL AMOUNT`, SUM(`Kevin O Leary Investment EQUITY`) AS `TOTAL EQUITY`
FROM `DATA`;

-- 14. Which entrepreneur has secured the largest investment deal in "Shark Tank" history
create view `tentrepreneur with largest investment deal` as
SELECT `STARTUP NAME`, MAX(`investment amount per shark`)FROM `DATA`
GROUP BY `STARTUP NAME`
ORDER BY MAX(`investment amount per shark`) DESC
LIMIT 0,1;

use `shark tank`;
-- USING UNION TO JOIN COLUMS RESULT TO GENARTE ANOTHER COLUMN
create view `Investors Amount invested and Equity` as
SELECT "Kevin O Leary" AS NAME, SUM(`Kevin O Leary Investment AMOUNT`) `TOTAL AMOUNT`, SUM(`Kevin O Leary Investment Equity`) AS `TOTAL EQUITY`
FROM `DATA`
UNION
SELECT "DAYMOND JOHN" AS NAME,SUM(`DAYMOND JOHN INVESTMENT AMOUNT`) `TOTAL AMOUNT`, SUM(`DAYMOND JOHN INVESTMENT EQUITY`) AS `TOTAL EQUITY`
FROM `DATA`
UNION
SELECT "LORI GREINER" AS NAME,SUM(`LORI GREINER INVESTMENT AMOUNT`) `TOTAL AMOUNT`, SUM(`LORI GREINER INVESTMENT EQUITY`) AS `TOTAL EQUITY`
FROM `DATA`
UNION
SELECT "MARK CUBAN" AS NAME,SUM(`MARK CUBAN INVESTMENT AMOUNT`) `TOTAL AMOUNT`, SUM(`MARK CUBAN INVESTMENT EQUITY`) AS `TOTAL EQUITY`
FROM `DATA`
UNION
SELECT "BARBARA CORCORAN" AS NAME, SUM(`BARBARA CORCORAN INVESTMENT AMOUNT`) `TOTAL AMOUNT`, SUM(`BARBARA CORCORAN INVESTMENT EQUITY`) AS `TOTAL EQUITY`
FROM `DATA`
UNION
SELECT "ROBERT HERJAVEC" AS NAME,SUM(`ROBERT HERJAVEC INVESTMENT AMOUNT`) `TOTAL AMOUNT`, SUM(`ROBERT HERJAVEC INVESTMENT EQUITY`) AS `TOTAL EQUITY`
FROM `DATA`;

-- 15.  Which shark has invested the most money in businesses related to the food and beverage industry?
--- select max( investment by shark) from data where industry = "food and beverages"
-- USING CTE - CREATE TABLE EXPRESSION
create view `shark with the most investment in food and beverages` as
with W AS (
select "ROBERT HERJAVEC" AS NAME, max(`ROBERT HERJAVEC INVESTMENT AMOUNT`) max  from `data`
where industry = "food and beverage"
union
SELECT "BARBARA CORCORAN" AS NAME, max(`BARBARA CORCORAN INVESTMENT AMOUNT`) max from `data`
where industry = "food and beverage"
union
SELECT "MARK CUBAN" AS NAME,max(`MARK CUBAN INVESTMENT AMOUNT`) Max from `data`
where industry = "food and beverage"
union
SELECT "LORI GREINER" AS NAME,max(`LORI GREINER INVESTMENT AMOUNT`) mX from `data`
where industry = "food and beverage"
union
SELECT "DAYMOND JOHN" AS NAME,SUM(`DAYMOND JOHN INVESTMENT AMOUNT`) max from `data`
where industry = "food and beverage"
union
SELECT "Kevin O Leary" AS NAME, SUM(`Kevin O Leary Investment AMOUNT`) max from `data`
where industry = "food and beverage")
SELECT * FROM W
WHERE MAX = (SELECT MAX(MAX) FROM W);

-- 16. Are there any trends in the industries or product categories that tend to receive higher valuation offers from the sharks?
create view `Deal valuation offered by industry` as
select industry, sum(`valuation requested`), sum(`deal valuation`)
from `data`
where `deal valuation` <> 0
group by industry;

select * from `data`;
-- 17. Did startups with a larger number of entrepreneurs tend to secure more favorable deals?

select `Multiple Entrepreneurs`, count(`multiple entrepreneurs`)
from `data`
group by `Multiple Entrepreneurs` ;
create view `number of entrepreneurs and favorable deal` as
with Tempo as (select `Multiple Entrepreneurs`, (`original ask amount`-`total deal amount`) as `Favourable deal`
from `data`
where `got deal` is not null)
select `Multiple Entrepreneurs`, count(`favourable deal`) from tempo
where `favourable deal` >=0
group by `Multiple Entrepreneurs`;

-- 18. Which industry or product category receives the highest average deal valuation from the sharks?
create view `Average deal valuation by industry` as
select industry, avg(`deal valuation`) `average deal valuation`
from `data`
where `deal valuation` <> 0
group by industry
order by avg(`deal valuation`) desc ;

-- 19. How do the total investments made by male and female entrepreneurs compare?
create view `total investment made by pichers gender` as 
select sum(`total deal amount`), `pitchers gender` as Gender
from `data`
group by `pitchers gender`;

-- 20. Are there any correlations between the amount of equity offered and the probability of securing a deal?
select 