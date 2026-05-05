WITH SRC_TAGS AS (
    SELECT * FROM {{ ref('src_genome_tags') }}
)
SELECT
    tag_id,
    INITCAP(TRIM(tag_name)) AS tag_name
FROM SRC_TAGS