select 
    job_title_short,
    avg(salary_year_avg) as average
    from 
    job_postings_fact
        GROUP BY job_title_short
        having average > 100_000
        order by average desc;
        
select * from company_dim limit 10;
select * from skills_dim limit 5;
select * from information_schema.tables where table_catalog = 'data_jobs';
select * from information_schema.table_constraints where table_catalog = 'data_jobs';
PRAGMA show_tables;
PRAGMA show_tables_expanded;
DESCRIBE job_postings_fact;