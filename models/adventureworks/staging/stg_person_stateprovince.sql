with 
    source_data as (
        select --selecionar primeiro as keys e em uma ordem que faça sentido
            stateprovinceid
            , stateprovincecode
            , countryregioncode
            , isonlystateprovinceflag
            , name
            , territoryid
            --, rowguid
            --, modifieddate

        from {{  source('pipelineEL','person_stateprovince')  }}
    )

    select * from source_data