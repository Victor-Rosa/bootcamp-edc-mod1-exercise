
from pyspark.sql import SparkSession

spark = (
    SparkSession.builder.appName("ExerciseSpark")
    .getOrCreate()
)
# Ler os dados de 2020 em csv
enem = (
    spark
    .read
    .format("csv")
    .option("header", True)
    .option("inferSchema", True)
    .option("delimiter", ";")
    .load("s3://datalake-victorrosa-494757102856/raw-data/enem/year=2019/MICRODADOS_ENEM_2019.csv")
)

# Escreve os dados de 2020 em parquet
(
    enem
    .write
    .mode("overwrite")
    .format("parquet")
    .partitionBy("year")
    .save("s3://datalake-victorrosa-494757102856/consumer-zone/enem")
)