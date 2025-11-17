# StatusReport.md

## **Title**

NBA Salary vs. Performance (2023-2024)

Team Members:

* Jezzy Jia (ziyijia2) – Data acquisition, licensing review, repository structure, integration workflow.

* Logan Li (jiajun7) – Feature engineering, initial analysis, documentation.

## **Overview of Progress**

Since the submission of the project plan, we have completed all early-stage tasks, including dataset selection, downloading, verifying licensing/ethics constraints, initial cleaning, early integration tests, and repository setup. We also refined the project scope by switching to the 2022–2023 season for performance and salary alignment, ensuring better data completeness.

We currently have:

* Raw datasets downloaded  
* Licensing validated  
* Early cleaning steps performed  
* Preliminary integration tested (player name matching inspection)  
* Project structure established  
* Initial documentation drafted

The following sections summarize progress module-by-module and clarify next steps.

# **Progress by Project Plan Tasks**

## **Module 1: Data Lifecycle** (Completed 40%)

* We mapped our workflow to the data lifecycle used in class: acquisition → profiling → cleaning → enrichment → integration → analysis → reporting.  
* Lifecycle documentation drafted in the project repository README (initial version).

Next step: Expand lifecycle description once full workflow is completed.

## **Module 2: Ethical Data Handling** (Completed 100%)

### Dataset 1: NBA Performance Stats (2022–2023)

* Kaggle License: CC BY 4.0  
* Fully reusable with attribution.  
* We verified authorship and redistribution terms.

### Dataset 2: NBA Salaries

* License listed as “Other (specified in description)”, but description contains NO actual license.  
* Therefore, dataset is treated as NON-redistributable.  
* We will:  
  * NOT upload raw salary files to GitHub  
  * Only provide instructions for re-download  
  * Only include derived/cleaned subsets that do not violate license  
* This fully satisfies course requirements on copyright/IP.

Next step: Draft detailed “Ethical/Legal Considerations” section in final report.

## **Module 3: Data Collection and Acquisition** (Completed 100%)

* Both datasets were downloaded and stored under:  
  * data/raw/performance\_2022\_2023.csv  
  * data/raw/salaries.csv  
* Kaggle links documented in README.  
* Verified that schemas differ significantly → supports integration requirement.

## **Schema Differences**

The datasets differ significantly:

| Field | Stats Dataset | Salaries Dataset |
| ----- | ----- | ----- |
| Player Name | repeated names | single names |
| Player Name | name format A.J.Lawson | name format AJ Lawson |
| Salary | N/A | "$12,450,000" format(non-numerical) |
| Team | same player for different teams | N/A |

## **Module 4–5: Storage and Organization** (Completed 50%)

* Repository now follows a clean structure:  
* DuckDB  
* Column name conventions standardized:  
  * Player Name  
  * Salary 2023-2024  
  * Position  
  * Player's Age  
  * Team  
  * Games Played  
  * Games Started  
  * Minutes Played Per Game  
  * Field Goals Per Game  
  * Field Goal Attempts Per Game  
  * Field Goal Percentage  
  * 3-Point Field Goals Per Game  
  * 3-Point Field Goal Attempts Per Game  
  * 3-Point Field Goal Percentage  
  * 2-Point Field Goals Per Game  
  * 2-Point Field Goal Attempts Per Game  
  * 2-Point Field Goal Percentage  
  * Effective Field Goal Percentage  
  * Free Throws Per Game  
  * Free Throw Attempts Per Game  
  * Free Throw Percentage  
  * Offensive Rebounds Per Game  
  * Defensive Rebounds Per Game  
  * Total Rebounds Per Game  
  * Assists Per Game  
  * Steals Per Game  
  * Blocks Per Game  
  * Turnovers Per Game  
  * Personal Fouls Per Game  
  * Points Per Game

Next step:  
 Finish DuckDB dataset import \+ create stable schema.

**Module 6: Extraction and Enrichment** (Completed 20%)

We defined planned feature engineering:

* Points per minute  
* Efficiency metrics (PTS+AST+REB normalized)  
* Salary-per-stat ratio  
* Value index (to be finalized)

Next step: Implement enrichment script.

## **Module 7–8: Data Integration** (Completed 60%)

* Inspected both datasets; schema incompatibility confirmed (names, season format).

* Identified merging key:

  * Player Name  
  * Season (2022–2023)

* Performed preliminary join:

  * Standardized player name casing and removed special characters.  
    Reshaped salary data from wide to long format for cross-season compatibility.  
  * Joined performance and salary datasets using a left join to preserve all player records.  
  * Identified name mismatches caused by inconsistent formatting (e.g., accents, suffixes, punctuation).  
  * Logged approximately **20 players** requiring manual cleaning or fuzzy matching for final integration.

Next step:  
 Implement fuzzy matching (RapidFuzz) OR manual correction file (name\_mapping.csv).

## **Module 9: Data Quality** (Completed 50%)

Preliminary findings:

* Salary dataset has missing values due to the contracts that haven’t been signed.  
* Salary strings($400,000,00)  
* Performance dataset is clean but contains:  
  * Different name formatting(like A.J. Lawson vs AJ Lawson in the salary dataset)  
  * Some missing advanced metrics  
  * One player played in different teams, so three rows/observations  
* Values within expected ranges

Next step:  
 Run full quality profile (missingness tables, summary statistics).

## **Module 10: Data Cleaning** (Completed 80%)

* Fill in the 0 values for salary with the average salary for the player’s last contract  
* Filled percentage with 0 for players who don’t have any attempts  
* Removed leading/trailing spaces  
* Transform to a consistent name format, Final join key \= standardized Player Name  
* Salary strings converted to numeric format (USD)  
* One player played in different teams, so three rows/observations solution  
* Early detection of inconsistent team codes

Next step:  
 Finalize cleaning pipeline in a Python script.

## **Module 11–12: Workflow Automation and Provenance** (Completed 10%)

* A starting script (run\_all.py) created but not finished.  
* Dependency file (requirements.txt) started.

Next step:  
 Implement fully automated:

1. Load raw data  
2. Clean  
3. Integrate  
4. Produce final dataset

**Module 13: Reproducibility and Transparency** (Completed 30%)

We have:

* requirements.txt (initial)  
* Dataset SHA256 hashes  
* Kaggle URLs with instructions  
* Initial README structure

Next step:  
 Write step-by-step reproducibility guide in README.

## **Module 15: Metadata and Documentation** (Completed 20%)

* Preliminary data dictionary started.  
* Will include:  
  * Column descriptions  
  * Data provenance  
  * Integration schema

# **Updated Timeline (Revised)**

| Date | Task | Status |
| ----- | ----- | ----- |
| Oct 25 | Data collection | Completed |
| Nov 11 | Status report | Completed (this file) |
| Nov 18 | Data cleaning & integration | Pending |
| Nov 22 | Feature engineering | Pending |
| Nov 27 | Analysis \+ visualization | Pending |
| Dec 3 | Workflow automation | Pending |
| Dec 5 | Write final README | Pending |
| Dec 10 | Final submission | Pending |

# **Changes Made Since Project Plan**

### **Dataset Change**

We switched performance dataset from 2023–24 to 2022–23 because:

* Salary data for 2023–24 contained many zeros  
* Reduces bias  
* Ensures clean join

### **Licensing Compliance**

Salary dataset lacks explicit license → cannot redistribute raw data.  
We updated plan accordingly.

### **Scope Adjustment**

We will now focus exclusively on 2022–2023 salary–performance analysis.

# **Individual Contributions**

### Jezzy Jia

(Data acquisition, cleaning, preprocessing, integration groundwork)

* Downloaded both Kaggle datasets (NBA 2022–23 performance dataset and NBA salary dataset).  
* Verified dataset licenses and documented permissible use; determined that raw data redistribution is not allowed for the salary dataset.  
* Loaded both datasets into OpenRefine and performed extensive cleaning and standardization:  
  * Renamed all statistical columns for readability and consistency (e.g., FG → Field Goals Per Game, Tm → Team, etc.).  
  * Normalized Player Name formatting (removed periods, unified spacing, standardized hyphens) to prepare the datasets for integration.  
  * Cleaned the salary dataset by removing unnecessary future-season columns, stripping `$` and`,`, converting to numeric types, and removing ID fields.

* Explored strategy for handling players with multiple rows due to mid-season trades and selected a reproducible rule: keeping the row with the highest number of games played (GP).

* Exported cleaned data files and complete OpenRefine operation histories for reproducibility.

* Drafted major sections of the Status Report, including: data acquisition, cleaning methodology, workflow update, and technical integration notes.

* Designed the repository structure and prepared folders for raw/cleaned data and future workflow automation.

### Logan Li

(Feature engineering, analysis preparation, documentation writing)

* Examined both original datasets to identify relevant performance features for value estimation (e.g., points, assists, rebounds, shooting efficiency).

* Proposed derived metrics to be implemented in the next milestone (e.g., salary per point, salary per efficiency metric, value index).

* Tested preliminary visualizations for the cleaned performance dataset using Python (scatterplots, histograms).

* Drafted portions of the Status Report related to planned modeling, exploratory analysis direction, and research motivation.

* Assisted with manual inspection of inconsistent player names across datasets and validated cleaned versions.

* Outlined the design of the final analytical workflow, including steps for merging data, computing metrics, and generating summary plots.

# **Remaining Gaps**

* **Lack of unique player identifiers across datasets**  
  Both Kaggle datasets rely on player names rather than stable IDs, leading to ambiguity when players share similar names or name spelling varies. While name standardization mitigates this, it does not fully eliminate the risk of integration errors.

* **Players appearing multiple times due to trades**  
  The performance dataset contains multiple rows per player when traded mid-season. We adopted a rule to keep the row with the most games played, but this approach may overlook meaningful partial-season performance.

* **Salary dataset license ambiguity**  
  The salary dataset lists its license as “Other (specified in description),” but provides no explicit redistribution terms. This means we cannot distribute raw data and must rely on Kaggle-link-based reproducibility.

* **Absence of advanced analytics features**  
  Metrics such as PER, Win Shares, BPM, or RAPTOR are not available in the current dataset, limiting the sophistication of our value-per-salary analysis.

* **No context features (injuries, minutes restrictions, team strategies)**  
  Salaries are influenced by many contextual factors not included in the datasets, which limits the interpretive precision of our findings.

* **Automation not yet complete**  
  While cleaning has been completed in OpenRefine, the automated workflow (scripts, Makefile/Snakemake, or notebook pipeline) has not yet been implemented.

# **Conclusion**

By Milestone 3, we have successfully acquired and cleaned two independent NBA datasets for the 2022–23 season and prepared them for integration. Using OpenRefine, we systematically standardized column names, normalized player names, removed inconsistencies, converted salary values into numeric form, and documented every cleaning step using operation history JSON exports. We also examined the challenges posed by multi-team players and established a clear and reproducible rule for selecting a single record per player to support accurate merging.

We now have clean, well-structured datasets and a defined methodological path toward integrating salary and performance data for value estimation. Our next steps will involve implementing the actual merge, engineering derived metrics (e.g., salary-adjusted efficiency), performing exploratory data analysis, generating visualizations, and completing an automated workflow to ensure full reproducibility.

Overall, the project is on track, with major data management challenges resolved and analytical components ready to proceed in the next milestone.

