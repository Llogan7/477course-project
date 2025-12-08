# Snakefile for automating the end-to-end NBA salary–performance analysis workflow

FINAL_DATA = "nba_salary_value_analysis/data/processed/final_dataset.csv"
MERGED_DATA = "data/merged_data/merged_salary_stats.csv"

PLOTS = [
    "run_all/plots/salary_distribution.png",
    "run_all/plots/salary_vs_pts.png",
    "run_all/plots/salary_vs_eff_per_min.png",
    "run_all/plots/top10_value_index.png",
    "run_all/plots/bottom10_value_index.png",
    "run_all/plots/top10_eff_per_min.png",
    "run_all/plots/bottom10_eff_per_min.png",
    "run_all/plots/team_average_value_index.png",
]

rule all:
    input:
        FINAL_DATA,
        MERGED_DATA,
        PLOTS

rule run_all_notebook:
    input:
        "data/raw/performance_2022_2023.csv",
        "data/raw/salaries.csv"
    output:
        FINAL_DATA,
        MERGED_DATA,
        PLOTS
    shell:
    """
    jupyter nbconvert --to notebook --execute run_all/run_all.ipynb --output run_all_executed.ipynb
    """
