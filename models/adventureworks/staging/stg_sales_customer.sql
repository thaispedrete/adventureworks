with 
    source_data as (
        select --selecionar primeiro as keys e em uma ordem que faça sentido
            customerid
            , personid
            , storeid
            , territoryid
            --, rowguid
            --, modifieddate

        from {{  source('pipelineEL','sales_customer')  }}
    )

    select * from source_data