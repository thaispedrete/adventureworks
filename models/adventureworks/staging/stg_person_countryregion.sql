with 
    source_data as (
        select --selecionar primeiro as keys e em uma ordem que faça sentido
            countryregioncode
            , name
            --, modifieddate

        from {{  source('pipelineEL','person_countryregion')  }}
    )

    select * from source_data