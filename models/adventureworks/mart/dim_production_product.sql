{{ config(materialized='table') }}

with
    staging as (
        select *
        from {{ref('stg_production_product')}}
    )
    , transformed as (
        select
            row_number() over (order by productid) as productid_sk -- auto-incremental surrogate key
            , productid
            , name
            , productnumber
            , makeflag
            , finishedgoodsflag
            , color
            , safetystocklevel
            , reorderpoint
            , standardcost
            , listprice
            , size
            , sizeunitmeasurecode
            , weightunitmeasurecode
            , weight
            , daystomanufacture
            , productline
            , class
            , style
            , productsubcategoryid
            , productmodelid
            , sellstartdate
            , sellenddate
            , discontinueddate
            --, rowguid
            --, modifieddate

        from staging
    )

    select * from transformed