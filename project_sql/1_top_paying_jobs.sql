-- Query to find the top-paying remote jobs for Data Analysts
SELECT 
    jp.job_id,
    jp.job_title,
    jp.job_title_short,
    c.name AS company_name,
    jp.salary_year_avg,
    jp.job_location,
    jp.job_posted_date,
    jp.job_schedule_type 
FROM 
    public.job_postings_fact jp
LEFT JOIN 
    public.company_dim c
ON 
    jp.company_id = c.company_id
WHERE 
    jp.job_title_short = 'Data Analyst'
    AND jp.salary_year_avg IS NOT NULL
    AND jp.job_location = 'Anywhere'
ORDER BY 
    jp.salary_year_avg DESC
LIMIT 10;
