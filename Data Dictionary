📘 Data Dictionary — Final Dataset (final_dataset.csv)

This data dictionary describes all 36 columns in the final processed dataset used for analysis and visualization.

## 1. Player Information
Column	Type	Description
player	string	Standardized player name used for merging datasets.
pos	string	Player position (e.g., PG, SG, SF, PF, C).
age	int	Player age during the 2022–23 NBA season.
tm	string	Team abbreviation. For traded players, the record with the most games played (G) is selected.
## 2. Games & Usage
Column	Type	Description
g	int	Games played.
gs	int	Games started.
mp	float	Minutes played per game.
## 3. Shooting Statistics
Column	Type	Description
fg	float	Field goals made per game.
fga	float	Field goal attempts per game.
fg%	float	Field goal percentage (fg / fga).
Three-point shooting
Column	Type	Description
3p	float	Three-pointers made per game.
3pa	float	Three-point attempts per game.
3p%	float	Three-point percentage.
Two-point shooting
Column	Type	Description
2p	float	Two-point field goals made per game.
2pa	float	Two-point attempts per game.
2p%	float	Two-point percentage.
Advanced shooting efficiency
Column	Type	Description
efg%	float	Effective field goal percentage ((FG + 0.5 × 3P) / FGA).
## 4. Free Throws
Column	Type	Description
ft	float	Free throws made per game.
fta	float	Free throw attempts per game.
ft%	float	Free-throw percentage.
## 5. Rebounding
Column	Type	Description
orb	float	Offensive rebounds per game.
drb	float	Defensive rebounds per game.
trb	float	Total rebounds per game (orb + drb).
## 6. Playmaking & Defense
Column	Type	Description
ast	float	Assists per game.
stl	float	Steals per game.
blk	float	Blocks per game.
tov	float	Turnovers per game.
pf	float	Personal fouls per game.
## 7. Scoring
Column	Type	Description
pts	float	Points per game.
## 8. Salary Variables
Column	Type	Description
salary	float	Player salary for the 2022–23 season (numeric USD). Missing for players not in the salary dataset.
salary_million	float	Salary converted to millions (salary / 1,000,000) for normalization.
## 9. Derived Value Metrics (Created in Final Analysis)
⭐ These columns are NOT from raw data; they are computed for value analysis.
Column	Type	Description
value_index	float	Efficiency-per-million metric used to evaluate "value for cost". Higher = more undervalued.
salary_per_point	float	Cost per point scored per game (salary / pts). Lower = better value.
pts_per_minute	float	Points per minute played (pts / mp). Measures scoring efficiency relative to playtime.
efficiency_index	float	Composite index defined as pts + ast + trb. Measures overall contribution.
efficiency_per_million	float	Efficiency per salary million (efficiency_index / salary_million). Used in team and player value ranking.
