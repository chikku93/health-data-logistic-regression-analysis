# Analyzing the Relationship between Obesity, Hypertension, and Heart Disease through Logistic Regression

This data analysis explores the association between obesity, hypertension, and heart disease within a specified population. The study utilizes data named "SURVEY," extracted from a random sample of 500 individuals participating in the California Health Interview Survey (CHIS) 2009. The primary focus is on using Heart Disease (hd) status as a dichotomous outcome variable, and various predictor variables including blood pressure (hbp), height, weight, age, gender, smoking habits (smoke), alcohol consumption (drink), physical activity (pa), and ethnicity. The central question addressed by this analysis is: Do individuals who are both obese and hypertensive exhibit a higher likelihood of having heart disease? The aim is to explore the relationship between these factors and provide insights into the potential association between obesity, hypertension, and the occurrence of heart disease in the sampled population.

#### **Data Management**
The initial phase of the analysis involves data management tasks, such as data reading, conversion of hbp, gender, drink, smoke, ethnicity, into factors with assigned labels, and computation of BMI using weight and height. Subsequently descriptive statistical analyses are carried to understand the distribution of key variables.

#### **Bivariate Analysis**
Bivariate analyses are performed to examine the unadjusted associations between heart disease and individual factors such as high blood pressure, smoking, gender, alcohol consumption, ethnicity, age, physical activity, hours worked per week, and BMI. The analysis involves calculating the proportion of heart disease within each level of categorical variables. Logistic regression models are then employed to quantify the associations, providing odds ratios and their corresponding 95% confidence intervals for each factor. This approach aims to comprehensively assess the relationships between individual variables and the occurrence of heart disease.

#### **Model Building**
The subsequent stage involves model building, where logistic regression models are constructed with different combinations of variables based on predictors significantly related to heart disease. Employing a forward stepwise regression procedure, the final parsimonious model is developed to optimally predict the likelihood of heart disease, taking into account factors such as obesity, hypertension, and other relevant variables. To assess possible confounding, the change-in-estimate criterion is applied, with a cutoff of 10%. This involves examining alterations in the adjusted parameter estimates of the primary effect in the presence of potential covariates.

#### **Goodness-of-Fit Test**
The likelihood ratio test is employed to assess the goodness-of-fit for the final logistic regression model.

#### **General Linear Hypothesis Tests**
The final part of the code conducts hypothesis tests to compare specific groups, such as obese hypertensive subjects vs. normal-weight hypertensive subjects, and other relevant comparisons. The tests are conducted using both continuous BMI and categorized BMI variables.
