/*
 Analyze Data with JOINs Statement
 This file objective is to demonstrate the application of JOINs Statement for analyzing
 Indonesia Gross Domestic Regional Product (GDRP) Data
 */

 -- 1. What are the annual averages of Manufacturing Sector GDRP for each province and Base Price?
SELECT
    fgd.province_code AS province_id,
    dps.province_name AS province,
    fgd.sector_id AS sector_code,
    dsc.sector_name_english AS sector_name,
    dyr.year AS year_periode,
    dbp.base_price_name_english AS base_price,
    CAST(
        AVG(fgd.gdrp_value_billion_idr) AS BIGINT
    ) AS sectoral_gdrp_billion_idr
FROM
    fact_indonesia_gdrp AS fgd
INNER JOIN
    dim_provinces AS dps ON fgd.province_code = dps.province_isocode
INNER JOIN
    dim_quarter AS dqr ON fgd.time_id = dqr.time_code
INNER JOIN
    dim_year AS dyr ON dqr.year_id = dyr.year_code
INNER JOIN
    dim_sector AS dsc ON fgd.sector_id = dsc.sector_code
INNER JOIN
    dim_base_price AS dbp ON fgd.base_price_id = dbp.base_price_code
WHERE
    dsc.sector_name_english = 'Manufacturing'
GROUP BY
    fgd.province_code, dps.province_name,
    fgd.sector_id, dsc.sector_name_english,
    dbp.base_price_name_english, dyr.year
ORDER BY
    dps.province_name, dbp.base_price_name_english, dyr.year;
-- This query hence generates data of annual averages of manufacturing sector GDRP for each province
-- Both Nominal and constant base price

-- 2. What are the annual totals of nominal GDRP for each geographic unit?
SELECT
    dga.geo_isocode AS geographic_code,
    dga.geographic_area_name_indonesia AS geographic_name,
    dya.year AS year_period,
    CAST(
        SUM(fgd.gdrp_value_billion_idr)
    AS BIGINT) AS total_nominal_gdrp_billion_idr
FROM
    fact_indonesia_gdrp AS fgd
INNER JOIN
    dim_provinces AS dps ON fgd.province_code = dps.province_isocode
INNER JOIN
    dim_geographic_area AS dga ON dps.geo_id = dga.geo_isocode
INNER JOIN
    dim_quarter AS dqa ON fgd.time_id = dqa.time_code
INNER JOIN
    dim_year AS dya ON dqa.year_id = dya.year_code
INNER JOIN
    dim_base_price AS dbp ON fgd.base_price_id = dbp.base_price_code
WHERE
    dbp.base_price_code = 'ADHB'
GROUP BY
    dga.geo_isocode, dga.geographic_area_name_indonesia,
    dya.year
ORDER BY
    dga.geographic_area_name_indonesia, dya.year;
-- This query therefore generates annual totals of nominal GDRP for each Geographical area