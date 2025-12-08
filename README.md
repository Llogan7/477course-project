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

We provide a link to the salary dataset  
We provide cleaning instructions  
We provide only *derived* salary outputs (legal to redistribute)  

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

run_all/plots/


Final datasets and derived files are uploaded to Box per Milestone 4 requirements:

**Box folder:** https://uofi.app.box.com/folder/354747066623

This project demonstrates the full IS477 Data Lifecycle and provides a transparent, ethically compliant example of end-to-end data curation and analysis.

---

# 2. Data Profile

## Dataset 1: NBA Player Performance (2022–2023)

- **Source:** https://www.kaggle.com/datasets/bryanchungweather/nba-players-data-2022-2023  
- **License:** CC BY 4.0 (redistribution permitted)  
- **Location:** `data/raw/performance_2022_2023.csv`

The performance dataset contains per-game box score statistics for the 2022–2023 NBA season. Fields include minutes (MP), points (PTS), rebounds (REB), assists (AST), steals (STL), blocks (BLK), shooting percentages, and attempts. Data is complete and structurally clean, but still requires normalization.

### Profiling Observations

1. **Duplicates** — Many players traded mid-season appear multiple times.  
2. **Missing values** — Shooting percentages missing when attempts = 0.  
3. **Team inconsistencies** — Some teams represented differently across datasets.  
4. **Schema robustness** — Numeric columns fall within realistic NBA bounds.

### Cleaning and Transformation

Cleaning was performed via OpenRefine:

- Clustered and normalized player names  
- Standardized capitalization  
- Filled missing percentages with zeros  
- Applied row selection rule for traded players  

All steps are stored in:

data/cleaned_data/Performance_history.json


No ethical issues arise: the dataset is public, non-sensitive sports data, and the license explicitly allows redistribution.

---

## Dataset 2: NBA Salary Dataset

- **Source:** https://www.kaggle.com/datasets/omarsobhy14/nba-players-salaries  
- **License:** Kaggle Other — redistribution *not* permitted  
- **Location:** Must be downloaded manually per README instructions

### Legal & Ethical Compliance

Because the dataset lacks explicit redistribution permissions, we follow the strict IS477 rule:

🚫 Raw salary file **not included in GitHub**  
🚫 Raw salary file **not uploaded to Box**  
✔ Only derived (transformed) data included  

This ensures full compliance with licensing constraints.

### Profiling Observations

- Salary entries formatted as strings (“$34,250,000”)  
- Multi-season structure; required filtering to 2022–2023  
- Name inconsistencies  
- A small number of missing or invalid entries  

### Cleaning (OpenRefine + Python)

- Removed `$` and `,`  
- Converted salaries to integers  
- Filtered to 2022–2023 season  
- Normalized names by removing punctuation  
- Removed unused seasons  

Operation history saved in:

data/cleaned_data/salaries_history.json


---

## Integrated Dataset

The cleaned datasets were merged using standardized player names, producing:
data/merged_data/merged_salary_stats.csv

Final feature-enhanced dataset:
nba_salary_value_analysis/data/processed/final_dataset.csv

A detailed Data Dictionary for all 36 fields is included in:
Data_Dictionary.md

---

# 3. Data Quality Assessment

The quality assessment phase examined structural consistency, missingness, duplicates, schema compatibility, outliers, and the viability of integration via player names.

## Performance Data Quality Issues

### A. Duplicates from trades  
A player may appear under multiple teams; retaining multiple rows would distort statistics.  
**Resolution:** Kept only the row with the highest number of games played.

### B. Missing percentages  
When a player recorded zero attempts, shooting percentages were blank.  
**Resolution:** Replaced with 0, consistent with statistical conventions.

### C. Minor name inconsistencies  
Differences in spacing, capitalization, or suffixes (e.g., “Jr.”).  
**Resolution:** Normalized via OpenRefine clustering.

---

## Salary Data Quality Issues

### A. Salary formatting inconsistencies  
Values must be numeric for meaningful analysis.  
**Resolution:** Removed `$` and `,` and converted to integers.

### B. Multi-year schema  
Original dataset spans several seasons.  
**Resolution:** Filtered mechanism ensured only 2022–23 salaries included.

### C. Name mismatches  
Names such as “A.J. Lawson” vs “AJ Lawson.”  
**Resolution:** OpenRefine clustering + manual review.

### D. Missing salaries  
Certain players lacked 2022–23 salary data.  
**Resolution:** These players were removed from salary-related analysis.

---

## Integration Quality Risks

### A. No universal player ID  
The absence of a common identifier creates risk of false matches.  
**Mitigation:** Thorough OpenRefine normalization + manual review.

### B. Non-overlapping players  
Some players exist only in one dataset.  
**Mitigation:** Logged and excluded those from analyses requiring both salary and performance.

### C. Outliers  
Players on two-way contracts or on max deals create skew.  
**Mitigation:** Outliers preserved but acknowledged analytically.

---

# 4. Findings

Our analysis produced several insights into the salary–performance relationship.

### 4.1 Salary vs Points Per Game  
A moderate correlation exists: higher salaries generally correspond to higher scoring production, though with substantial variance.

### 4.2 Salary vs Efficiency Per Minute  
Scatterplots show wide dispersion; salary is a poor predictor of efficiency normalized by minutes played.

### 4.3 Value Index Insights  
Value Index reveals:

- **Most undervalued players:**  
  Dominated by players on rookie-scale or minimum contracts.

- **Most overvalued players:**  
  High-salary veterans with injury-reduced playing time.

Plots stored in:
run_all/plots/

### 4.4 Team-Level Value  
Teams such as BRK and MEM exhibit strong value efficiency; high-payroll teams cluster at the bottom.

---

# 5. Future Work

Possible extensions:

### A. Multi-season analysis  
Longitudinal analysis could reveal contract lag effects.

### B. Incorporate advanced analytics  
Metrics like RAPTOR, LEBRON, BPM, and WS would improve accuracy.

### C. Contextual modeling  
Account for injuries, usage rate, defensive assignments.

### D. Predictive modeling  
Machine learning to forecast salary or value_index.

### E. Payroll optimization  
Simulate roster-building under salary-cap constraints.

---

# 6. Reproducibility Instructions

### Step 1 — Download raw salary dataset
Download manually:

https://www.kaggle.com/datasets/omarsobhy14/nba-players-salaries

Place into:


