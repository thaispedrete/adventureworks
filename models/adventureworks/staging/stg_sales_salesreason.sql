with 
    source_data as (
        select --selecionar primeiro as keys e em uma ordem que faça sentido
            salesreasonid
            , name
            , reasontype
            --, modifieddate

        from {{  source('pipelineEL','sales_salesreason')  }}
    )

    select * from source_data