WITH raw_genome_scores AS (
    SELECT * FROM {{ source('netflix_raw', 'r_genome_scores') }}
)
SELECT
    movieId AS movie_id,
    tagId AS tag_id,
    relevance
FROM raw_genome_scores
