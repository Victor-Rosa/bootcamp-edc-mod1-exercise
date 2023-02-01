import boto3
import pandas as pd

s3_client = boto3.client('s3', region_name='us-east-2')

s3_client.download_file("datalake-victorrosa-494757102856",
                      "raw-data/enem/year=2020/car-data.csv",
                      "data/teste.csv"
                      )

df = pd.read_csv("data/teste.csv")  
print(df)                    

