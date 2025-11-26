# Indonesia Gross Domestic Regional Product (GDRP) Database

> **A Database ERD of Gross Domestic Regional Product (GDRP/PDBR) Data for 38 Indonesian Provinces**

## General Information
This is my first portfolio for 2025

This repository contains Indonesia Gross Domestic Regional Product (GDRP) Database project, in which comprises quarterly 
data for Indonesia's 38 provinces overall economy performance, encompassing 2010 to 2024 period of time. I engineered Extract, Load, and Transform (ELT)
process to cleanse the data with Power Query and designed its corresponding Entity Relationship Diagram (ERD) by utilizing DataGrip.

The cleansed data are deployed within PostgreSQL system as the Data Warehouse. The process of ELT, data cleansing, and deploying will be
examined later.

## Database Design
The database design for this project is presented with ER Diagram as follows:

![Indonesia GDRP Database ERD](https://github.com/user-attachments/assets/a4278c70-e8b0-43ed-9dda-3b7e1e0e3393)

This database encompasses 10 different tables, namely:
1. fact_indonesia_gdrp : This is the main fact table, in which encapsulates the data for Indonesia Gross Domestic Regional Product (GDRP), consisting of more than 50000 rows of data. The GDRP value data are denominated in Billion Indonesian Rupiah (IDR)
2. dim_base_price      : This dimension table contains two different types of base price for calculating GDRP value, i.e. Nominal (ADHB) and Real (ADHK) approaches. Please access Indonesia National Agency of Statistic (Badan Pusat Statistik or BPS) for details
3. dim_quarterly       : In this table, I inserted detailed data pertaining to date of times in quarterly terms
4. dim_year            : This table represents the year data and their corresponding ID
5. dim_sector          : This table contains data regarding 17 sectors within Indonesian economy. I standardized the sector code with 5 characters, combining sector ID from Indonesia 2020 Business Classification (also known as Klasifikasi Baku Lapangan Usaha Indonesia or KBLI 2020) with sector's abbreviation
6. dim_provinces        : This table encompassess informations regarding 38 Indonesia provinces
7. dim_region_area      : This table informs audience regarding the division of Indonesia's Region, also known as "Kawasan" in Bahasa Indonesia
8. dim_geographic_area  : This table represents Indonesia's Geographic area based on corresponding island
9. dim_economic_development_area  : This is the sub-table of main development zone table where it contains information regarding Indonesia's economic development area
10. dim_main_development_zone    : This table encapsulates information pertaining to Indonesia's main development zone
