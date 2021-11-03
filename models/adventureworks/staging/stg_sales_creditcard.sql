with 
    source_data as (
        select --selecionar primeiro as keys e em uma ordem que faça sentido
            creditcardid
            , cardtype
            , cardnumber
            , expmonth
            , expyear
            --, modifieddate

        from {{  source('pipelineEL','sales_creditcard')  }}
    )

    select * from source_data