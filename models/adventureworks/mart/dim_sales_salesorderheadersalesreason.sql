{{ config(materialized='table') }}

with
    staging as (
        select *
        from {{ref('stg_sales_salesorderheadersalesreason')}}
    )
    , transformed as (
        select
            row_number() over (order by salesorderid) as salesorderid_sk -- auto-incremental surrogate key
            , salesorderid
            , salesreasonid
            -- , modifieddate
        from staging
    )

    select * from transformed