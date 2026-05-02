# Name: Sadia R
# Analysis of toxicity in lead pipes and how it relates to child mortality

#loading some necessary libraries
library(readxl)
library(ggplot2)
library(dplyr)

#reading the data
data <- read_excel("C:/Users/sassy/Documents/School/Statistical Methods and Data Analysis 625.603/Assignments/Project 1/lead_mortality.xlsx")
head(data)

#part a: Computing the average Infant Mortality rate
#computing averages
summary_stats <- data %>%
  group_by(lead) %>%
  summarise(average_infrate = mean(infrate, na.rm = TRUE))

#performing t-test
t_test_result <- t.test(infrate ~ lead, data = data)

#outputting the results
print(summary_stats)
print(t_test_result)

#part b: (i) Regression analysis
#running regression
regression_model <- lm(infrate ~ lead * ph, data = data)
summary(regression_model)

#part b: (ii) Plot estimated regression functions
#creating predictions for plotting
data$predicted <- predict(regression_model)

#separate plots for lead = 0 and lead = 1
ggplot(data, aes(x = ph, y = infrate, color = as.factor(lead))) +
  geom_point() +
  geom_line(aes(y = predicted)) +
  labs(color = "Lead Pipes",
       x = "Water pH",
       y = "Infant Mortality Rate") +
  theme_minimal()

#part b: (iii) Statistical significance of lead on infant mortality
summary(regression_model)$coefficients["lead",]

#part b: (iv) Dependence of lead effect on pH
summary(regression_model)$coefficients["lead:ph",]

#part b: (v) Estimated effect of lead for average pH
#average pH
average_ph <- mean(data$ph, na.rm = TRUE)

#marginal effect of lead at average pH
effect_at_avg_ph <- coef(regression_model)["lead"] + 
  coef(regression_model)["lead:ph"] * average_ph
effect_at_avg_ph

#standard deviation of pH
sd_ph <- sd(data$ph, na.rm = TRUE)

#effects
effect_low_ph <- coef(regression_model)["lead"] + 
  coef(regression_model)["lead:ph"] * (average_ph - sd_ph)
effect_high_ph <- coef(regression_model)["lead"] + 
  coef(regression_model)["lead:ph"] * (average_ph + sd_ph)

effect_low_ph
effect_high_ph

#part b: (vi) Construct a 95% confidence interval for the effect of Lead on infant mortality when pH = 6.5. 
confint(regression_model, "lead")

pH_value <- 6.5
effect <- coef(regression_model)["lead"] + coef(regression_model)["lead:ph"] * pH_value

#standard error calculation for combined coefficients
se <- sqrt(vcov(regression_model)["lead", "lead"] +
             (pH_value^2 * vcov(regression_model)["lead:ph", "lead:ph"]) +
             (2 * pH_value * vcov(regression_model)["lead", "lead:ph"]))

#95% Confidence Interval
lower_bound <- effect - 1.96 * se
upper_bound <- effect + 1.96 * se

c(lower_bound, upper_bound)

#part c: Investigating bias from omitted values
#expanded model with additional controls
expanded_model <- lm(infrate ~ lead * ph + hardness + population + typhoid_rate, data = data)
summary(expanded_model)

