{{ config (materialized = 'table') }}

WITH fct_ratings AS (
    SELECT * FROM {{ ref('fct_ratings') }}
),
seed_dates AS (
    SELECT * FROM {{ ref('seed_movies_release_dates') }}
)

SELECT
    r.movie_id,
    CASE 
        WHEN d.release_date IS NOT NULL THEN 'Released'
        ELSE 'Not Released'
    END AS release_status
FROM fct_ratings r
LEFT JOIN seed_dates d on r.movie_id = d.movie_id
