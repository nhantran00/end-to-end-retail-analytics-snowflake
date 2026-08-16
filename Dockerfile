ARG AIRFLOW_VERSION=3.1.1
ARG PYTHON_VERSION=3.11
FROM apache/airflow:${AIRFLOW_VERSION}-python${PYTHON_VERSION}

USER root
RUN python -m venv /opt/airflow/dbt_venv \
    && chown -R airflow:root /opt/airflow/dbt_venv

USER airflow
COPY requirements.txt /requirements.txt

RUN /opt/airflow/dbt_venv/bin/pip install --no-cache-dir dbt-snowflake \
    && pip install --no-cache-dir "apache-airflow==${AIRFLOW_VERSION}" -r /requirements.txt
