# NBA Salary–Performance Analysis (2022–2023 Season)

---

## Contributors
- **Jezzy Jia (ziyijia2)** — Data acquisition, licensing review, OpenRefine cleaning, name normalization, integration workflow design  
- **Logan Li (jiajun7)** — Feature engineering, exploratory/statistical analysis, visualization design, automated pipeline (run_all.ipynb), documentation

---

# 1. Summary

The economics of NBA player salaries are shaped by performance, market forces, contract timing, injury history, and team strategy. Although elite players earn over $40–50 million annually, many mid-tier players and rookie-scale athletes generate substantial on-court value at much lower cost. Understanding whether compensation truly aligns with contribution is an important analytical and economic question. This project investigates that alignment using the 2022–2023 NBA season as a case study.

Our research question:

> **Is there a measurable relationship between NBA player salaries and on-court performance during the 2022–2023 season?**

To answer this, we curated, cleaned, integrated, and analyzed two independently authored datasets from Kaggle: one containing per-game performance statistics and another containing multi-season salary data. We followed the complete IS477 Data Science Lifecycle, including acquisition, profiling, cleaning, enrichment, integration, quality assessment, visualization, workflow automation, and reproducibility.

The performance dataset, licensed under CC BY 4.0, is included in our repository exactly as provided. The salary dataset, however, is licensed under Kaggle’s “Other” terms without explicit redistribution permissions. Per IS477 Module 2 requirements, this prohibits us from storing or redistributing the raw salary file. Therefore:

✔ We provide a link to the salary dataset  
✔ We provide cleaning instructions  
✔ We provide only *derived* salary outputs (legal to redistribute)  

Cleaning was conducted using a combination of **OpenRefine** and **Python**. Name cleaning, whitespace standardization, punctuation removal, and formatting transformations are preserved in two OpenRefine JSON histories:

- `data/cleaned_data/Performance_history.json`  
- `data/cleaned_data/salaries_history.json`

These files document transformation provenance and serve as transparent, reproducible data curation evidence.

A major challenge in merging the datasets was the absence of a universal player identifier. To overcome this, we rigorously standardized player names, removed inconsistencies, and applied fuzzy matching and manual clustering review in OpenRefine. Players traded mid-season appeared multiple times in the performance dataset; we applied a deterministic rule selecting the row with the highest games played, ensuring one row per player.

After cleaning and integration, we engineered several metrics to evaluate value:

- **efficiency_index** = PTS + REB + AST  
- **eff_per_min** = efficiency_index / minutes played  
- **salary_million** = salary / 1,000,000  
- **value_index** = eff_per_min / salary_million  

These metrics allow us to quantify player performance relative to salary, highlighting which athletes produce notable value per dollar spent.

Analytical findings include:

- Salary and raw performance (points per game) show **moderate correlation**, supporting the idea that scoring is a primary driver of compensation.
- Salary and per-minute efficiency correlate more weakly, indicating inefficiencies in how teams value contributions like rebounding and facilitating.
- Low-salary players (rookie-scale, two-way) were dramatically overrepresented among the top value_index performers.
- Several highly paid veterans displayed negative or near-zero value_index due to injuries, low minutes, or role decline.

We automated our full pipeline using `run_all.ipynb`, which performs cleaning, integration, feature engineering, and visualization. All plots generated are saved to:

