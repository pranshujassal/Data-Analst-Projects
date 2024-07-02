
# Uber Etl Data Engineering Project

A brief description of what this project does and who it's for

Analyzing Uber data using various tools and technologies, including GCP Storage, Python, Compute Instance, Mage Data Pipeline Tool, BigQuery, and visualizing it on Looker Studio.
## Project Architecture
![image](https://github.com/hiteshujani2002/uber-etl-data-engineering-project/assets/84509735/aca8b64d-10da-433a-8ff3-d2da5832d4eb)
## Data Model

![image](https://github.com/hiteshujani2002/uber-etl-data-engineering-project/assets/84509735/6964e4d4-46d0-483a-9df8-b32584a15220)


## Project Workflow

- ### Visualizing Data Model:

To make effective data analysis & decision making. We have created a fact-dimensions table including vendor_id as our primary key. The foreign keys includes:-
- datetime_id
- passenger_count_id
- trip_distance_id
- pickup_location_id
- drop_location_id
- rate_code_id
- payment_type_id

With the help of the above foreign keys, we have created the dimensions table for easy analysis.

- ### Creating Data Model on Jupyter Notebook:

After visualizing it on Lucidchart, we created it on Jupyter Notebook for better ETL process.

- ### Creating Cloud Storage on GCP:

The first step is to create a Google Cloud account followed by creating a project with bucket name and uploading data in csv format on buckets in object cloud storage.

![image](https://github.com/hiteshujani2002/uber-etl-data-engineering-project/assets/84509735/6ab181af-5218-4c28-9133-b576c039d925)

- ### Create a VM instance 

We need to create a VM instance in the cloud to run SSH on the server with the keys for running mage to do the ETL operations.

- ### Create a pipeline on MageAI

To create an etl pipeline, we will require three files named as:- 
- Load_uber_data - To load our data from storage on the pipeline.
- Uber_transformation - To transform the data and break it into fact and dimensions table.
- Uber_bg_load - For loading and connecting the data with BigQuery on the cloud for performing SQL analysis queries.
![image](https://github.com/hiteshujani2002/uber-etl-data-engineering-project/assets/84509735/29f13996-afa9-4e7b-81a0-7ea969f8e2e1)


- ### Performing Analysis from BigQuery

After successfully loading the data on BigQuery, we apply few SQL queries to analyse and join the columns that we help us while creating a dashboard.

- ![Screenshot (3377)](https://github.com/hiteshujani2002/uber-etl-data-engineering-project/assets/84509735/cb1f61ed-a613-4360-9c21-cb1b450a98f0)


- ![Screenshot (3378)](https://github.com/hiteshujani2002/uber-etl-data-engineering-project/assets/84509735/e03c92af-0bf9-4ec8-b59e-f4cfc806a89a)

- ![Screenshot (3379)](https://github.com/hiteshujani2002/uber-etl-data-engineering-project/assets/84509735/99819fc6-a053-48c9-a60e-7dc9e580920e)


- ### Analysing Final Data through Google Looker Studio

![Uber_Dashboard-1](https://github.com/hiteshujani2002/uber-etl-data-engineering-project/assets/84509735/05bcc754-da5d-4c92-8679-5dfcf05919d6)
## Tech Stack

- Google Cloud Services
- Looker Studio 
- Python (Jupyter Notebook) 
- Mage AI

