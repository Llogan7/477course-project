# NBA Salary–Performance Analysis (2022–2023 Season)

---

## Contributors
- **Jezzy Jia (ziyijia2)** — Data acquisition, licensing review, OpenRefine cleaning, name normalization, integration workflow design  
- **Logan Li (jiajun7)** — Feature engineering, exploratory/statistical analysis, visualization design, automated pipeline (run_all.ipynb), documentation

---

## 1. Summary

This project examines the relationship between NBA player salaries and on-court performance during the 2022–2023 regular season through a comprehensive, fully reproducible data curation and analysis pipeline. The work is motivated by ongoing debates in sports analytics and labor economics regarding whether player compensation accurately reflects real-time productivity, or whether structural, contractual, and contextual factors produce measurable distortions in salary allocation. By integrating independently authored datasets from Kaggle and applying rigorous data cleaning, normalization, and feature engineering procedures, this project provides an empirical foundation for quantifying player value and exploring the extent to which salary corresponds to actual performance outcomes.

### Research Motivation

NBA player salaries are determined through a mixture of collective bargaining agreements, multi-year contract structures, historical performance, perceived market value, and team-specific strategic considerations. Consequently, salary is not always a direct reflection of a player's current-season impact. Veterans signed under previous contract conditions may be overcompensated in later years, while rookies and minimum-salary contributors may generate substantial value at low cost. The objective of this project is to examine these patterns within a single season using reproducible, data-driven methods.

Our central research question is:

**Is there a measurable relationship between NBA player salaries and on-court performance during the 2022–2023 season?**

To operationalize this question, we analyze both raw performance metrics and several derived efficiency and value measures. These include per-minute efficiency, scoring efficiency, composite efficiency indices, and salary-normalized value metrics. By comparing salary to both traditional and derived measures, we aim to identify which kinds of performance indicators correlate most strongly with compensation and which players appear misaligned with market expectations.

### Dataset Overview

This project integrates two independent datasets. The performance dataset is licensed under CC BY 4.0, permitting redistribution, and is included in the repository under `data/raw/performance_2022_2023.csv`. The salary dataset is governed by Kaggle’s “Other” license, which provides no explicit redistribution rights. To comply with IS477 Module 2 licensing requirements, the raw salary dataset is not included in this repository. Instead, we provide a link to the original Kaggle source and instructions for users to download it manually. The cleaned salary information, derived metrics, and integrated datasets are legally shareable and are included in the repository.

### Data Curation and Cleaning

Because the datasets originate from different sources and lack a common player identifier, extensive cleaning and normalization were required to enable accurate integration. We used OpenRefine to standardize player names, remove punctuation and spacing inconsistencies, and cluster variations such as “A.J. Lawson” versus “AJ Lawson.” All OpenRefine transformations are preserved in the JSON histories located in:

data/cleaned_data/Performance_history.json
data/cleaned_data/salaries_history.json

Additional data curation steps included converting salary fields from currency-formatted strings to numeric values, filtering salary entries to the 2022–2023 season, and removing irrelevant or malformed rows. On the performance dataset, players traded mid-season appeared multiple times; to avoid double-counting or inconsistent statistics, we applied a deterministic rule retaining the row corresponding to the team for which the player logged the most games.

### Integration and Enrichment

After cleaning, we integrated the datasets using standardized player names as the join key. This produced a unified table (`merged_salary_stats.csv`) that aligns each player’s performance profile with their corresponding salary. From this merged data, we engineered several analytic variables designed to quantify efficiency and value.

Key derived metrics include:

- **efficiency_index**: a composite productivity measure calculated as points plus rebounds plus assists  
- **eff_per_min**: productivity normalized by minutes played  
- **salary_million**: salary expressed in millions for interpretability  
- **value_index**: a ratio of efficiency per minute to salary per million, used to assess value generation  

The final feature-enhanced analytic dataset (`final_dataset.csv`) contains 36 variables and is documented in the accompanying `Data_Dictionary.md`.

### Analytical Workflow

Our analyses evaluate both simple and composite relationships between salary and performance. We examine correlations between salary and points per game, efficiency per minute, composite performance indices, and salary-normalized value measures. Visualizations include salary distributions, salary-performance scatterplots, and bar charts highlighting the top and bottom performers in value_index and efficiency indices. All plots are generated automatically through the workflow pipeline and stored in:

run_all/plots/

### Workflow Automation and Reproducibility

To ensure reproducibility, our end-to-end analysis pipeline is encapsulated in `run_all.ipynb`. This notebook performs raw data loading, cleaning, integration, feature engineering, and visualization generation. The final analytic outputs, including merged datasets and plots, are also provided in a Box folder per course requirements:

https://uofi.app.box.com/folder/354747066623

### Summary Conclusion

The Summary section of this project demonstrates the full alignment of our workflow with IS477’s emphasis on data ethics, licensing compliance, transparent cleaning, structured integration, reproducibility, and rigorous exploratory analysis. The investigation ultimately provides a data-grounded perspective on the salary–performance relationship in the NBA, revealing measurable gaps between compensation and on-court impact. The sections that follow elaborate on dataset profiles, quality assessments, analytic findings, and future work.
