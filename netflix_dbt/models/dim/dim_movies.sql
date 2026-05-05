WITH SRC_MOVIES AS (
    SELECT * FROM {{ ref('src_movies') }}
)
SELECT
    movie_id,
    INITCAP(TRIM(movie_title)) AS movie_title,
    SPLIT(movie_genres, '|') AS movie_genres_array,
    movie_genres
FROM SRC_MOVIES