{{
    config(
        materialized='incremental',
        on_schema_change='fail'
    )   
}}
WITH SRC_RATINGS AS (
    SELECT * FROM {{ ref('src_ratings') }}
)
SELECT
    user_id,
    movie_id,
    rating,
    rated_at
FROM SRC_RATINGS
WHERE rating IS NOT NULL

{% if is_incremental() %}
    AND rated_at > (SELECT MAX(rated_at) FROM {{ this }}) -- this = fct_ratings
{% endif %}