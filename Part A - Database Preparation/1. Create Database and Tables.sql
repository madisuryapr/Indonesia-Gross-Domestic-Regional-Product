/*
 1. Database and Tables Preparations
 In this SQL File, I perform initial phase of creating a database for
 Indonesia Gross Domestic Regional Product (GDRP, hereafter Produk Domestik Regional Bruto)
 for 38 Indonesia Provinces, consisting of 17 Sectors and 1 Aggregated Value of GDRP
 The Value Data are denominated in Billion IDR and acquired from
 Indonesia National Statistic Agency (also known as Badan Pusat Statistik or BPS), whereas
 Dimension table data are obtained from various sources, such as wikipedia
 */

 -- Phase I: Create Database for Indonesia Gross Domestic Regional Product
CREATE DATABASE Indonesia_gdrp;

-- Phase II: Create Both Fact and Dimension tables
-- a) Fact Table: GDRP Data
CREATE TABLE fact_Indonesia_gdrp (
    province_code VARCHAR(30),
    base_price_id VARCHAR(20),
    sector_id VARCHAR(20),
    time_id VARCHAR(20),
    time_quarter DATE,
    gdrp_value_billion_idr NUMERIC(25, 2)
);

-- b) Dimension Table: Provinces
CREATE TABLE dim_provinces (
    province_isocode VARCHAR(30),
    province_name TEXT,
    geo_id VARCHAR(20),
    region_id VARCHAR(20),
    economic_development_area_id VARCHAR(20)
);

-- c) Dimension Table: Region Area
CREATE TABLE dim_region_area (
    region_code VARCHAR(30),
    region_area_name_english TEXT,
    region_area_name_indonesia TEXT
);

-- d) Dimension Table: Geographic Area
CREATE TABLE dim_geographic_area (
    geo_isocode VARCHAR(30),
    geographic_area_name_english TEXT,
    geographic_area_name_indonesia TEXT
);

-- e) Dimension Table: Economic Development Area
CREATE TABLE dim_economic_development_area (
    edeva_code VARCHAR(30),
    economic_dev_area_name_english TEXT,
    economic_dev_area_name_indonesia TEXT,
    main_dev_id VARCHAR(30)
);

-- f) Dimension Table: Main Development Zone
CREATE TABLE dim_main_development_zone (
    main_dev_code VARCHAR(30),
    main_dev_name_english TEXT,
    main_dev_name_indonesia TEXT
);

-- g) Dimension Table: Quarter
CREATE TABLE dim_quarter (
    time_code VARCHAR(30),
    time_period DATE,
    quarter_period VARCHAR(20),
    year_id VARCHAR(20)
);

-- h) Dimension Table: Year
CREATE TABLE dim_year (
    year_code VARCHAR(20),
    year INTEGER
);

-- i) Dimension Table: Base Price
CREATE TABLE dim_base_price (
    base_price_code VARCHAR(20),
    base_price_name_english TEXT,
    base_price_name_indonesia TEXT
);

-- j) Dimension Table: Sectors
CREATE TABLE dim_sector (
    sector_code VARCHAR(30),
    sector_name_english TEXT,
    sector_name_indonesia TEXT
);