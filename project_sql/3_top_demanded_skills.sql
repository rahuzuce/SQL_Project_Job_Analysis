-- Query to calculate the most in-demand skills for Data Analyst Remote roles
SELECT 
    sd.skills,
    COUNT(*) AS skill_count
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
GROUP BY 
    sd.skills
ORDER BY 
    skill_count DESC
LIMIT 5;