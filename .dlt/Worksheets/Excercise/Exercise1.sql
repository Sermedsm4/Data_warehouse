USE DATABASE movies;
CREATE ROLE analyst;
GRANT SELECT ON ALL TABLES IN SCHEMA public TO analyst;
GRANT SELECT ON ALL VIEWS IN SCHEMA public TO analyst;
GRANT USAGE ON SCHEMA public TO analyst;
GRANT CREATE TABLE ON SCHEMA public TO analyst;
GRANT CREATE TEMPORARY TABLE ON SCHEMA public TO analyst;
GRANT CREATE VIEW ON SCHEMA public TO analyst;

GRANT SELECT ON FUTURE TABLES IN SCHEMA public TO analyst;
GRANT SELECT ON FUTURE VIEWS IN SCHEMA public TO analyst;
GRANT ROLE analyst TO USER sermedsm4;
SHOW GRANTS TO ROLE analyst;

CREATE WAREHOUSE marketing_wh
WITH
WAREHOUSE_SIZE = "XSMALL"
AUTO_SUSPEND = 60
AUTO_RESUME = TRUE
INITIALLY_SUSPENDED = TRUE
COMMENT = "Warehouse for the marketing department";

USE ROLE ACCOUNTADMIN;

CREATE DATABASE IF NOT EXISTS ifood;
CREATE SCHEMA ifood.staging;
CREATE USER extract_loaderr
PASSWORD = "extract.loader"
DEFAULT_ROLE = marketing_wh
MUST_CHANGE_PASSWORD = TRUE;

CREATE ROLE marketing_dlt_role;
GRANT USAGE ON SCHEMA ifood.staging TO ROLE marketing_dlt_role;
GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA ifood.staging TO ROLE marketing_dlt_role;
GRANT SELECT, INSERT, UPDATE, DELETE ON FUTURE TABLES IN SCHEMA ifood.staging TO ROLE marketing_dlt_role;
GRANT ROLE marketing_dlt_role TO USER extract_loaderr;

USE DATABASE ifood;
USE SCHEMA staging;

CREATE OR REPLACE TABLE staging_marketing_data (
    campaign_id STRING,
    campaign_name STRING,
    impressions INT,
    clicks INT,
    spend FLOAT,
    conversion INT
);

