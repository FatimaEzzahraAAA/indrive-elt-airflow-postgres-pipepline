# 🚗 InDrive Real-Time Data Pipeline & Analytics

[![Python](https://img.shields.io/badge/Python-3.12-blue?logo=python&logoColor=white)](https://www.python.org/)
[![Docker](https://img.shields.io/badge/Docker-2496ED?logo=docker&logoColor=white)](https://www.docker.com/)
[![Apache Airflow](https://img.shields.io/badge/Apache_Airflow-017CEE?logo=apacheairflow&logoColor=white)](https://airflow.apache.org/)
[![PostgreSQL](https://img.shields.io/badge/PostgreSQL-336791?logo=postgresql&logoColor=white)](https://www.postgresql.org/)
[![Grafana](https://img.shields.io/badge/Grafana-F46800?logo=grafana&logoColor=white)](https://grafana.com/)
[![SQL](https://img.shields.io/badge/SQL-4479A1?logo=mysql&logoColor=white)](#)
[![Status](https://img.shields.io/badge/Status-Completed-success)](#)
[![License](https://img.shields.io/badge/License-MIT-green)](#)

## 📖 Overview
This project is a complete **End-to-End ELT (Extract, Load, Transform) Data Pipeline** simulating the operations of a ride-hailing service (InDrive) in Casablanca. It ingests real-time streaming data and batch files, cleanses the data through a Medallion Architecture (Raw → Staging → Mart), and visualizes live business KPIs on a Grafana dashboard.

The entire infrastructure is containerized using **Docker**, orchestrated by **Apache Airflow**, and stored in **PostgreSQL**.

---

## 🏗️ Architecture & ELT Flow

<img width="1408" height="768" alt="RT pipline" src="https://github.com/user-attachments/assets/5c9db6a5-6ad8-4f34-acb5-303e1c73ee38" />

# The 3 Data Layers (Medallion Architecture)

1.  🥉 Raw Layer: Data is ingested exactly as received from the API and CSVs. It contains duplicates, nulls, and intentional anomalies (e.g., ghost drivers with driver_id = 999).
2.  🥈 Staging Layer: SQL transformations clean the data. Duplicates are removed, invalid fares are dropped, and orphaned drivers are filtered out.
3.  🥇 Mart Layer: Data is joined, enriched, and aggregated into business-ready tables (Fact and Dimension tables) optimized for analytics.

<img width="1408" height="768" alt="pipline real time grafana" src="https://github.com/user-attachments/assets/8b1e9137-d79f-4620-9692-6b09bc188cb2" />


## 🛠️ Stack Technique
*   **Orchestration :** Apache Airflow
*   **Base de données :** PostgreSQL (Data Warehouse)
*   **Visualization :**  Grafana (Real-time Dashboards)
*   **DB Management :**  Adminer
*   **Infrastructure :** Docker & Docker Compose
*   **Langages :** Python, SQL


## 📊 Résultats 

  <img width="1887" height="432" alt="Capture d&#39;écran 2026-10-18 233946" src="https://github.com/user-attachments/assets/a5417eb7-7c2e-4375-b065-74a99d8cbd59" />

*   Le DAG `3_staging` nettoie et filtre les données invalides (ex: chauffeurs fantômes).
  
  <img width="1873" height="701" alt="Capture d&#39;écran 2026-10-18 234030" src="https://github.com/user-attachments/assets/950dccba-6f97-496f-b414-8b8085c0808d" />

*   Le DAG `4_marts` génère des tables agrégées : `revenue_by_zone`, `driver_leaderboard`.

  <img width="1880" height="632" alt="Capture d&#39;écran 2026-10-18 234054" src="https://github.com/user-attachments/assets/5909c87f-9da4-4225-8e94-4e58e0159add" />



## 📊 Dashboard Features (Grafana)
The live dashboard connects directly to the mart schema and refreshes every 5 seconds to display:

*  Global KPIs: Total Revenue, Total Rides, Active Drivers, Active Car Makes, Average Rating.
*  Geographic Performance: Revenue breakdown by Casablanca neighborhoods (Bourgogne, Oulfa, Anfa, etc.).
*  Fleet Analytics: Market share by vehicle type (Economy, Comfort, XL) and by car make (Dacia, Renault, Toyota).
*  Live Feed: A real-time table showing the latest incoming rides, distances, and prices.




https://github.com/user-attachments/assets/cf098877-400a-47ec-990d-639f0e0a9f82





