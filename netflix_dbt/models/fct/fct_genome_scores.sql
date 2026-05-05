WITH SRC_SCORES AS (
    SELECT * FROM {{ ref('src_genome_scores') }}
)
SELECT
    movie_id,
    tag_id,
    ROUND(relevance, 4) AS relevance_score
FROM SRC_SCORES
WHERE relevance > 0 