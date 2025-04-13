SELECT
    COUNT(job_title_short) AS total_jobs,
    CASE
        WHEN job_location = 'Anywhere' THEN 'Remote'
        WHEN job_location LIKE '%New York%' THEN 'Local'
        ELSE 'Other'
    END AS location_category
FROM 
    job_postings_fact
WHERE
    job_title_short = 'Data Analyst'
GROUP BY
    location_category
   