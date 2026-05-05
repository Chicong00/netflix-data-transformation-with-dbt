WITH raw_genome_tags AS (
    SELECT * FROM {{ source('netflix_raw', 'r_genome_tags') }}
)
SELECT
    tagId AS tag_id,
    tag AS tag_name
FROM raw_genome_tags
