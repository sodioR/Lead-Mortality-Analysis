# Lead Mortality Analysis

## Overview

This project analyzes the relationship between lead exposure, water pH, and infant mortality using statistical methods. The goal is to determine whether lead contamination significantly impacts infant mortality and how environmental factors modify this effect.

---

## Methods

- Two-sample t-test  
- Linear regression with interaction terms  
- Confidence intervals and hypothesis testing  
- Visualization using ggplot2  

---

## Model

The regression model:

\[
\text{infrate} = \beta_0 + \beta_1(\text{lead}) + \beta_2(\text{ph}) + \beta_3(\text{lead} \times \text{ph}) + \epsilon
\]

---

## Key Results

### Lead Effect

\[
\hat{\beta}_1 = 0.4618,\quad SE = 0.2212,\quad t = 2.087,\quad p = 0.03835
\]

Since \( p < 0.05 \), we reject the null hypothesis and conclude that lead exposure has a statistically significant effect on infant mortality.

---

### Interaction Effect (Lead × pH)

\[
\hat{\beta}_3 = -0.05866,\quad SE = 0.0304,\quad t = -1.8707,\quad p = 0.0631
\]

The negative coefficient suggests that higher pH reduces the harmful impact of lead, though this effect is not statistically significant at the 0.05 level.

---

### Marginal Effect of Lead at Different pH

\[
\text{Effect of Lead} = \beta_1 + \beta_3 \cdot \text{pH}
\]

- Average pH = 7.765  
- Standard deviation = 0.673  

\[
\text{Effect at } pH = 7.092 = 0.08474818
\]
\[
\text{Effect at } pH = 7.765 = 0.0451495
\]
\[
\text{Effect at } pH = 8.438 = 0.006081724
\]

Lead has a stronger harmful effect in more acidic conditions and a weaker effect in more alkaline conditions.

---

### Confidence Interval

95% confidence interval for the effect of lead at \( pH = 6.5 \):

\[
[0.03091758,\ 0.15347057]
\]

---

## Key Findings

- Lead exposure increases infant mortality  
- Lower pH (acidic water) amplifies lead toxicity  
- Higher pH reduces the harmful impact of lead  
- Including additional variables reduces bias and improves estimates  

---

## Tech

- R  
- ggplot2  
- dplyr  

---

## How to Run

```r
source("lead_mortality_analysis.R")
