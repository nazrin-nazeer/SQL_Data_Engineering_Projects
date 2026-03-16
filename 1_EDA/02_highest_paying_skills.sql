select 
sd.skills,
round(median(jpf.salary_year_avg),0) as median_salary,
count (jpf.*) as demand_count
from job_postings_fact as jpf
INNER JOIN skills_job_dim as sjd on jpf.job_id=sjd.job_id
INNER JOIN skills_dim as sd on sjd.skill_id=sd.skill_id
WHERE
jpf.job_title_short='Data Engineer'
AND jpf.job_work_from_home=TRUE
GROUP BY
sd.skills
HAVING
COUNT(jpf.*)>=100
ORDER BY
median_salary DESC
limit 25;


/*

┌────────────┬───────────────┬──────────────┐
│   skills   │ median_salary │ demand_count │
│  varchar   │    double     │    int64     │
├────────────┼───────────────┼──────────────┤
│ rust       │      210000.0 │          232 │
│ golang     │      184000.0 │          912 │
│ terraform  │      184000.0 │         3248 │
│ spring     │      175500.0 │          364 │
│ neo4j      │      170000.0 │          277 │
│ gdpr       │      169615.5 │          582 │
│ zoom       │      168437.5 │          127 │
│ graphql    │      167500.0 │          445 │
│ mongo      │      162250.0 │          265 │
│ fastapi    │      157500.0 │          204 │
│ bitbucket  │      155000.0 │          478 │
│ django     │      155000.0 │          265 │
│ crystal    │      154223.5 │          129 │
│ c          │      151500.0 │          444 │
│ atlassian  │      151500.0 │          249 │
│ typescript │      151000.0 │          388 │
│ kubernetes │      150500.0 │         4202 │
│ ruby       │      150000.0 │          736 │
│ airflow    │      150000.0 │         9996 │
│ css        │      150000.0 │          262 │
│ node       │      150000.0 │          179 │
│ redis      │      149000.0 │          605 │
│ vmware     │     148798.25 │          136 │
│ ansible    │     148798.25 │          475 │
│ jupyter    │      147500.0 │          400 │
├────────────┴───────────────┴──────────────┤
│ 25 rows                         3 columns │
└───────────────────────────────────────────┘
*/