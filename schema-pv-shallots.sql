select *
from bamer;


-- Create a staging table to clean the data -----------------------------------------------------
create table bamer2
like bamer;

insert bamer2
select *
from bamer;


-- Checking duplicates --------------------------------------------------------------------------
select *
from (
		select *,
        row_number() over(
			partition by ï»¿Tanggal, prices, day_count, `month`
		) as row_num
		from bamer2
) duplicates
where row_num > 1;


-- Standardize formats --------------------------------------------------------------------------
select *
from bamer2;

alter table bamer2
rename column `ï»¿Tanggal` to `Date`,
rename column prices to Prices,
rename column day_count to Day_count,
rename column `month` to `Month`,
rename column season to Season,
rename column `weekday` to `Weekday`,
rename column is_holiday to Is_holiday,
rename column rolling_mean_7 to Rolling_mean_7,
rename column rolling_mean_30 to Rolling_mean_30,
rename column lag_1 to Lag_1,
rename column lag_7 to Lag_7,
rename column lag_30 to Lag_30,
rename column daily_delta to Daily_delta,
rename column cpi to CPI,
rename column Inflasi_total to Total_inflation,
rename column usd_idr to USD_IDR,
rename column `Curah Hujan` to Rainfall,
rename column Kelembapan to Humidity,
rename column day_in_month to Day_in_month,
rename column nilai_diff to Diff_value,
rename column percentage to Percentage;

select distinct `Date`
from bamer2;

update bamer2
set Rolling_mean_7 = null
where Rolling_mean_7 = '';

update bamer2
set Rolling_mean_30 = null
where Rolling_mean_30 = '';

update bamer2
set Lag_1 = null
where Lag_1 = '';

update bamer2
set Lag_7 = null
where Lag_7 = '';

update bamer2
set Lag_30 = null
where Lag_30 = '';

update bamer2
set Daily_delta = null
where Daily_delta = '';

update bamer2
set Diff_value = null
where Diff_value = '';

describe bamer2;

alter table bamer2
modify `Date` date,
modify Prices double,
modify Day_count int,
modify `Month` int,
modify `Weekday` int,
modify Rolling_mean_7 double,
modify Rolling_mean_30 double,
modify Lag_1 double,
modify Lag_7 double,
modify Lag_30 double,
modify Daily_delta double,
modify CPI double,
modify Total_inflation double,
modify USD_IDR double,
modify Temperature double,
modify Rainfall double,
modify Humidity double,
modify Day_in_month int,
modify Percentage double;


-- Data validation ------------------------------------------------------------------------------
select count(*) as total_rows
from bamer2;

select min(`Date`), max(`Date`)
from bamer2;

select `Date`, count(*)
from bamer2
group by `Date`
having count(*) > 1;

select
	min(Prices), max(Prices), avg(Prices)
from bamer2;

select 
	`Date`, date_sub(`Date`, interval 1 day) as prev_date
from bamer2 b1
where not exists (
	select 1
    from bamer2 b2
    where b2.`Date` = date_sub(b1.`Date`, interval 1 day)
)
order by `Date`;


-- Key findings ---------------------------------------------------------------------------------
select *
from bamer2;

-- How did the average shallot price change over time from 2020 to 2025?
select year(`Date`) as `Year`, avg(prices) as Avg_price
from bamer2
group by year(`Date`)
order by year;

-- What were the highest and lowest daily price changes?
select
	max(daily_delta) as Max_increase,
    min(daily_delta) as Min_decrease
from bamer2;

-- Do prices different between days with high and low rainfall?
select
	case
		when Rainfall > 10 then 'High Rainfall'
        else 'Low Rainfall'
	end as Rainfall_category,
    avg(prices) as Avg_price
from bamer2
group by rainfall_category;

-- Do prices different between days with high and low temperature?
select
	case
		when Temperature > 25 then 'High Temperature'
        else 'Low Temperature'
	end as Temperature_category,
    avg(prices) as Avg_price
from bamer2
group by Temperature_category;

-- Do prices different between days with high and low humidity?
select
	case
		when Humidity > 70 then 'High Humidity'
        else 'Low Humidity'
	end as Humidity_category,
    avg(prices) as Avg_price
from bamer2
group by Humidity_category;

-- Are there certain seasons where shallot prices are generally higher?
select Season, avg(prices) as Avg_price
from bamer2
group by Season
order by avg(Prices) desc;







