with 
    source_data as (
        select --selecionar primeiro as keys e em uma ordem que faça sentido
            salesorderid
            , salesreasonid
            --, modifieddate

        from {{  source('pipelineEL','sales_salesorderheadersalesreason')  }}
    )

    select * from source_data