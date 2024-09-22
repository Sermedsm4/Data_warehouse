-- Byt till rollen ACCOUNTADMIN för att ha rätt behörigheter
USE ROLE ACCOUNTADMIN;

-- Skapa roller
CREATE ROLE IF NOT EXISTS dlt_role;
CREATE ROLE IF NOT EXISTS dbt_role;
CREATE ROLE IF NOT EXISTS streamlit_role;
CREATE ROLE IF NOT EXISTS data_engineer_role;
CREATE ROLE IF NOT EXISTS product_owner_role;

-- Skapa användare utan att ange DEFAULT_DATABASE och DEFAULT_SCHEMA (de är inte giltiga egenskaper)
CREATE USER IF NOT EXISTS dlt_user
    PASSWORD = 'dlt_user_password'
    DEFAULT_ROLE = dlt_role
    DEFAULT_WAREHOUSE = data_warehouse_jobads;

CREATE USER IF NOT EXISTS dbt_user
    PASSWORD = 'dbt_user_password'
    DEFAULT_ROLE = dbt_role
    DEFAULT_WAREHOUSE = data_warehouse_jobads;

CREATE USER IF NOT EXISTS streamlit_user
    PASSWORD = 'streamlit_user_password'
    DEFAULT_ROLE = streamlit_role
    DEFAULT_WAREHOUSE = data_warehouse_jobads;

CREATE USER IF NOT EXISTS data_engineer_user
    PASSWORD = 'data_engineer_user_password'
    DEFAULT_ROLE = data_engineer_role
    DEFAULT_WAREHOUSE = data_warehouse_jobads;

CREATE USER IF NOT EXISTS product_owner_user
    PASSWORD = 'product_owner_user_password'
    DEFAULT_ROLE = product_owner_role
    DEFAULT_WAREHOUSE = data_warehouse_jobads;


