/*
 In this file, I demonstrate a solution for importing CSV dataset
 with COPY FROM clause. It is beneficial for supporting data import
 process from .csv file type.
 */

 -- a) Data import for fact_indonesia_gdrp table
COPY fact_indonesia_gdrp
FROM
'D:\Data Analytics, Science, and Engineering\PostgreSQL\Indonesia GDRP Database\Dataset\CSV Format\fact_indonesia_gdrp.csv'
DELIMITER ','
CSV HEADER;

-- b) Data import for dim_base_price table
COPY dim_base_price
FROM
'D:\Data Analytics, Science, and Engineering\PostgreSQL\Indonesia GDRP Database\Dataset\CSV Format\dim_base_price.csv'
DELIMITER ','
CSV HEADER;

-- c) Data import for dim_economic_development_area
COPY dim_economic_development_area
FROM
'D:\Data Analytics, Science, and Engineering\PostgreSQL\Indonesia GDRP Database\Dataset\CSV Format\dim_economic_development_area.csv'
DELIMITER ','
CSV HEADER;

-- d) Data import for dim_geographic_area
COPY dim_geographic_area
FROM
'D:\Data Analytics, Science, and Engineering\PostgreSQL\Indonesia GDRP Database\Dataset\CSV Format\dim_geographic_area.csv'
DELIMITER ','
CSV HEADER;

-- e) Data import for dim_main_development_zone
COPY dim_main_development_zone
FROM
'D:\Data Analytics, Science, and Engineering\PostgreSQL\Indonesia GDRP Database\Dataset\CSV Format\dim_main_development_zone.csv'
DELIMITER ','
CSV HEADER;

-- f) Data import for dim_provinces
COPY dim_provinces
FROM
'D:\Data Analytics, Science, and Engineering\PostgreSQL\Indonesia GDRP Database\Dataset\CSV Format\dim_provinces.csv'
DELIMITER ','
CSV HEADER;

-- g) Data import for dim_quarter
COPY dim_quarter
FROM
'D:\Data Analytics, Science, and Engineering\PostgreSQL\Indonesia GDRP Database\Dataset\CSV Format\dim_quarter.csv'
DELIMITER ','
CSV HEADER;

-- h) Data import for dim_region_area
COPY dim_region_area
FROM
'D:\Data Analytics, Science, and Engineering\PostgreSQL\Indonesia GDRP Database\Dataset\CSV Format\dim_region_area.csv'
DELIMITER ','
CSV HEADER;

-- i) Data import for dim_sector
COPY dim_sector
FROM
'D:\Data Analytics, Science, and Engineering\PostgreSQL\Indonesia GDRP Database\Dataset\CSV Format\dim_sector.csv'
DELIMITER ','
CSV HEADER;

-- j) Data import for dim_year
COPY dim_year
FROM
'D:\Data Analytics, Science, and Engineering\PostgreSQL\Indonesia GDRP Database\Dataset\CSV Format\dim_year.csv'
DELIMITER ','
CSV HEADER;