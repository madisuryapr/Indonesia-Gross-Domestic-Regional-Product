/*
 SQL Basic Analysis with SELECT Statement
 This file presents How I utilize SELECT statement for Basic Analysis in SQL
 */

 -- 1. Show all dataset from fact tables
SELECT *
FROM
    fact_indonesia_gdrp;

-- 2. How Many records does fact_indonesia_gdrp table has?
SELECT
    COUNT(*) AS number_of_rows
FROM
    fact_indonesia_gdrp;
-- This table has 74,016 records within it

-- 3. How many quarters does dim_quarter table has?
SELECT
    COUNT(*) AS number_of_quarters
FROM
    dim_quarter;
-- This query generates 60 records of quarters, equivalent to 15 years period of time

-- 4. What is the total of Gross Domestic Regional Product for each province
-- based on corresponding sector, base year and year period?
SELECT
    fgd.province_code AS province_id,
    dpro.province_name AS provinces_name,
    dsc.sector_name_english AS sector_name,
    dbp.base_price_name_indonesia AS base_price,
    dyr.year AS year_period,
    SUM(fgd.gdrp_value_billion_idr) AS total_gdrp_billion_idr
FROM
    fact_indonesia_gdrp AS fgd
INNER JOIN
    dim_quarter AS dqr ON fgd.time_id = dqr.time_code
INNER JOIN
    dim_year AS dyr ON dqr.year_id = dyr.year_code
INNER JOIN
    dim_provinces AS dpro ON fgd.province_code = dpro.province_isocode
INNER JOIN
    dim_sector AS dsc ON fgd.sector_id = dsc.sector_code
INNER JOIN
    dim_base_price AS dbp ON fgd.base_price_id = dbp.base_price_code
GROUP BY
    fgd.province_code,
    dpro.province_name,
    dsc.sector_name_english,
    dbp.base_price_name_indonesia,
    dyr.year
ORDER BY
    dpro.province_name,
    dsc.sector_name_english,
    dbp.base_price_name_indonesia,
    dyr.year;
-- This query will generate all records regarding Indonesia GDRP for each province
-- based on corresponding sector, base year and year

-- 5. What is the total GDRP for each province based on base price and year?
SELECT
    fgd.province_code AS province_id,
    dpro.province_name AS provinces_name,
    dsc.sector_name_english AS sector_name,
    dbp.base_price_name_indonesia AS base_price,
    dyr.year AS year_period,
    SUM(fgd.gdrp_value_billion_idr) AS total_gdrp_billion_idr
FROM
    fact_indonesia_gdrp AS fgd
INNER JOIN
    dim_quarter AS dqr ON fgd.time_id = dqr.time_code
INNER JOIN
    dim_year AS dyr ON dqr.year_id = dyr.year_code
INNER JOIN
    dim_provinces AS dpro ON fgd.province_code = dpro.province_isocode
INNER JOIN
    dim_sector AS dsc ON fgd.sector_id = dsc.sector_code
INNER JOIN
    dim_base_price AS dbp ON fgd.base_price_id = dbp.base_price_code
WHERE
    dsc.sector_code = 'T-GDRP'
GROUP BY
    fgd.province_code,
    dpro.province_name,
    dsc.sector_name_english,
    dbp.base_price_name_indonesia,
    dyr.year
ORDER BY
    dpro.province_name,
    dbp.base_price_name_indonesia,
    dyr.year;
-- This query hence generated all records regarding Indonesia's total GDRP for each province
-- based on year and base price

-- 6. What is the total Gross Domestic Regional Product for each Base Price in annual terms?
SELECT
    fgd.base_price_id AS base_price_code,
    dbp.base_price_name_indonesia AS base_price_indonesia,
    dbp.base_price_name_english AS base_price_english,
    dyr.year AS year,
    CAST(
        SUM(gdrp_value_billion_idr) AS BIGINT) AS total_gdrp
FROM
    fact_indonesia_gdrp AS fgd
INNER JOIN
    dim_sector AS dsr ON fgd.sector_id = dsr.sector_code
INNER JOIN
    dim_base_price AS dbp ON fgd.base_price_id = dbp.base_price_code
INNER JOIN
    dim_quarter AS dqr ON fgd.time_id = dqr.time_code
INNER JOIN
    dim_year AS dyr ON dqr.year_id = dyr.year_code
WHERE
    dsr.sector_code = 'T-GDRP'
GROUP BY
    fgd.base_price_id, dbp.base_price_name_indonesia,
    dbp.base_price_name_english, dyr.year
ORDER BY
    dbp.base_price_name_indonesia, dyr.year;
-- This query thus displayed information in regards to Indonesia's Annual GDRP for each year and base price.