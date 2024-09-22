-- Testa om warehouse, database och schemas existerar
use role accountadmin;
show warehouses like 'data_warehouse_jobads';
show databases like 'data_warehouse_ads';
show schemas in database data_warehouse_ads;

-- Testa tilldelade privilegier för roller
use role securityadmin;
show grants to role dlt_role;
show grants to role dbt_role;
show grants to role streamlit_role;
show grants to role data_engineer_role;
show grants to role product_owner_role;

-- Testa tilldelade privilegier för användare
show grants to user dlt_user;
show grants to user dbt_user;
show grants to user streamlit_user;
show grants to user data_engineer_user;
show grants to user product_owner_user;

-- Testa för att se alla användare i warehouse
use role accountadmin;
-- Testa om warehouse, database och schemas existerar
use role sysadmin;
show warehouses like 'data_warehouse_jobads';
show databases like 'data_warehouse_ads';
show schemas in database data_warehouse_ads;

-- Testa tilldelade privilegier för roller
use role securityadmin;
show grants to role dlt_role;
show grants to role dbt_role;
show grants to role streamlit_role;
show grants to role data_engineer_role;
show grants to role product_owner_role;

-- Testa tilldelade privilegier för användare
show grants to user dlt_user;
show grants to user dbt_user;
show grants to user streamlit_user;
show grants to user data_engineer_user;
show grants to user product_owner_user;

    -- Visa alla användare och deras standard-warehouse
use role accountadmin;
select name, default_warehouse
from snowflake.account_usage.users;



