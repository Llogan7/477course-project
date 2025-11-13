# 🏀 NBA Salary vs. Performance (2022–2023)
**IS 477 – Final Project**  
**Contributors:**  
- **Jezzy Jia (ziyijia2)** – Data acquisition, licensing review, cleaning, integration workflow  
- **Logan Li (jiajun7)** – Feature engineering, preliminary analysis, documentation  

---

## 📌 Project Summary
This project analyzes the relationship between **NBA player salaries** and **on-court performance** for the **2022–2023 season**, using two independently authored Kaggle datasets.  
Our goal is to answer:

- Do salaries align with performance?  
- Which players are undervalued or overvalued?  
- How do efficiency metrics relate to salary?  
- What correlations exist between production and compensation?  

The project follows the full **IS 477 Data Lifecycle**, including acquisition, profiling, cleaning, enrichment, integration, quality assessment, reproducibility, and workflow automation.

---

---

## 📊 Datasets

### **1. NBA Player Statistics (2022–2023)**
- Source: Kaggle  
- License: **CC BY 4.0** (redistributable with attribution)  
- Clean dataset includes standardized stat names and 29+ performance metrics.

### **2. NBA Salaries (Multi-Season Dataset)**
- Source: Kaggle  
- License: **Unspecified (“Other”) with no details provided**  
- **Cannot redistribute raw data**  
- We only provide:
  - Kaggle download link  
  - Cleaning instructions  
  - Derived, license-safe tables  

---

## 🔐 Ethical & Legal Compliance
- Salary dataset **has no explicit license**, so raw files are **not included**.  
- Only redistribution-safe outputs (cleaned numeric salary column, merged values, derivative summaries) are included.  
- This aligns with **IS 477 legal & ethical requirements**.

---

## 🧼 Data Cleaning & Standardization
Performed using **OpenRefine** + Python.

### Key Cleaning Steps (Performance Dataset)
- Renamed all columns for readability  
- Standardized capitalization and spacing  
- Fixed missing and percentage fields (0 attempts → 0%)  
- Normalized team abbreviations  
- Addressed players with multiple teams:
  - Kept the row with **highest Games Played (GP)**  

### Key Cleaning Steps (Salary Dataset)
- Removed future-season columns  
- Normalized Player Name formatting  
- Converted salary strings (`"$13,450,000"`) → integers  
- Removed all irrelevant ID columns  

### Player Name Standardization
Examples:
- `A.J. Lawson` → `AJ Lawson`  
- `Karl-Anthony Towns` → `Karl Anthony Towns`  
- Unified periods, hyphens, and spacing  

A reproducible **name_mapping.csv** will be included.

---

## 🔗 Data Integration (40% Complete)
Challenges identified:

### **Schema Mismatches**
- Name formats differ significantly  
- Salary dataset contains missing values  
- Some players appear in multiple rows (mid-season trades)  

### **Join Key**
- Final merge key: **Standardized Player Name + Season (2022–2023)**  

### **Next Steps**
- Implement fuzzy matching (RapidFuzz)  
- Finalize merged dataset  
- Validate integrated row counts  

---

## ⚙️ Planned Feature Engineering
Metrics to be computed:

### **Efficiency Metrics**
- Points per minute  
- Efficiency index: (PTS + AST + REB) normalized  
- Shooting efficiency blend (FG%, 3P%, FT%)  

### **Salary-Performance Metrics**
- Salary per point  
- Salary-adjusted efficiency  
- Value Index (final formula to be determined)  

---

## 🧪 Data Quality Assessment
Current findings:

- Salary dataset contains missing salary values  
- Performance dataset is mostly clean  
- Multiple-team players required rule-based selection  
- Advanced metrics (PER, WS, BPM) are not available  
- No injury or contextual variables  

---

## 🤖 Workflow Automation
Files currently in progress:
- `run_all.py` – executes end-to-end workflow  
- `requirements.txt` – environment setup  

Final automated workflow will:
1. Load raw data  
2. Clean datasets  
3. Standardize names  
4. Merge performance + salary  
5. Generate derived metrics  
6. Save final analytics dataset  

---

## 🔁 Reproducibility
This repository provides:

- **SHA256 hashes** for raw datasets  
- **OpenRefine operation history**  
- **Step-by-step setup in README**  
- Instructions on how to re-download raw Kaggle data  
- A deterministic automated pipeline (in progress)

---

## 🧩 Known Limitations
- No stable player IDs across datasets  
- Name standardization still risks mismatches  
- Trades complicate per-player aggregation  
- No advanced analytics metrics (PER, WS, RAPTOR)  
- No contextual variables (injury, role, minutes restrictions)  
- Automation scripts not yet finalized  
- Raw salary data cannot be redistributed due to licensing  

---

## 📜 License
This project is for **educational use** (IS 477).  
- Performance dataset is CC BY 4.0  
- Salary dataset raw files are **not redistributed** due to licensing ambiguity  
- All derived outputs comply with fair-use principles  


