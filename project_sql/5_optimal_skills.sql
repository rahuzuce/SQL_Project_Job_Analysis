-- Query to calculate optimal skills to learn (high demand and high paying)
SELECT 
    sd.skills,
    COUNT(*) AS skill_count,
    ROUND(AVG(jp.salary_year_avg),0) AS avg_salary
FROM 
    public.job_postings_fact jp
JOIN 
    public.skills_job_dim sjd
ON 
    jp.job_id = sjd.job_id
JOIN 
    public.skills_dim sd
ON 
    sjd.skill_id = sd.skill_id
WHERE 
    jp.job_title_short = 'Data Analyst'
    AND jp.job_location = 'Anywhere'
    AND jp.salary_year_avg IS NOT NULL
GROUP BY 
    sd.skills
HAVING
    COUNT(*) > 10
ORDER BY 
    avg_salary DESC,skill_count DESC;