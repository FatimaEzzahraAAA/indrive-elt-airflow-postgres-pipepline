# 🚗 InDrive Ride Data Pipeline

## 📝 Description
Un pipeline de données (ELT) de bout en bout pour une application de VTC (InDrive), simulant l'ingestion de données batch (CSV) et streaming (API), orchestré par Apache Airflow et stocké dans PostgreSQL.

## 🛠️ Stack Technique
*   **Orchestration :** Apache Airflow
*   **Base de données :** PostgreSQL
*   **Infrastructure :** Docker & Docker Compose
*   **Langages :** Python, SQL

## 🏗️ Architecture (Medallion)
1.  **Raw :** Ingestion brute des données (CSV et API REST).
2.  **Staging :** Nettoyage, déduplication et validation des données.
3.  **Mart :** Modélisation dimensionnelle (Faits et Dimensions) prête pour la BI.

## 🚀 Comment lancer le projet
1. Cloner le dépôt.
2. Lancer les conteneurs : `docker compose up -d`
3. Accéder à Airflow : `http://localhost:8083`
4. Accéder à Adminer (Base de données) : `http://localhost:8086`

## 📊 Résultats
*   Le DAG `3_staging` nettoie et filtre les données invalides (ex: chauffeurs fantômes).
*   Le DAG `4_marts` génère des tables agrégées : `revenue_by_zone`, `driver_leaderboard`.
