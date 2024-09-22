USE ROLE ACCOUNTADMIN;

-- Tilldela roller till respektive användare
GRANT ROLE dlt_role TO USER dlt_user;
GRANT ROLE dbt_role TO USER dbt_user;
GRANT ROLE streamlit_role TO USER streamlit_user;
GRANT ROLE data_engineer_role TO USER data_engineer_user;
GRANT ROLE product_owner_role TO USER product_owner_user;

-- Validera att roller har tilldelats korrekt
SHOW GRANTS TO USER dlt_user;
SHOW GRANTS TO USER dbt_user;
SHOW GRANTS TO USER streamlit_user;
SHOW GRANTS TO USER data_engineer_user;
SHOW GRANTS TO USER product_owner_user;
