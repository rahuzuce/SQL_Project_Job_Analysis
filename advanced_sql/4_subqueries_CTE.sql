/*

SELECT *
FROM ( -- subquery starts here
    SELECT *
    FROM job_postings_fact
    WHERE EXTRACT(MONTH FROM job_posted_date) = 1
) AS january_jobs;-- subquery ends here



WITH january_jobs AS ( -- CTE starts here
    SELECT *
    FROM job_postings_fact
    WHERE EXTRACT(MONTH FROM job_posted_date) = 1
) -- CTE ends here

SELECT *
FROM january_jobs

*/

-- Get company names for jobs with no degree requirement
-- 1. Filter all rows with no degree requirement; get company id
-- 2. Get distinct company ids
-- 3. Join with company dimension table to get company names
-- Get company names for jobs with no degree requirement

WITH company_ids_with_most_job_openings AS (
    SELECT 
        company_id,
        COUNT(*) AS total_jobs
    FROM 
        job_postings_fact
    GROUP BY 
        company_id
)
-- Step 2: Join with the company dimension table to get company names
SELECT 
    company.name,
    company_ids_with_most_job_openings.total_jobs
FROM 
    company_ids_with_most_job_openings
RIGHT JOIN company_dim AS company
ON company_ids_with_most_job_openings.company_id = company.company_id
ORDER BY
    company_ids_with_most_job_openings.total_jobs DESC;
