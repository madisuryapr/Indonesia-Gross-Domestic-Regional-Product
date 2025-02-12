/*
 Assigning Primary and Foreign Keys
 In this file, I demonstrate how to assign both primary and foreign keys within a database.
 This approach is essential to supporting future data analysis.
 */

 -- a) fact_indonesia_gdrp(province_code) --> dim_provinces(province_isocode)
ALTER TABLE dim_provinces
ADD PRIMARY KEY (province_isocode);

ALTER TABLE fact_indonesia_gdrp
ADD FOREIGN KEY (province_code) REFERENCES dim_provinces(province_isocode);

-- b) fact_indonesia_gdrp(time_id) --> dim_quarter(time_code)
ALTER TABLE dim_quarter
ADD PRIMARY KEY (time_code);

ALTER TABLE fact_indonesia_gdrp
ADD FOREIGN KEY (time_id) REFERENCES dim_quarter(time_code);

-- c) fact_indonesia_gdrp(base_price_id) --> dim_base_price(base_price_code)
ALTER TABLE dim_base_price
ADD PRIMARY KEY (base_price_code);

ALTER TABLE fact_indonesia_gdrp
ADD FOREIGN KEY (base_price_id) REFERENCES dim_base_price(base_price_code);

-- d) fact_indonesia_gdrp(sector_id) --> dim_sector(sector_code)
ALTER TABLE dim_sector
ADD PRIMARY KEY (sector_code);

ALTER TABLE fact_indonesia_gdrp
ADD FOREIGN KEY (sector_id) REFERENCES dim_sector(sector_code);

-- e) dim_quarter(year_id) --> dim_year(year_code)
ALTER TABLE dim_year
ADD PRIMARY KEY (year_code);

ALTER TABLE dim_quarter
ADD FOREIGN KEY (year_id) REFERENCES dim_year(year_code);

-- f) dim_provinces(geo_id) --> dim_geographic_area(geo_isocode)
ALTER TABLE dim_geographic_area
ADD PRIMARY KEY (geo_isocode);

ALTER TABLE dim_provinces
ADD FOREIGN KEY (geo_id) REFERENCES dim_geographic_area(geo_isocode);

-- g) dim_provinces(region_id) --> dim_region_area(region_code)
ALTER TABLE dim_region_area
ADD PRIMARY KEY (region_code);

ALTER TABLE dim_provinces
ADD FOREIGN KEY (region_id) REFERENCES dim_region_area(region_code);

-- h) dim_provinces(economic_development_area_id) --> dim_economic_development_area(edeva_code)
ALTER TABLE dim_economic_development_area
ADD PRIMARY KEY (edeva_code);

ALTER TABLE dim_provinces
ADD FOREIGN KEY (economic_development_area_id) REFERENCES dim_economic_development_area(edeva_code);

-- i) dim_economic_development_area(main_dev_id) --> dim_main_development_zone(main_dev_code)
ALTER TABLE dim_main_development_zone
ADD PRIMARY KEY (main_dev_code);

ALTER TABLE dim_economic_development_area
ADD FOREIGN KEY (main_dev_id) REFERENCES dim_main_development_zone(main_dev_code);