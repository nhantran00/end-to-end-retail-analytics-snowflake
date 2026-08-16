from datetime import datetime, timedelta

from cosmos import DbtDag
from cosmos.config import (
    ProjectConfig,
    ProfileConfig,
    ExecutionConfig,
)
from cosmos.profiles import SnowflakeUserPasswordProfileMapping


profile_config = ProfileConfig(
    profile_name="retail_dwh",
    target_name="dev",
    profile_mapping=SnowflakeUserPasswordProfileMapping(
        conn_id="snowflake_conn",
        profile_args={
            "database": "retail_db",
            "warehouse": "retail_wh",
        },
    ),
)


retail_dbt_dag = DbtDag(
    dag_id="retail_dbt_dag",
    start_date=datetime(2026, 1, 1),
    schedule="@daily",
    catchup=False,
    default_args={
        "retries": 0,
    },
    tags=["retail", "dbt", "snowflake"],

    project_config=ProjectConfig(
        dbt_project_path="/opt/airflow/dbt",
    ),

    profile_config=profile_config,

    execution_config=ExecutionConfig(
        dbt_executable_path="/opt/airflow/dbt_venv/bin/dbt",
        install_dbt_deps=True,
    ),
)
