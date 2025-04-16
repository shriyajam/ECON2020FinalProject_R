# ECON2020FinalProject_R
Final Project Repository Link for Classmate


PLEASE NOTE: This project downloads data from UMichigan’s ICPSR and requires you to accept the terms of use before downloading it. Therefore, please do **not commit or push the dataset** (“Hospital_Public_NSHOS.dta”) to GitHub. Again, please DO NOT COMMIT OR PUSH THE DATASET to GitHub. You may work with it locally but please do not upload or share it publicly. 

STEP 1: STUDY BACKGROUND & CONTEXT 

Project Objective: 

The National Survey of Healthcare Organizations and Systems (NSHOS), is a survey that is jointly administered and developed by the University of California Berkeley and Dartmouth College. This survey has been administered twice before: once, in 2017-2018, and once in 2022-2023. The hospital-level and practice-level data from the first administration is publicly available through UMichigan’s ICPSR database. 

This project uses hospital-level survey data from the 2017-2018 Public Use files from UMichigan’s Open ICPSR database to investigate whether hospitals that have more physician leadership (hospitals where physicians have greater influence) are more likely to report higher levels of care and EHR integration, greater shared-decision making with patients, and report less barriers towards adapting new evidence-based clinical treatments and delivery innovations. I use the hospital level dataset and logit regression modeling and survey methodology to answer this question. 

Variables Setup:  

Exposure variable: The main independent variable is the amount of influence physicians have in the leadership of the hospital (physician leadership variable on a Likert scale as reported by the hospital). 

Outcome variables: There are five dependent variables (I will run five models): 1. Level of mental health care integration (measured by whether or not the hospital screens for depression at ED visits), 2. Level/Extent of EHR use on a 0 to 100 scale in the hospital, 3. Extent of shared-decision making  and patient engagement (0 to 100 scale), 4. Lack of incentive for new evidence-based clinical treatments (binarized), and 5. Lack of incentives for adapting new evidence-based care delivery innovations (delivering care) (binarized). 

Covariates: I will also include hospital-based control variables, such as whether the hospital has incurred a loss from risk-bearing contracts in the last year, whether it receives external performance-based payments, and whether it owns any primary care practices. 


STEP 2: DOWNLOAD THE DATA 

1. Although it is public use data, as part of the terms of use, this data requires users to go to the UMichigan’s website and agree to download the data themselves. I’ve shared the website link here. Please navigate to this website: https://www.openicpsr.org/openicpsr/project/165241/version/V2/view
2. Please click on the folder that says “Hospital-Survey” on the left side of the screen. This should open the folder on another page and you will see three files: a .dta file (which we will use), an Excel file, and a data dictionary file. 
3. Please click on the .dta file (“Hospital_Public_NSHOS.dta”). Once you click on the .dta, the next page that opens should only list the hospital .dta file. Click the “DOWNLOAD THIS FILE” button on the right side of the screen. 
4. If you are not signed into ICPSR or have not used their databases, please sign in to their website using your Brown login. Brown is a member organization and you should have full access to this publicly available dataset. Please click “access through your institution” to access the dataset via Brown. Select “Brown University” as your home organization when the InCommon page opens. This should bring you to the Brown Login page and you can enter your credentials. If the Brown Login doesn’t show up or you get an error, please try another browser. On a Mac, Safari appears to work well for this login.  
5. Once you sign in, you should get an email verification link sent to your Brown email address. The subject line in that email should be “Link your Institutional Login Account” and it should come to your inbox shortly after you try signing in. The email should come from notifications@notifications.icpsr.umich.edu.  In the email, which should say in bold blue letters at the top, “ICPSR Researcher Passport,” please click the blue “Confirm sign in and continue” button. This should launch the terms of use page in a new browser. 
6. On the Terms of Use page, please read the terms of use and scroll down and accept the terms by clicking the “I AGREE” button (if you agree with the terms). Note: In order to use the data, you have to accept the use terms. Once you accept the use terms, the data should download to your computer or a pop-up should ask you if you want to download the data, depending on which browser you are using and your computer. It should resemble how you normally download items from the internet onto your computer. 
7. The file, Hospital_Public_NSHOS.dta should now be in your downloads folder or wherever you download your internet files. Please save this file to your project directory on your computer so that you can access it for writing code. 

STEP 3: TRANSFER DOWNLOADED DATASET INTO YOUR VISUAL STUDIO ENVIRONMENT 
1. Make sure VS Code is open and that you have cloned the repository in your VS Code application on your laptop (just like we do for problem sets). 
2. Open an R terminal in VS Code (as we have done for problem sets) and make sure to restore renv (run renv::restore() command in terminal; install renv package if you haven’t already or need to install it again) 
3. Now go back to your downloads folder (or wherever you stored the Hospital_Public_NSHOS.dta file on your computer when you downloaded it from ICPSR) and click and drag it into explorer pane in VSCode. Note: you should place it in the root folder (the same folder that main.R is located in). Once you have dragged the dataset (.dta file) into your folder, you should see it in the explorer pane inside your folder. 
4. Navigate to the main.R file using the explorer pane in VSCode and open the main.R file within VS Code. 

STEP 4: RUNNING THE R SCRIPT FILE FOR THE ANALYSIS
1. Once the dataset is loaded into your folder, please run the R script file (“main.R”). 
2. This R-script file does three things. It is split into three chunks of code: 
    1. First, it cleans the variables for regression. The R-Script comments provide detailed descriptions of the variables and the code. 
    2. Second, the R-script file creates two histograms: one histogram of the EHR use outcome and another histogram of the patient engagement outcome. These are both continuous outcomes on a 0 to 100 scale. If you don't want to run the histograms but see what they look like, please click on EHR_histo.png file in this repository to see an example of what one of the histograms (EHR Use outcome) might look like. 
    3. Third, the R-script file runs five regression models on this data (one model per outcome). 
3. Do NOT commit the changes or push to GitHub. This dataset requires institutional sign-on before using it, and therefore, it may not be shared publicly for anyone to access. Again, please do NOT commit the changes or push to GitHub because this repository is public. 

END 



