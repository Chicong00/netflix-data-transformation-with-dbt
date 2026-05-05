WITH raw_genome_tags AS (
    SELECT * FROM MOVIELENS.RAW.RAW_GENOME_TAGS
)
SELECT
    tagId AS tag_id,
    tag AS tag_name
FROM raw_genome_tags
