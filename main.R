
## code for GitHub Only 

# clear everything from before
rm(list=ls())

# load libraries
library(haven)
library(tidyverse)
library(dplyr)

# load data into dataframe
df <- read_dta("Hospital_Public_NSHOS.dta")


###############################################################################################
##### Initial Data Cleaning for Regression Modeling: Exposure, Outcome, and Covariates 
###############################################################################################

### main exposure variable is physician influence (called Physician Leadership in the dataset)
# rename the Physician Leadership variable so it's easier to use
df$Influence <- df$physician_leadership

# examine the physician leadership variable 
# PL is a binary 0,1 indicator where 1 = more physician leadership, 0 = less physician leadership
table(df$Influence)

### examine the outcome variables; one outcome variable is used per regression model for a total of five models.

# first outcome variabe is level of mental health care integration in the ED: depression screening binary (Q21a) 
table (df$q21a)
# rename Q21a to DepressionScreening
df$DepressionScreening <- df$q21a

# next outcome variable is integration of EHR use at the hospital, measured on a 0 to 100 scale (continuous variable)
# 100 means that the EHR is univerally integrated across all depts at the hospital; 0 is not used in any departments
# the percentage scale shows percent of departments using EHR 
table (df$EhrDec)
# rename variable to make it easier to use 
df$EHR <- df$EhrDec

# next outcome is use of shared decision-making/patient engagement strategies, measured 0 to 100 (continuous variable)
table (df$peoverall)
# rename variable to make it easier to use 
df$PatientEngagement <- df$peoverall 

# next outcome is a lack of incentives to adapt new clinical treatments (we will binarize this variable) (q22f)
# this is q22f, where 0 = no lack of incentive, 1 = some lack of incentive, 2 = major lack of incentive 
table (df$q22f)

# last outcome is lack of incentives to adapt new care delivery innovations (q23f)
table (df$q23f)

# let's create a new variable that binarizes q23f such that 1 = any lack of incentive and 0 = no lack of incentives 
df$LackIncentivesCareDelivery <- ifelse(df$q23f == 0, 0, 1)
# check that the counts make sense for the new variable: should be 519 for 1 and 209 for 0 
table(df$LackIncentivesCareDelivery)

### now lets add covariates: Q39, Q40, Q42 
# Q39: loss of revenue from risk contracts? (1 = yes, 0 = no)
table(df$q39)
df$RevenueLost <- df$q39

# Q40: receiving external revenues for performance improvement? (1 = yes, 0=no)
table(df$q40)
df$ExternalRevenue<- df$q40

# Q42: does hospital own any primary care practices? (1 = yes, 0=no)
table(df$q42)
df$PrimaryCare <- df$q42

### all outcomes,  covariates, and the main exposure variable have been cleaned for modeling

#####################################################################################################
########### Creating Visualizations of Two Continuous Outcome Variables: EHR Use & Patient Engagement
#####################################################################################################

# histogram of EHR use (0 to 100 scale)
hist(df$EHR, breaks = 10, main = "Level of EHR Integration", xlab = "Percent of EHR Integration (0% to 100%)")

# histogram of patient engagement and shared decision-making (0 to 100 scale)
hist(df$PatientEngagement, breaks = 10, main = "Number of Hospitals Sharing Decision-Making", xlab = "Percent of Shared Decision-Making (0% to 100%)")

###################################################################################################
######### Running regression models
###################################################################################################

## We will use logit models for model 1, 2, and 3 because these use binary outcomes
## outcomes in models 1-3: ED depression screening, Lack of Incentives for New Trt, and Lack of Incentives for Delivery Innovation 

# Model 1: Influence vs. ED Depression Screening
m1 <- glm(DepressionScreening ~ Influence + RevenueLost + ExternalRevenue + PrimaryCare, 
          data = df, 
          family = binomial(link = "logit"))

summary(m1)

# Model 2: Influence vs. Lack of Incentives for New Treatment
m2 <- glm(LackIncentivesforNewTrt ~ Influence  + RevenueLost + ExternalRevenue + PrimaryCare, 
          data = df, 
          family = binomial(link = "logit"))

summary(m2)

# Model 3: Influence vs. Lack of Incentives for New Care Delivery Innovations
m3 <- glm(LackIncentivesCareDelivery ~ Influence + RevenueLost + ExternalRevenue + PrimaryCare, 
          data = df, 
          family = binomial(link = "logit"))

summary(m3)

## We will use OLS models for model 4 and 5 because these use binary outcomes
## outcomes in models 4-5: EHR Use, Patient Engagement/Shared Decision-Making

# Model 4: Influence vs. EHR Use
m4 <- lm(EHR ~ Influence + RevenueLost + ExternalRevenue + PrimaryCare, 
         data = df)

summary(m4)


# Model 5: Influence vs. Patient Engagement 
m5 <- lm(PatientEngagement ~ Influence + RevenueLost + ExternalRevenue + PrimaryCare, 
         data = df)

summary(m5)





