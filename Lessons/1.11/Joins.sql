SELECT
jpf.*,
cd.*
FROM
job_postings_fact as jpf
LEFT JOIN company_dim as cd  
on jpf.company_id=cd.company_id;

SELECT
jpf.job_id,
jpf.job_country,
cd.company_id,
cd.name as CompanyName
FROM
job_postings_fact as jpf
RIGHT JOIN company_dim as cd  
on jpf.company_id=cd.company_id;


SELECT
jpf.job_id,
jpf.job_title_short,
cd.company_id,
cd.name as CompanyName
FROM
job_postings_fact as jpf
INNER JOIN company_dim as cd  
on jpf.company_id=cd.company_id;


SELECT
jpf.job_id,
jpf.job_title_short,
cd.company_id,
cd.name as CompanyName
FROM
job_postings_fact as jpf
FULL OUTER JOIN company_dim as cd  
on jpf.company_id=cd.company_id;


EXPLAIN ANALYZE
SELECT
jpf.job_id,
jpf.job_title_short,
cd.company_id,
cd.name as CompanyName
FROM
job_postings_fact as jpf
FULL OUTER JOIN company_dim as cd  
on jpf.company_id=cd.company_id;