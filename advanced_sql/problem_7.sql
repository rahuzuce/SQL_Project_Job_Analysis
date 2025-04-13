/*
SELECT 
    job_location,
    job_work_from_home
FROM job_postings_fact
LIMIT 100;
*/

SELECT 
    sd.skills AS skill_name,
    COUNT(DISTINCT jpf.job_id) AS remote_job_count
FROM 
    job_postings_fact AS jpf
JOIN 
    skills_job_dim AS sjd 
    ON jpf.job_id = sjd.job_id
JOIN 
    skills_dim AS sd 
    ON sjd.skill_id = sd.skill_id
WHERE 
    jpf.job_work_from_home = TRUE AND
    jpf.job_title_short = 'Data Analyst'
GROUP BY 
    sd.skills
ORDER BY 
    remote_job_count DESC;
