#  End-to-End Data Engineering Project Using dbt, Snowflake, and Airflow


- **Snowflake** for storage  
- **dbt** for transformations  
- **Apache Airflow** for orchestration  

---



## ⚙️ How It Works

1. Data exists in **Snowflake (raw layer)**
2. **Airflow DAG** is triggered
3. Airflow runs dbt commands:
   - `dbt run`
   - `dbt test`
4. dbt transforms data into clean models
5. Final tables are ready for analysis / BI

---

## 🧱 Tech Stack

| Tool        | Role |
|------------|------|
| Snowflake  | Data warehouse |
| dbt        | Transformations |
| Airflow    | Orchestration |
| Python     | Environment & DAGs |

---
## ✅ What This Project Shows

- How to integrate dbt with Airflow and snowflake
- How to structure a real data pipeline
- How to automate transformations
- How to apply data testing with dbt
  
---

## 📁 Project Structure
```
DBT_Snowflake_Airflow-Pipeline/
  ├── dbt_dag.py # Airflow DAG (pipeline definitions)
  ├── models/ # dbt models (staging, marts)
  ├── macros/ # Reusable SQL macros for dbt
  ├── tests/ # Data quality tests for dbt models
  ├── dbt_project.yml # dbt project configuration
  └── README.md # Project documentation
```
