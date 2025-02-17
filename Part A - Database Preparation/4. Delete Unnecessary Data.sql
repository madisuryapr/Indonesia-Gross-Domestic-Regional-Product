/*
 Delete Unnecessary Data
 This query main objective is to revise the incorrect data input for
 Indonesia GDRP Database
 */

 -- 1. Delete all data in fact tables related to total Gross Domestic Regional Product
DELETE FROM
    fact_indonesia_gdrp
WHERE
    sector_id = 'T-GDRP';

-- 2. Delete unnecessary sector code within dim_sector table
DELETE FROM
    dim_sector
WHERE
    sector_code = 'T-GDRP';