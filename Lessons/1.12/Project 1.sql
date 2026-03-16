SELECT
sd.skills,
count(jpf.*) as demand_count
from job_postings_fact as jpf
INNER JOIN skills_job_dim as sjd ON jpf.job_id=sjd.job_id
INNER JOIN skills_dim as sd ON sjd.skill_id=sd.skill_id
where 
jpf.job_title_short='Data Engineer'
and 
jpf.job_work_from_home= TRUE
GROUP BY
sd.skills
ORDER BY 
demand_count DESC
limit 10;


select 
sd.skills,
median(jpf.salary_year_avg) as median_salary,
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
COUNT(sd.skills)>=100
ORDER BY
median_salary DESC
limit 25;

           