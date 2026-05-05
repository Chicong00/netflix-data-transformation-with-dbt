{{config(
    materialized='ephemeral'
)}}

WITH movies as (
    SELECT * FROM {{ ref('dim_movies') }}
),
tags as (
    SELECT * FROM {{ ref('dim_genome_tags') }}
),
scores as (
    SELECT * FROM {{ ref('fct_genome_scores') }}
)
SELECT 
    m.movie_id,
    m.movie_title,
    m.movie_genres_array,
    m.movie_genres,
    t.tag_name,
    s.relevance_score
FROM movies m
LEFT JOIN scores s ON m.movie_id = s.movie_id
LEFT JOIN tags t ON s.tag_id = t.tag_id