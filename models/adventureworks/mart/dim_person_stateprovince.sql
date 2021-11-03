{{ config(materialized='table') }}

with
    staging as (
        select *
        from {{ref('stg_person_stateprovince')}}
    )
    , transformed as (
        select
            row_number() over (order by stateprovinceid) as stateprovinceid_sk -- auto-incremental surrogate key
            , stateprovinceid
            , stateprovincecode
            , countryregioncode
            , isonlystateprovinceflag
            , name
            , territoryid
            --, rowguid
            --, modifieddate

        from staging
    )

    select * from transformed