# NBA Player Salary vs Performance (2022–2023 Season)

## Contributors
- **Jezzy Jia (ziyijia2@illinois.edu)**  
- **Logan Li (jiajun7@illinois.edu)**  

---

# Summary
This project examines the relationship between NBA player salaries and their on-court performance during the **2022–2023 NBA season**. We integrate two independently authored datasets from Kaggle—one containing player performance statistics and another containing multi-season salary data.

The project investigates:
- Whether salary aligns with performance  
- Which players are undervalued or overvalued  
- Performance-efficiency metrics (salary per point, salary per minute, etc.)  
- Correlation between financial compensation and production  

This project follows the complete IS477 data lifecycle:
1. Data discovery  
2. Ethical review  
3. Acquisition  
4. Storage & organization (DuckDB)  
5. Extraction & enrichment  
6. Integration  
7. Quality assessment  
8. Cleaning  
9. Workflow automation & provenance  
10. Reproducibility  
11. Metadata & documentation  

---

# Data Profile

## Dataset 1 — NBA Player Stats (2022–2023)
**Source:** https://www.kaggle.com/datasets/bryanchungweather/nba-players-data-2022-2023  
**License:** **CC BY 4.0**  

### Contents
- Player name  
- Team  
- PTS / AST / REB / STL / BLK  
- Shooting splits  
- Per-game + advanced stats  

### Notes
- Fully open under CC BY 4.0  
- Public athlete performance data (no privacy issues)  
- Citable and reusable  

---

## Dataset 2 — NBA Player Salaries (2020–2025)
**Source:** https://www.kaggle.com/datasets/omarsobhy14/nba-players-salaries  
**License:** **Other (no explicit license)**  

### Legal/Ethical Requirements
- Kaggle "Other" license → **no redistribution allowed**  
- Raw salary CSV **is NOT included in this repo**  
- Instead, instructions + scripts provided  
- Only **derived data** stored in the repo  

---

## Schema Differences
| Concept | Stats Dataset | Salary Dataset |
|--------|----------------|----------------|
| Player Name | Varies, inconsistent | Varies, inconsistent |
| Season Format | "2022-23" | "2022/2023", "2022-2023" |
| Team Names | Abbreviations | Full names or abbreviations |
| Salary | N/A | "$12,450,000" → messy formatting |

This required extensive cleaning and harmonization.

---

# Data Quality Summary

### Accuracy
- Player names standardized (lowercase, trimmed)
- Clustering in OpenRefine used to fix spelling variations
- Team names normalized
- Salary values converted from strings to numerics

### Completeness
- Missing salary values identified  
- Missing stat rows removed  
- Blank fields detected with facets (OpenRefine)

### Consistency
- Season normalized to "2022-2023"  
- Data types standardized  
- Casing and formatting cleaned  

### Timeliness
- All data corresponds to the same season  
- No outdated or mixed-season rows kept  

A full detailed quality report is in **StatusReport.md**.

---

# Cleaning Process

## Using OpenRefine
Steps performed:
1. **Text Faceting** — detect inconsistent names  
2. **Transform** → lowercase(), trim(), remove extra spaces  
3. **Clustering** → Fingerprint, Metaphone3, Levenshtein  
4. **Salary cleaning**  
   - Remove `$`  
   - Remove commas  
   - Convert to integer  
5. **Missing values**  
   - Facet → blank / non-blank  
6. Export cleaned CSV + JSON operation history  

## Using DuckDB
We use DuckDB as the main structured storage engine.

### Loading data:

```sql
CREATE TABLE stats AS
SELECT * FROM read_csv_auto('data/cleaned/nba_stats_2022_2023.csv');

CREATE TABLE salaries AS
SELECT * FROM read_csv_auto('data/cleaned/nba_salaries_2022_2023.csv');
```

### Integration:

```sql
SELECT *
FROM stats s
LEFT JOIN salaries sal
ON lower(trim(s.player)) = lower(trim(sal.player))
AND s.season = sal.season;
```

---

# Data Integration
### Main challenges
- Name mismatches  
- Different season formats  
- Missing or zero salaries  
- Duplicate partial matches  

### Results
- 92% players successfully joined by cleaned player name  
- Remaining unmatched rows handled manually or excluded  
- Final integrated dataset includes:
  - Stats  
  - Salary  
  - Derived value metrics  

---

# Findings
*(To be filled later after final analysis)*  
Example structure:
- Salary vs performance correlation  
- Top undervalued players  
- Most overpaid players  
- Team-level spending efficiency  
- Visualizations  

---

# Future Work
- Extend analysis to multi-season trends  
- Apply ML models for salary prediction  
- Include contextual variables such as injuries, minutes, team role  
- Build interactive dashboards  
- Expand advanced metrics (PER, WS/48, BPM, VORP)  

---

# Reproducibility Instructions

## Step 1 — Clone Repo
```
git clone https://github.com/<your-repo>.git
cd nba-salary-performance
```

## Step 2 — Install Dependencies
```
pip install -r requirements.txt
```

## Step 3 — Download Raw Datasets
**Due to license, raw salary data is NOT included.**

Place files into:
```
data/raw/
nba_stats_2022_2023.csv
nba_player_salaries_raw.csv
```

## Step 4 — Run Cleaning Workflow
```
python workflow/run_cleaning.py
```

## Step 5 — Run Integration
```
python workflow/run_integration.py
```

## Step 6 — Run Analysis
```
python analysis/run_analysis.py
```

Outputs appear in:
```
output/
```

---

# References
- Bryan ChungWeather. *NBA Players Data 2022–2023.* Kaggle. CC BY 4.0  
- Omar Sobhy. *NBA Players Salaries (2020–2025).* Kaggle.  
- DuckDB Documentation.  
- OpenRefine Documentation.

