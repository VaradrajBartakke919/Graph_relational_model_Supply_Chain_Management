INSERT INTO postgres.public.area_codes (
    area_code,
    area)
select area_code,
    area
from production_cle_area_code
where area IN ('United States of America','Ecuador','Uruguay','Canada','Brazil');

INSERT INTO postgres.public.item_codes (
    item_code,
    item)
select item_code, item
from production_cle_item_code
where  item IN ('Apples','Oats','Spinach','Chickens','Wheat');

INSERT INTO element_codes (
    element_code,
    element)
select element_code, element
from production_cle_elements
--where  element IN ('Import quantity','Import value','Export quantity','Export value','Production','Food supply quantity (tonnes)','Producer Price (USD/tonne)')
 ;

INSERT INTO postgres.public.food_balances (
    area_code,
    area,
    item_code,
    item,
    element_code,
    element,
    unit,
    year_2020,
    year_2021,
    year_2022,
    year_2023)
SELECT
  area_code,
area,
  item_code,
  item,
  element_code,
  CASE
    WHEN element = 'Food supply quantity (tonnes)' THEN 'Consumption'
    ELSE element
  END AS element,
  unit,
  year_2020,
  year_2021,
  year_2022,
  year_2023
FROM foodbalances_cle
WHERE Element IN ('Production','Food supply quantity (tonnes)','Loss')
  AND item IN ('Apples','Oats','Spinach','Chickens','Wheat')
  AND area IN ('United States of America','Ecuador','Uruguay','Canada','Brazil')
  AND year_2020 IS NOT NULL
  AND year_2021 IS NOT NULL
  AND year_2022 IS NOT NULL
  AND year_2023 IS NOT NULL
ORDER BY area, item;


INSERT INTO postgres.public.trades (
    reporter_area_code,
    reporter_area,
    partner_area_code,
    partner_area,
    item_code,
    item,
    element_code,
    element,
    unit,
    year_2020,
    year_2021,
    year_2022,
    year_2023)
select reporter_area_code,
       reporter_area,
       partner_area_code,
       partner_area,
       item_code,
       item,
       element_code,
       element,
       unit,
       year_2020,
       year_2021,
       year_2022,
       year_2023
from trade_cle_trade_matrix
where year_2020 is not null and year_2021 is not null and year_2022 is not null and year_2023 is not null
    and element in ('Import quantity','Import value','Export quantity','Export value')
and item in ('Apples','Oats','Spinach','Chickens','Wheat')
  and trade_cle_trade_matrix.reporter_area in ('United States of America','Ecuador','Uruguay','Canada','Brazil')
and trade_cle_trade_matrix.partner_area in ('United States of America','Ecuador','Uruguay','Canada','Brazil')
order by reporter_area, partner_area, item;


INSERT INTO postgres.public.prices (
    area_code    ,
    area         ,
    item_code    ,
    item         ,
    element      ,
    element_code ,
    unit         ,
    year_2020,
    year_2021,
    year_2022,
    year_2023)
select area_code    ,
    area         ,
    item_code    ,
    item         ,
    element      ,
    element_code ,
    unit         ,
    y2020  ,
    y2021      ,
    y2022      ,
    y2023
from price_cle
where y2020 is not null and y2021 is not null and y2022 is not null and y2023 is not null
    --and element in ('Import quantity','Import value','Export quantity','Export value')
and element IN ('Producer Price (USD/tonne)')
and item in ('Apples','Oats','Spinach','Chickens','Wheat')
  and price_cle.area in ('United States of America','Ecuador','Uruguay','Canada','Brazil')
order by area, item;