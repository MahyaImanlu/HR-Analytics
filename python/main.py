import pandas as pd
from sqlalchemy import create_engine


password = input('Enter your password here: ')
engine = create_engine(f'mysql+pymysql://root:{password}@localhost/HR_Analytics')


try:
    df = pd.read_csv('train.csv')
except FileNotFoundError:
    raise FileNotFoundError('Download a CSV file from kaggle and place it in the project path.')



print(df.isna().sum())
print(df.duplicated().sum())
df["Attrition"] = df["Attrition"].map({"Stayed": 1, "Left": 0})




# df.info()
num_cols = df.select_dtypes(include=['int64']).columns
for col in num_cols:
    print(col, (df[col] < 0).sum())


df.to_sql(
    'employee_attrition',
    con = engine,
    if_exists= 'replace',
    index = False
)