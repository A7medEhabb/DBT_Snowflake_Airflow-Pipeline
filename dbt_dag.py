from airflow import DAG
from airflow.operators.bash import BshOperator
from datetime import datetime, timedelta

default_args= {
    'owner': 'airflow',
    'depends_on_past': False,
    'start_date': datetime(2026, 3, 17), 
    'retries': 1,
    'retry_delay': timedelta(minutes=5),
}

dag= DAG(
    'dbt_snowflake_pipeline',
    default_args= default_args,
    description= 'Run dbt models using Airflow',
    schedule_interval= '@daily',
    catchup=False
)

DBT_PROJECT_DIR = '/home/ahmedehab/snowflake_project' 

dbt_run = BashOperator(
    task_id = 'dbt_run',
    bash_command=f'cd {DBT_PROJECT_DIR} && dbt run',
    dag=dag
)
dbt_test = BashOperator(
    task_id= 'dbt_test',
    bash_command= f'cd {DBT_PROJECT_DIR} && dbt test',
    dag=dag
)

dbt_run >> dbt_test