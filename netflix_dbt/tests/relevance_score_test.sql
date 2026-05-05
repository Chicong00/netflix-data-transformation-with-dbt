SELECT
    movie_id,
    tag_id,
    relevance_score
FROM {{ ref('fct_relevance_scores') }}
WHERE relevance_score <= 0