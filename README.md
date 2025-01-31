# Georgia-COVID-19-Analytics-Uncovering-Mortality-Trends-Through-Statistical-Inference
COVID-19 Georgia Death Data Analysis: A comprehensive statistical investigation of pandemic mortality patterns using R programming. Analyzed 1M+ cases examining demographic factors, conducting hypothesis testing, and generating insights through data visualization and statistical inference.

**Data Description**
- Source: Georgia COVID-19 Death Reports
- Time Period: 2020-2023
- Variables: Race, ethnicity, gender, age, county, chronic conditions
- Total Cases: 1,016,072
- Total Deaths: 45,440
Descriptive Statistics:
- Calculated total cases (1,016,072) and deaths (45,440)
- Determined death proportions across demographics
- Computed means and standard deviations to understand data distribution
- Used dplyr for aggregating and summarizing data
Data Cleaning:
- Removed "Unknown" and "Total" categories from race variable
- Reduced observations from 96 to 72 for more accurate analysis
- Recalculated proportions after cleaning:
  * Death rate changed from 4.47% to 4.66%
  * Male/female ratio adjusted by 0.0566/0.0388

**Analysis Methods**
- Descriptive Statistics
- Hypothesis Testing (t-test, binomial, proportion)
- Data Cleaning
- Statistical Inference
Hypothesis Testing:
- T-tests:
  * Used 0.05 hypothesized value
  * p-value of 6.6618 for total deaths
  * p-value of 0 for gender-specific tests
Binomial Tests:
  * First test: p-value 0.04509 (rejected null hypothesis)
  * Second test: p-value 9.88131 (failed to reject null)
Proportion Tests:
  * Both tests yielded p-value of 0.04523
  * Rejected null hypothesis for population proportions
Statistical Inference:
- Calculated confidence intervals for death rates
- Analyzed statistical significance across demographic groups
- Determined mortality patterns in specific populations:
  * White population: Higher death count (6,872 deaths)
  * Black population: 3,993 deaths
  * Previous chronic conditions: 11,360 deaths

The combination of these approaches enabled:
- Identification of demographic risk factors
- Validation of statistical significance
- Accurate mortality rate calculations
- Understanding of chronic condition impact
- Reliable population-level insights
  
**Technologies**
- R Programming
- Libraries: dplyr, broom

## Project Structure
├── data/
│   └── covid_georgia.csv
├── scripts/
│   ├── data_cleaning.R
│   ├── statistical_analysis.R
│   └── visualization.R
├── results/
│   └── analysis_results.md
└── README.md

**Key Findings**
- Overall death rate: 4.47%
- Significant demographic variations
- Chronic condition impact analysis

**Requirements**
- R >= 4.0.0
- dplyr
- broom

The analytical approaches in this COVID-19 study were strategically chosen to extract meaningful insights from complex mortality data:
