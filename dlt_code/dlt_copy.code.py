import dlt
import requests
import json
import os
from pathlib import Path
from dotenv import load_dotenv

# Ladda miljövariabler från .env-filen
load_dotenv()

# Fetches ads from the API
def _get_ads(url_for_search, params):
    headers = {'accept': 'application/json'}
    response = requests.get(url_for_search, headers=headers, params=params)
    response.raise_for_status()
    return json.loads(response.content.decode('utf8'))

# Specifies the base url and the ad search
@dlt.resource(write_disposition='replace')
def jobsearch_resource(params):
    url = os.getenv('API_URL')  # Hämta bas-URL från .env-filen
    url_for_search = f'{url}/search'

    # Yields ads until there are no more available
    while True:
        ads_data = _get_ads(url_for_search, params)
        hits = ads_data.get('hits', [])

        # Yield each ad
        for ad in hits:
            yield ad

        # If the amount of ads is less than the offset
        if len(hits) < params['limit']:
            break

        # Update offset for the next API fetch
        params['offset'] += params['limit']

# Extracts and loads data into Snowflake
def run_pipeline(query, table_name):
    # Create a pipeline instance with Snowflake configuration
    pipeline = dlt.pipeline(
        destination='snowflake',
        config={
            'snowflake': {
                'user': os.getenv("SNOWFLAKE_USER"),
                'password': os.getenv("SNOWFLAKE_PASSWORD"),
                'account': os.getenv("SNOWFLAKE_ACCOUNT"),
                'warehouse': os.getenv("SNOWFLAKE_WAREHOUSE"),
                'database': os.getenv("SNOWFLAKE_DATABASE"),
                'schema': os.getenv("SNOWFLAKE_SCHEMA"),
                'role': os.getenv("SNOWFLAKE_ROLE")
            }
        }
    )

    # Job search parameters
    params = {'q': query, 'limit': 100, 'offset': 0}

    # Kör pipelinen och skriv ut laddningsinformation
    load_info = pipeline.run(jobsearch_resource(params=params), table_name=table_name)
    print(load_info)

# Set the directory to where the script is located
if __name__ == '__main__':
    working_directory = Path(__file__).parent
    os.chdir(working_directory)

    # Define the search query and Snowflake table name
    query = 'projektledare'  # Ändra sökordet om nödvändigt
    table_name = 'stg_job_ads'  # Se till att rätt tabellnamn används i Snowflake

    # Executes the pipeline
    run_pipeline(query, table_name)
