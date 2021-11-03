{{ config(materialized='table') }}

with
    staging as (
        select *
        from {{ref('stg_sales_creditcard')}}
    )
    , transformed as (
        select
            row_number() over (order by creditcardid) as creditcardid_sk -- auto-incremental surrogate key
            , creditcardid
            , cardtype
            , cardnumber
            , expmonth
            , expyear
            -- , modifieddate
        from staging
    )

    select * from transformed