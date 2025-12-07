# NBA Salary vs. Performance Analysis (2022-2023)

**IS 477 - Final Project**

## Contributors
* **Jezzy Jia (ziyijia2)** - Data acquisition, licensing review, cleaning (OpenRefine), integration workflow.
* **Logan Li (jiajun7)** - Feature engineering, data analysis, visualization, documentation.

---

## Summary
This project investigates the relationship between NBA player salaries and their on-court performance for the 2022-2023 season. The motivation behind this analysis is to determine whether the massive contracts in the modern NBA are justified by statistical production and to identify which players represent the best and worst "value" for their teams.

We integrated two distinct datasets—performance statistics and salary data—to answer the following research questions:
1.  Is there a measurable correlation between a player's salary and their traditional statistical output (Points, Rebounds, Assists)?
2.  Who are the most undervalued (high performance, low salary) and overvalued (low performance, high salary) players in the league?
3.  Does higher pay guarantee higher efficiency?

**Key Findings:**
> *[TODO: summarize your actual findings here in 3-4 sentences. For example: "Our analysis revealed a moderate positive correlation (r=0.65) between salary and points per game. However, we found significant inefficiencies in the market, particularly among rookie-scale contract players who outperformed veterans on mid-level exceptions..."]*

The project follows the full Data Lifecycle, from acquiring disparate data sources to cleaning, integrating, analyzing, and ensuring reproducibility through automated workflows.

---

## Data Profile
We utilized two independently authored datasets from Kaggle. We specifically focused on the **2022-2023 NBA Season** to ensure maximum data completeness and alignment, as the 2023-2024 salary data contained significant gaps at the time of collection.

### 1. NBA Player Statistics (2022-2023)
* **Source:** Kaggle (originally sourced from Basketball-Reference).
* **Content:** Per-player regular season statistics (e.g., Games Played, Minutes, PTS, AST, REB, Shooting %).
* **Access:** Downloaded via Kaggle API/CSV.
* **Format:** Tabular CSV.
* **License & Ethics:** Licensed under **CC BY 4.0**. This dataset is open for sharing and adaptation with appropriate credit. We have redistributed the cleaned version of this data in our repository.

### 2. NBA Players’ Salaries
* **Source:** Kaggle.
* **Content:** Player-level salary information broken down by season and team.
* **Access:** Downloaded via Kaggle.
* **Ethical & Legal Constraints:** The dataset listed its license as "Other" without explicit terms permitting redistribution. **Therefore, to comply with course ethical requirements and copyright laws, we have NOT included the raw salary CSV files in this repository.**
* **Handling Strategy:** We provide instructions in the `Reproducing` section on how to download the data directly from the source. Our repository only contains the derived, integrated dataset where salary information is merged with performance metrics, which falls under fair use for educational analysis.

---

## Data Quality & Cleaning
The raw data presented several quality challenges that required extensive cleaning and standardization. We used **OpenRefine** for initial cleaning and **Python (Pandas)** for programmatic standardization and integration.

### Quality Assessment Findings
* **Schema Mismatches:** The datasets used different naming conventions (e.g., `Player` vs. `Player Name`, `Tm` vs. `Team`) and data types. Salary figures were stored as strings (e.g., `$12,450,000`) rather than integers.
* **Name Inconsistencies:** Approximately 15-20% of players had name variations between the two sources (e.g., "A.J. Lawson" vs. "AJ Lawson", "Luka Dončić" vs. "Luka Doncic"). This was the primary barrier to integration.
* **Multi-Team Players:** Players traded mid-season appeared as multiple rows in the performance dataset (one for each team + one for "TOT" or total).
* **Missing Values:** The salary dataset contained null values for unsigned players or two-way contracts, which were filtered out for the purpose of this analysis.

### Cleaning & Integration Steps
1.  **Standardization (OpenRefine):**
    * Renamed columns to meaningful, consistent headers (e.g., `PTS`, `Salary_2022_23`).
    * Converted Salary columns to numeric integers (removing `$` and `,`).
    * Standardized Player Names by removing special characters, accents, and unifying suffix formatting (Jr., II, etc.).
2.  **Deduplication Strategy:** For players who played for multiple teams, we adopted a rule to **keep the record with the highest Games Played (GP)**. This avoids inflating the dataset with partial-season stats while capturing the most representative sample of their performance.
3.  **Integration:** We performed a Left Join on `Player Name`, using a fuzzy matching approach to resolve remaining spelling discrepancies.
4.  **Enrichment:** We calculated a `Value Index` metric defined as:
    * *Formula:* `(PTS + REB + AST) / Salary (in Millions)`
    * This metric allows us to quantify how much statistical production a team gets for every million dollars spent.

---

## Findings
*(This section presents the results of our analysis. See the `analysis/` folder for the source code generating these plots.)*

### 1. Salary vs. Performance Correlation
> *[TODO: Insert your Scatter Plot image here. Upload the image to your repo's `images/` folder and link it like below]*
>
> `![Salary vs Points](images/salary_vs_points.png)`
>
> **Observation:** *[Write 2-3 sentences explaining the graph. E.g., "As shown in the figure, there is a clear positive trend, but with high variance. Superstars like Giannis Antetokounmpo cluster in the top-right (high pay, high performance), while the top-left quadrant highlights 'overpaid' underperformers."]*

### 2. Identifying the Best Value Players
> *[TODO: Insert a Bar Chart or Table image here showing the top 10 players by your 'Value Index']*
>
> `![Top Value Players](images/value_index_top10.png)`
>
> **Observation:** *[Explain who is on the list. E.g., "Interestingly, the 'Best Value' list is dominated by young stars on rookie contracts (e.g., Tyrese Maxey, Desmond Bane) who produce All-Star numbers while earning less than $4M."]*

---

## Future Work
While this project establishes a solid workflow for valuing player performance, there are several limitations and opportunities for future expansion:

1.  **Advanced Metrics:** Our analysis relied on traditional box-score stats (Points, Rebounds, Assists). Future iterations should incorporate advanced analytics like **PER (Player Efficiency Rating)**, **Win Shares**, or **RAPTOR** to better capture defensive impact and off-ball value, which are often overlooked in salary discussions.
2.  **Contextual Variables:** We did not account for injuries, games missed due to "load management," or team context (e.g., a good player on a bad team putting up empty stats). Incorporating injury reports and team win rates would refine the "Value Index."
3.  **Longitudinal Analysis:** Expanding the scope to cover the last 5-10 seasons would allow us to analyze salary cap inflation trends and how the definition of a "max contract" value has changed over time.
4.  **Automated Name Matching:** While we implemented fuzzy matching, a robust system using a canonical ID system (like basketball-reference IDs) would improve the reliability of the merge process.

---

## Reproducing the Analysis
To reproduce our results, please follow these steps:

### 1. Prerequisites
Clone the repository and install the required dependencies:
```bash
git clone [https://github.com/Llogan7/477course-project.git](https://github.com/Llogan7/477course-project.git)
cd 477course-project
pip install -r requirements.txt
