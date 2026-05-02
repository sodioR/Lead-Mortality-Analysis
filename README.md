# Lead Mortality Analysis

## Overview

Author: Sadia Rahman
This project analyzes the relationship between lead exposure, water pH, and infant mortality using statistical methods.

## Model

The regression model:

$$
\text{infrate} = \beta_0 + \beta_1(\text{lead}) + \beta_2(\text{ph}) + \beta_3(\text{lead} \times \text{ph}) + \epsilon
$$

## Key Results

### Lead Effect

$$
\hat{\beta}_1 = 0.4618,\quad SE = 0.2212,\quad t = 2.087,\quad p = 0.03835
$$

Since `$p < 0.05$`, we reject the null hypothesis and conclude that lead exposure has a statistically significant effect on infant mortality.

### Interaction Effect

$$
\hat{\beta}_3 = -0.05866,\quad SE = 0.0304,\quad t = -1.8707,\quad p = 0.0631
$$

The negative interaction term suggests that higher pH reduces the harmful impact of lead.

### Marginal Effect of Lead

$$
\text{Effect of Lead} = \beta_1 + \beta_3 \cdot \text{pH}
$$

- Average pH = 7.765
- Standard deviation = 0.673

$$
\text{Effect at pH } 7.092 = 0.08474818
$$

$$
\text{Effect at pH } 7.765 = 0.0451495
$$

$$
\text{Effect at pH } 8.438 = 0.006081724
$$

## Confidence Interval

95% confidence interval for the effect of lead at `$pH = 6.5$`:

$$
[0.03091758,\ 0.15347057]
$$

## Key Findings

- Lead exposure increases infant mortality.
- Lower pH amplifies the effect of lead exposure.
- Higher pH reduces the harmful impact of lead.
- Adding controls helps reduce omitted variable bias.

## Tech

- R
- ggplot2
- dplyr

## How to Run

```r
source("lead_mortality_analysis.R")
