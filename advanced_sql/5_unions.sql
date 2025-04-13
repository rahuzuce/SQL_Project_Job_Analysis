WITH q1_jobs AS (
    SELECT *
    FROM january_jobs

    UNION ALL

    SELECT *
    FROM february_jobs

    UNION ALL

    SELECT *
    FROM march_jobs
)

SELECT *
FROM q1_jobs
WHERE salary_year_avg >70000 