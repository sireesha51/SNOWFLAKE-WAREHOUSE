/*
===============================================================================
DDL Script: Create Bronze Tables
===============================================================================
-- Script Purpose:
-- This script is designed to CREATE  OR REPLACE TABLEs within the 'bronze' schema of the DATAWAREHOUSEPROJECT database in Snowflake.
-- If the tables already exist, they will be dropped before being re-created.
-- Run this script to redefine the DDL structure of the 'bronze' tables.
===============================================================================
*/

DROP TABLE IF EXISTS bronze.crm_cust_info;

-- Create the table
CREATE  OR REPLACE TABLE bronze.crm_cust_info (
    cst_id              INT,
    cst_key             VARCHAR(50),
    cst_firstname       VARCHAR(50),
    cst_lastname        VARCHAR(50),
    cst_marital_status  VARCHAR(50),
    cst_gndr            VARCHAR(50),
    cst_create_date     DATE
);

DROP TABLE IF EXISTS bronze.crm_prd_info;

CREATE  OR REPLACE TABLE bronze.crm_prd_info (
    prd_id       INT,
    prd_key      VARCHAR(50),
    prd_nm       VARCHAR(50),
    prd_cost     INT,
    prd_line     VARCHAR(50),
    prd_start_dt DATETIME,
    prd_end_dt   DATETIME
);

DROP TABLE IF EXISTS bronze.crm_sales_details;

CREATE  OR REPLACE TABLE bronze.crm_sales_details (
    sls_ord_num  VARCHAR(50),
    sls_prd_key  VARCHAR(50),
    sls_cust_id  INT,
    sls_order_dt INT,
    sls_ship_dt  INT,
    sls_due_dt   INT,
    sls_sales    INT,
    sls_quantity INT,
    sls_price    INT
);

DROP TABLE IF EXISTS bronze.erp_loc_a101;

CREATE  OR REPLACE TABLE bronze.erp_loc_a101 (
    cid    VARCHAR(50),
    cntry  VARCHAR(50)
);

DROP TABLE IF EXISTS bronze.erp_cust_az12;

CREATE  OR REPLACE TABLE bronze.erp_cust_az12 (
    cid    VARCHAR(50),
    bdate  DATE,
    gen    VARCHAR(50)
);

DROP TABLE IF EXISTS bronze.erp_px_cat_g1v2;

CREATE  OR REPLACE TABLE bronze.erp_px_cat_g1v2 (
    id           VARCHAR(50),
    cat          VARCHAR(50),
    subcat       VARCHAR(50),
    maintenance  VARCHAR(50)
);
