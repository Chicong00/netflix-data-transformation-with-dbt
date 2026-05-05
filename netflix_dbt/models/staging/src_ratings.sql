WITH raw_ratings AS (
    SELECT * FROM {{ source('netflix_raw', 'r_ratings') }}
)
SELECT
    userId AS user_id,
    movieId AS movie_id,
    rating,
    TO_TIMESTAMP(timestamp) AS rated_at
FROM raw_ratings
