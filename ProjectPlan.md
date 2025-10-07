# ProjectPlan.md

## Title

NBA Salary vs. Performance (2019–2024, with 2023–24 focus)

## Overview

This project aims to investigate if the salaries of NBA players are in line with their performance on the basketball court. Two datasets curated independently by Kaggle will be used: one on player statistics (2023-2024), and one on player salaries (yearly across multiple seasons). We will first measure the relationship between pay and performance, and discern if a player is overvalued or undervalued. Specifically, the analysis will involve (1) merging player salary and performance data, season-by-season, (2) deriving "value" metrics (e.g., efficiency per "salary" dollar), and (3) correlating and implementing simple forecasts/predictors. The general motivation for the project is to present a comprehensive, reproducible workflow from start to finish along the data life cycle in terms of: acquiring data, storing/organizing data, enriching data, integrating data, assessing quality, cleaning, and transparent reporting.

Research Questions

Is there a measurable relationship between NBA player salaries and on-court performance over recent seasons (with a detailed analysis of 2023–2024)?

Team

* Jezzy Jia (ziyijia2@illinois.edu)  — Data acquisition & integration; repository structure; workflow automation.

* Logan Li (jiajun7@illinois.edu) — Feature engineering, modeling/visualization; documentation & reporting.

## Datasets

We will use two distinct Kaggle datasets with different schemas and authorship. Both are public, stable, and widely used for educational analysis.

1. NBA Player Stats (2023–2024)

Link: [https://www.kaggle.com/datasets/bryanchungweather/nba-player-stats-dataset-for-the-2023-2024](https://www.kaggle.com/datasets/bryanchungweather/nba-player-stats-dataset-for-the-2023-2024)

Content: Per-player regular season stats for 2023–24 (e.g., Player, Team, games, minutes, PTS/AST/REB, shooting splits).

Use: Baseline performance features per player (with per-game, per-36, and efficiency-normalized variants).

Notes: Single-season scope is ideal for a clean join to salaries and for a focused case study.

2. NBA Players’ Salaries (multi-year)

Link: [https://www.kaggle.com/datasets/omarsobhy14/nba-players-salaries](https://www.kaggle.com/datasets/omarsobhy14/nba-players-salaries)

Content: Player-level salaries by team and season (e.g., Player, Team, Season, Salary).

Use: Financial features and targets for “value” metrics (e.g., salary per unit of performance).

Notes: We will filter to 2023–24 and optionally expand to adjacent seasons (2019–2024) if coverage/consistency allows.

Accessing includes methods & schemas which identifies: Both datasets are accessible via the web/Kaggle API as CSV. They are each authored independently; they use different schemas (columns, formats). This will satisfy the requirement of integrating disparate sources/schemas. Licensing/ToU: We will follow each dataset’s Kaggle Page license/terms, provide citations in the final README and will avoid redistributing the raw files, where such distribution is restricted.

**Timeline and Plans**

**Module 1: Data Lifecycle**

* We will follow the full data lifecycle discussed in class, starting from data discovery and ending with documentation.  
* Our work will move through stages like acquisition, cleaning, enrichment, and reporting.  
* The lifecycle helps us make the workflow organized and easier to reproduce.

### **Module 2: Ethical Data Handling**

* We will check the Kaggle license and terms of use before using each dataset.  
* Since this is public sports data, there are no privacy concerns, but we will still cite the original authors.  
* We will document all data sources clearly and avoid redistributing any copyrighted material.

### **Module 3: Data Collection and Acquisition**

* We will download the two Kaggle datasets and store them in separate folders.  
* The collection process will be simple—manual download or Kaggle CLI if possible.  
* We will record basic details like download date and file version for reference.

### **Module 4–5: Storage and Organization**

* We will organize our files in a clear folder structure with separate folders for raw, cleaned, and final data.  
* A small DuckDB database will be used to store and query the combined data.  
* We will make sure file and column names are consistent and easy to understand.

### **Module 6: Extraction and Enrichment**

* We plan to add new variables like “points per minute” or “performance per salary.”  
* These calculated metrics will help show the relationship between pay and production.  
* The enrichment process will be simple and clearly explained in our documentation.

### **Module 7–8: Data Integration**

* We will merge the salary and performance datasets by matching player names and seasons.  
* Any inconsistencies (like spelling differences) will be fixed manually if needed.  
* The combined dataset will include stats, salary, and calculated efficiency values.

### **Module 9: Data Quality**

* We will check for missing data, duplicate players, or unrealistic values (e.g., negative salaries).  
* A short summary will describe data completeness and any quality issues we find.  
* If possible, we will show a simple table of missing or incorrect records.

### **Module 10: Data Cleaning**

* We will fix or remove incorrect or incomplete records when necessary.  
* Numeric fields like salary will be converted to a consistent format (USD).  
* All cleaning steps will be noted so they can be repeated later.

### **Module 11–12: Workflow Automation and Provenance**

* We plan to write a short script that can run the data loading, cleaning, and merging steps automatically.  
* The script will save the final cleaned dataset and some summary tables or charts.  
* This helps track what was done and makes it easy to rerun the project later.

### **Module 13: Reproducibility and Transparency**

* We will include a requirements file showing which Python libraries we used.  
* Our README will explain how to rerun the project from start to finish.  
* The final release will include data descriptions, outputs, and instructions for replication.

### **Module 15: Metadata and Documentation**

* We will write a short data dictionary describing each column and how it was created.  
* All major steps (collection, cleaning, analysis) will be summarized in Markdown.  
* The repository will include links, citations, and references for anyone who wants to reuse our work.

## **Timeline**

| Date (2025) | Task | Deliverable |
| ----- | ----- | ----- |
| Sept 26 | Team formation and GitHub setup | Canvas group and repository created |
| Oct 14 | Submit project plan | ProjectPlan.md finalized and datasets selected |
| Oct 25 | Data collection and setup | Raw data downloaded and stored |
| Nov 11 | Submit status report | StatusReport.md with initial cleaning and merging results |
| Nov 27 | Data analysis and quality check | Clean dataset, basic results, and documentation |
| Dec 5 | Final testing and reproducibility | Script and workflow verified, outputs uploaded |
| Dec 10 | Final submission | GitHub release and Box data link shared |

## **Constraints**

This project is subject to a number of practical and methodological constraints. First, there would likely be an inconsistency in player naming conventions between the salary dataset and the performance data, complicating merging them, likely requiring either fuzzy matching techniques, or possibly manual correction. While the salary dataset includes multiple seasons, the performance dataset is focused primarily on 2023 \- 2024\. This means the performance data is not longitudinal, unless new data is added, and standardization is undertaken. Remaining issues with data quality include missing data, inconsistent formats in salaries, and potential for error in reported statistics being sampled from a larger set. Constraints also arise from a lack of available advanced metrics (e.g. PER, Win Shares), extending to the lack of being able to compute actual “values” as precisely for these players. Because the datasets are from Kaggle, there could be restrictions on licensing, or API usage that augments the inability to automate at scale. Lastly, the actual implementation frame of time conclusion and resources through the course means limits on the

## **Gaps** 

There are still multiple knowledge and methodological gaps. The most important gap is the lack of a standardized definition or benchmark for "overvalued" or "undervalued" player, meaning that a level of subjectivity exists in the interpretation, and we do not know how to define them in reference to the models. Also, we don’t know which of the modeling techniques—multiple linear regression, ridge regression, or a tree-based model—would provide the best predictive performance for salary-performance relationships. Additionally, the datasets do not contain some potentially important contextual variables (e.g. injuries, minutes played, team role) meaning additional potentially important variables will be left out of the datasets, not included in the measure of a player’s value. Another gap lies in the integration process as well; if the datasets do not contain a unique player id, or team identifier, the integration process will likely result in either the loss of data, or cause ambiguity while merging datasets that influences player valuations as well. Finally, the project does not yet have a definitive structure or framework for presenting or visualizing (i.e. static graphs, versus interactive dashboards) the findings which means uncertainty about how the content would eventually be viewed and interpreted.

