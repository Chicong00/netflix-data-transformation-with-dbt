WITH raw_tags AS (
    SELECT * FROM MOVIELENS.RAW.RAW_TAGS
)
SELECT
    userId AS user_id,
    movieId AS movie_id,
    tag AS tag_name,
    TO_TIMESTAMP(timestamp) AS tagged_at
FROM raw_tags
