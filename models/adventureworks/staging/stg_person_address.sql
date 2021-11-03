with 
    source_data as (
        select --selecionar primeiro as keys e em uma ordem que faça sentido
            addressid
            , addressline1
            , addressline2
            , city
            , stateprovinceid
            , postalcode
            , spatiallocation
            --, rowguid
            --, modifieddate

        from {{  source('pipelineEL','person_address')  }}
    )

    select * from source_data