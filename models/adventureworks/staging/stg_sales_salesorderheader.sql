with 
    source_data as (
        select --selecionar primeiro as keys e em uma ordem que faça sentido
            salesorderid
            , revisionnumber
            , orderdate
            , duedate
            , shipdate
            , status
            , onlineorderflag
            , purchaseordernumber
            , accountnumber
            , customerid
            , salespersonid
            , territoryid
            , billtoaddressid
            , shiptoaddressid
            , shipmethodid
            , creditcardid
            , creditcardapprovalcode
            , currencyrateid
            , subtotal
            , taxamt
            , freight
            , totaldue
            , comment
            --, rowguid
            --, modifieddate

        from {{  source('pipelineEL','sales_salesorderheader')  }}
    )

    select * from source_data