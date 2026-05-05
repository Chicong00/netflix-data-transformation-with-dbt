{% snapshot snap_tags %}

{{
    config(
        target_schema='snapshots',
        unique_key=['user_id', 'movie_id', 'tag_name'],
        strategy='timestamp',
        updated_at='tagged_at',
        invalidate_hard_deletes=True
    )
}}

SELECT
    {{ dbt_utils.generate_surrogate_key(['user_id', 'movie_id', 'tag_name']) }} AS tags_sk,
    user_id,
    movie_id,
    tag_name,
    CAST(tagged_at AS TIMESTAMP_NTZ) AS tagged_at
FROM {{ ref('src_tags') }}
LIMIT 100

{% endsnapshot %}