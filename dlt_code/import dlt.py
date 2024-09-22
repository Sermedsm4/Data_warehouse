from dotenv import load_dotenv
import os
import dlt

# Ladda miljövariabler från .env-filen
load_dotenv()

# Hämta miljövariabler
snowflake_user = os.getenv('SNOWFLAKE_USER')
snowflake_password = os.getenv('SNOWFLAKE_PASSWORD')
snowflake_account = os.getenv('SNOWFLAKE_ACCOUNT')
snowflake_warehouse = os.getenv('SNOWFLAKE_WAREHOUSE')
snowflake_database = os.getenv('SNOWFLAKE_DATABASE')
snowflake_schema = os.getenv('SNOWFLAKE_SCHEMA')
snowflake_role = os.getenv('SNOWFLAKE_ROLE')

# Kontrollera att alla variabler är korrekt laddade
print(f"SNOWFLAKE_USER: {snowflake_user}")
print(f"SNOWFLAKE_PASSWORD: {snowflake_password}")
print(f"SNOWFLAKE_ACCOUNT: {snowflake_account}")
print(f"SNOWFLAKE_WAREHOUSE: {snowflake_warehouse}")
print(f"SNOWFLAKE_DATABASE: {snowflake_database}")
print(f"SNOWFLAKE_SCHEMA: {snowflake_schema}")
print(f"SNOWFLAKE_ROLE: {snowflake_role}")

# Dummy-funktion för jobsearch_resource
def jobsearch_resource(params):
    # Implementera logik för att hämta data från en API eller annan källa
    pass

# Dummy params
params = {'param1': 'value1', 'param2': 'value2'}  # Anpassa efter dina behov

# Dummy table_name
table_name = 'example_table'

# Skapa pipeline
pipeline = dlt.pipeline(
    destination='snowflake',
    credentials={
        'database': snowflake_database,
        'username': snowflake_user,
        'host': snowflake_account,
        'password': snowflake_password
    },
    warehouse=snowflake_warehouse,
    role=snowflake_role
)

# Kör pipeline
try:
    load_info = pipeline.run(jobsearch_resource(params=params), table_name=table_name)
    print(f"Pipeline executed successfully: {load_info}")
except Exception as e:
    print(f"An error occurred: {e}")

