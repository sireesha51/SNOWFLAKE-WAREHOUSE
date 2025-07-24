CREATE OR REPLACE PROCEDURE load_bronze()
    RETURNS STRING
    LANGUAGE SQL
    EXECUTE AS CALLER
AS
$$
BEGIN
    -- Creating File Format for CRM
    EXECUTE IMMEDIATE 'SELECT ''CREATING CSV FORMAT FOR CRM''';
    
    EXECUTE IMMEDIATE '
    CREATE FILE FORMAT IF NOT EXISTS crm_csv_format
    TYPE = ''CSV''
    FIELD_OPTIONALLY_ENCLOSED_BY = ''"''
    COMPRESSION = ''GZIP''
    SKIP_HEADER = 1';
    
    -- Creating File Format for ERP
    EXECUTE IMMEDIATE 'SELECT ''CREATING CSV FORMAT FOR ERP''';
    
    EXECUTE IMMEDIATE '
    CREATE FILE FORMAT IF NOT EXISTS erp_csv_format
    TYPE = ''CSV''
    FIELD_OPTIONALLY_ENCLOSED_BY = ''"''
    COMPRESSION = ''GZIP''
    SKIP_HEADER = 1';

    -- Populating CRM tables
    EXECUTE IMMEDIATE 'SELECT ''Populating crm_cust_info table''';
    
    EXECUTE IMMEDIATE '
    COPY INTO bronze.crm_cust_info
    FROM @public.CRM/cust_info.csv.gz
    FILE_FORMAT = (FORMAT_NAME = crm_csv_format)';
    
    EXECUTE IMMEDIATE 'SELECT ''Populating crm_prd_info table''';
    
    EXECUTE IMMEDIATE '
    COPY INTO bronze.crm_prd_info
    FROM @public.CRM/prd_info.csv.gz
    FILE_FORMAT = (FORMAT_NAME = crm_csv_format)';
    
    EXECUTE IMMEDIATE 'SELECT ''Populating crm_sales_details table''';
    
    EXECUTE IMMEDIATE '
    COPY INTO bronze.crm_sales_details
    FROM @public.CRM/sales_details.csv.gz
    FILE_FORMAT = (FORMAT_NAME = crm_csv_format)';

    -- Populating ERP tables
    EXECUTE IMMEDIATE 'SELECT ''Populating erp_loc_a101 table''';
    
    EXECUTE IMMEDIATE '
    COPY INTO bronze.erp_loc_a101
    FROM @public.ERP/LOC_A101.csv.gz
    FILE_FORMAT = (FORMAT_NAME = erp_csv_format)';
    
    EXECUTE IMMEDIATE 'SELECT ''Populating erp_cust_az12 table''';
    
    EXECUTE IMMEDIATE '
    COPY INTO bronze.erp_cust_az12
    FROM @public.ERP/CUST_AZ12.csv.gz
    FILE_FORMAT = (FORMAT_NAME = erp_csv_format)';
    
    EXECUTE IMMEDIATE 'SELECT ''Populating erp_px_cat_g1v2 table''';
    
    EXECUTE IMMEDIATE '
    COPY INTO bronze.erp_px_cat_g1v2
    FROM @public.ERP/PX_CAT_G1V2.csv.gz
    FILE_FORMAT = (FORMAT_NAME = erp_csv_format)';
    
    RETURN 'Data population completed successfully!';
END;
$$;

-- To execute the procedure
CALL load_bronze();


