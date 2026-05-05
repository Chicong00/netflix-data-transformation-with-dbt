WITH raw_movies AS (
    SELECT * FROM MOVIELENS.RAW.RAW_MOVIES
)
SELECT
    movieId AS movie_id,
    title AS movie_title,
    genres AS movie_genres
FROM raw_movies