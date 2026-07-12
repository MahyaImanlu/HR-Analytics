# 📊 HR Analytics project
This project analyses Employee Attrition dataset using python, sql and powerbi.

## Dataset
Download train.csv from kaggle then place it in the python folder: 
https://www.kaggle.com/datasets/stealthtechnologies/employee-attrition-dataset

## 🚀 Tools Used 
- Python
- SQL
- PowerBI

## 📂 Project Structure
- Python : main analyses file
- SQL : sql queries
- Power BI : visualizations + screenshots

## 📊 Analysis 
- Stayed vs Left employees
- Attrition count for each Job Role
- Attrition Rate by Job Role, Overtime, Work-life balance, experience
- Attrition Rate for each salary level
- Employee count for each salary level
- Attrition Rate by age segmentaion, gender, marital status, distance from home, education level and remote work

## 📈 Insights

 The overall attrition rate is high at 48%, driven by a combination of job-related and personal factors.
 
1. Job-related Factors:

- The Technology department has the highest attrition count, while the Education department has the highest attrition rate.
- As expected, employees with lower salaries show the highest attrition rate.
- Overtime has a direct impact on attrition. Employees who work overtime leave at significantly higher rates.
- Among the four work-life balance groups (Poor, Fair, Good, Excellent), employees with poor work-life balance show the highest attrition.
- Employees with less than 7 years of experience (Junior and Mid level) leave at much higher rates than Senior and Executive employees,
  likely due to lower loyalty and weaker ties to the company at early career stages.

2. Personal Factors:

- Across all age groups, female employees show a higher attrition rate than male employees, 53% vs 43%, a notable gap.
- Single employees show the highest attrition rate, and most of them are younger. Likely because they have fewer responsibilities,
  more career mobility, and more external opportunities compared to married or older employees.
- Distance from work also affects attrition. As expected, employees who live farther from work show a higher attrition rate.
- Education level shows a clear pattern too: employees with a PhD have the lowest attrition rate at just 25%,
  while all other education levels (High School, Associate, Bachelor's, Master's) cluster around 48–49% a significant gap that stands out from the rest.
- Remote work also has a significant impact on attrition. Remote employees show a much lower attrition rate (25%) compared to
  non-remote employees (53%), despite remote workers making up a  small portion of the workforce.



Recommendations:

- Design retention programs for early-career employees (0–7 years),  such as mentorship or career growth plans, to build loyalty earlier.
- Expand remote work opportunities: remote employees show a  significantly lower attrition rate (25%) compared to
  non-remote employees (53%), yet only a small share of the workforce currently  works remotely. Increasing remote options could be an effective retention lever.



## ▶️ How to Run
- Download the project files : download main.py from Python folder and HR analysis.sql from SQL folder.
- Prepare the dataset: Download the dataset and place it in the project directory.
- Run python file and SQl queries to process and transform the data.
- For running python file with no error install dependencies : pip install pandas, sqlalchemy, pymysql
- Load data into PowerBI: Import the processed data from SQL into Power BI and finally load the data for visualization and analysis.

## 👨‍💻 Author
Mahya
