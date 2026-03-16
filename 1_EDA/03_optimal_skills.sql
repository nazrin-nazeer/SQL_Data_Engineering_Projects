select 
sd.skills,
round(median(jpf.salary_year_avg),0) as median_salary,
-- count (jpf.*) as demand_count,
round(LN(COUNT(jpf.*)),0) as ln_Demand_count,
ROUND((median(jpf.salary_year_avg) * LN(COUNT(jpf.*)))/100_000,2) as optimal_Score
from job_postings_fact as jpf
INNER JOIN skills_job_dim as sjd on jpf.job_id=sjd.job_id
INNER JOIN skills_dim as sd on sjd.skill_id=sd.skill_id
WHERE
jpf.job_title_short='Data Engineer'
AND jpf.job_work_from_home=TRUE
AND jpf.salary_year_avg is NOT NULL
GROUP BY
sd.skills
HAVING
COUNT(sd.skills)>=100
ORDER BY
optimal_Score DESC
limit 25;

/*

┌────────────┬───────────────┬─────────────────┬───────────────┐
│   skills   │ median_salary │ ln_Demand_count │ optimal_Score │
│  varchar   │    double     │     double      │    double     │
├────────────┼───────────────┼─────────────────┼───────────────┤
│ terraform  │      184000.0 │             5.0 │          9.68 │
│ python     │      135000.0 │             7.0 │          9.49 │
│ aws        │      137320.0 │             7.0 │          9.15 │
│ sql        │      130000.0 │             7.0 │          9.14 │
│ airflow    │      150000.0 │             6.0 │          8.93 │
│ spark      │      140000.0 │             6.0 │          8.71 │
│ snowflake  │      135500.0 │             6.0 │          8.24 │
│ kafka      │      145000.0 │             6.0 │          8.23 │
│ azure      │      128000.0 │             6.0 │          7.89 │
│ java       │      135000.0 │             6.0 │          7.71 │
│ scala      │      137290.0 │             6.0 │          7.56 │
│ kubernetes │      150500.0 │             5.0 │          7.51 │
│ git        │      140000.0 │             5.0 │          7.47 │
│ databricks │      132750.0 │             6.0 │          7.41 │
│ redshift   │      130000.0 │             6.0 │           7.3 │
│ gcp        │      136000.0 │             5.0 │          7.18 │
│ hadoop     │      135000.0 │             5.0 │          7.14 │
│ nosql      │      134415.0 │             5.0 │          7.07 │
│ pyspark    │      140000.0 │             5.0 │          7.03 │
│ docker     │      135000.0 │             5.0 │          6.71 │
│ mongodb    │      135750.0 │             5.0 │          6.67 │
│ go         │      140000.0 │             5.0 │          6.62 │
│ r          │      134775.0 │             5.0 │          6.59 │
│ github     │      135000.0 │             5.0 │          6.54 │
│ bigquery   │      135000.0 │             5.0 │           6.5 │
├────────────┴───────────────┴─────────────────┴───────────────┤
│ 25 rows                                            4 columns │
└──────────────────────────────────────────────────────────────┘
*/