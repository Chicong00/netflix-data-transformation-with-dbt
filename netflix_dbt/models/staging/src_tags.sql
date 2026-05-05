WITH raw_tags AS (
    SELECT * FROM {{ source('netflix', 'r_tags') }}
)
SELECT
    userId AS user_id,
    movieId AS movie_id,
    tag AS tag_name,
    TO_TIMESTAMP(timestamp) AS tagged_at
FROM raw_tags
