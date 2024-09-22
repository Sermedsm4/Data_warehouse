-- Tilldela roller till användare
GRANT ROLE dlt_role TO USER dlt_user;
GRANT ROLE dbt_role TO USER dbt_user;
GRANT ROLE streamlit_role TO USER streamlit_user;
GRANT ROLE data_engineer_role TO USER data_engineer_user;
GRANT ROLE product_owner_role TO USER product_owner_user;

-- Tilldela privilegier till roller för warehouse
GRANT USAGE ON WAREHOUSE data_warehouse_jobads TO ROLE dlt_role;
GRANT USAGE ON WAREHOUSE data_warehouse_jobads TO ROLE dbt_role;
GRANT USAGE ON WAREHOUSE data_warehouse_jobads TO ROLE streamlit_role;
GRANT USAGE ON WAREHOUSE data_warehouse_jobads TO ROLE data_engineer_role;
GRANT USAGE ON WAREHOUSE data_warehouse_jobads TO ROLE product_owner_role;

-- Tilldela privilegier till roller för databasen
GRANT USAGE ON DATABASE data_warehouse_ads TO ROLE dlt_role;
GRANT USAGE ON DATABASE data_warehouse_ads TO ROLE dbt_role;
GRANT USAGE ON DATABASE data_warehouse_ads TO ROLE streamlit_role;
GRANT USAGE ON DATABASE data_warehouse_ads TO ROLE data_engineer_role;
GRANT USAGE ON DATABASE data_warehouse_ads TO ROLE product_owner_role;

-- Tilldela privilegier till roller för schemat staging
GRANT USAGE ON SCHEMA data_warehouse_ads.staging TO ROLE dlt_role;
GRANT USAGE ON SCHEMA data_warehouse_ads.staging TO ROLE dbt_role;
GRANT USAGE ON SCHEMA data_warehouse_ads.staging TO ROLE streamlit_role;
GRANT USAGE ON SCHEMA data_warehouse_ads.staging TO ROLE data_engineer_role;
GRANT USAGE ON SCHEMA data_warehouse_ads.staging TO ROLE product_owner_role;

-- Tilldela ytterligare privilegier för datamanipulation
GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA data_warehouse_ads.staging TO ROLE dlt_role;
GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA data_warehouse_ads.staging TO ROLE dbt_role;
GRANT SELECT ON ALL TABLES IN SCHEMA data_warehouse_ads.staging TO ROLE streamlit_role;
GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA data_warehouse_ads.staging TO ROLE data_engineer_role;
GRANT SELECT ON ALL TABLES IN SCHEMA data_warehouse_ads.staging TO ROLE product_owner_role;