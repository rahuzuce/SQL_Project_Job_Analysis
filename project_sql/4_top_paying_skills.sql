-- Query to calculate the top skills based on salary for Data Analyst Remote roles
SELECT 
    sd.skills,
    ROUND(AVG(jp.salary_year_avg),0) AS avg_salary,
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
    AND jp.salary_year_avg IS NOT NULL
GROUP BY 
    sd.skills
--HAVING
  --  COUNT(*) > 10
ORDER BY 
    avg_salary DESC
LIMIT 25;


/*
INSIGHTS:
	•	🔥 Specialized or niche tools (like PySpark, Bitbucket, Couchbase) command the highest average salaries, but appear in fewer job postings.
	•	📊 Foundational skills like Python, R, and SQL are the most common, but offer lower average salaries due to wide usage across all job levels.
	•	🚀 Cloud platforms (AWS, Azure, Snowflake) and modern data tools (Databricks, Airflow) show strong salary potential and are key for high-paying analyst roles.
[
  {
    "skills": "pyspark",
    "avg_salary": "208172",
    "skill_count": "2"
  },
  {
    "skills": "bitbucket",
    "avg_salary": "189155",
    "skill_count": "2"
  },
  {
    "skills": "couchbase",
    "avg_salary": "160515",
    "skill_count": "1"
  },
  {
    "skills": "watson",
    "avg_salary": "160515",
    "skill_count": "1"
  },
  {
    "skills": "datarobot",
    "avg_salary": "155486",
    "skill_count": "1"
  },
  {
    "skills": "gitlab",
    "avg_salary": "154500",
    "skill_count": "3"
  },
  {
    "skills": "swift",
    "avg_salary": "153750",
    "skill_count": "2"
  },
  {
    "skills": "jupyter",
    "avg_salary": "152777",
    "skill_count": "3"
  },
  {
    "skills": "pandas",
    "avg_salary": "151821",
    "skill_count": "9"
  },
  {
    "skills": "elasticsearch",
    "avg_salary": "145000",
    "skill_count": "1"
  },
  {
    "skills": "golang",
    "avg_salary": "145000",
    "skill_count": "1"
  },
  {
    "skills": "numpy",
    "avg_salary": "143513",
    "skill_count": "5"
  },
  {
    "skills": "databricks",
    "avg_salary": "141907",
    "skill_count": "10"
  },
  {
    "skills": "linux",
    "avg_salary": "136508",
    "skill_count": "2"
  },
  {
    "skills": "kubernetes",
    "avg_salary": "132500",
    "skill_count": "2"
  },
  {
    "skills": "atlassian",
    "avg_salary": "131162",
    "skill_count": "5"
  },
  {
    "skills": "twilio",
    "avg_salary": "127000",
    "skill_count": "1"
  },
  {
    "skills": "airflow",
    "avg_salary": "126103",
    "skill_count": "5"
  },
  {
    "skills": "scikit-learn",
    "avg_salary": "125781",
    "skill_count": "2"
  },
  {
    "skills": "jenkins",
    "avg_salary": "125436",
    "skill_count": "3"
  },
  {
    "skills": "notion",
    "avg_salary": "125000",
    "skill_count": "1"
  },
  {
    "skills": "scala",
    "avg_salary": "124903",
    "skill_count": "5"
  },
  {
    "skills": "postgresql",
    "avg_salary": "123879",
    "skill_count": "4"
  },
  {
    "skills": "gcp",
    "avg_salary": "122500",
    "skill_count": "3"
  },
  {
    "skills": "microstrategy",
    "avg_salary": "121619",
    "skill_count": "2"
  }
]
*/