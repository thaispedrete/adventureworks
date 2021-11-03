{{ config(materialized='table') }}

with
    sales_customer_with_sk as (
        select
            customerid_sk
            , customerid
        from {{  ref('dim_sales_customer')  }}
    )

    , sales_creditcard_with_sk as (
        select
            creditcardid_sk
            , creditcardid
        from {{  ref('dim_sales_creditcard')  }}
    )

    , sales_salesreason_with_sk as (
        select
            salesreasonid_sk
            , salesreasonid
        from {{  ref('dim_sales_salesreason')  }}
    )

    , sales_salesorderheadersalesreason_with_sk as (
        select
            salesorderid_sk
            , salesorderid
            , salesreasonid
        from {{  ref('dim_sales_salesorderheadersalesreason')  }}
    )

    , person_countryregion_with_sk as (
        select
            countryregioncode_sk
            , countryregioncode
        from {{  ref('dim_person_countryregion')  }}
    )

    , person_stateprovince_with_sk as (
        select
            stateprovinceid_sk
            , stateprovinceid
            , countryregioncode
            , territoryid
        from {{  ref('dim_person_stateprovince')  }}
    )

    , sales_salesorderheader_with_fk as (
        select
            sales_salesorderheader.salesorderid
            , sales_salesorderheader.revisionnumber
            , sales_salesorderheader.orderdate
            , sales_salesorderheader.duedate
            , sales_salesorderheader.shipdate
            , sales_salesorderheader.status
            , sales_salesorderheader.onlineorderflag
            , sales_salesorderheader.purchaseordernumber
            , sales_salesorderheader.accountnumber
            , sales_customer_with_sk.customerid_sk as customerid_fk
            , sales_salesorderheader.salespersonid
            , sales_salesorderheader.territoryid
            , person_stateprovince_with_sk.stateprovinceid_sk as stateprovinceid_fk
            , person_countryregion_with_sk.countryregioncode_sk as countryregioncode_fk
            , sales_salesorderheader.billtoaddressid
            , sales_salesorderheader.shiptoaddressid
            , sales_salesorderheader.shipmethodid
            , sales_creditcard_with_sk.creditcardid_sk as creditcardid_fk
            , sales_salesorderheader.creditcardapprovalcode
            , sales_salesorderheader.currencyrateid
            , sales_salesorderheader.subtotal
            , sales_salesorderheader.taxamt
            , sales_salesorderheader.freight
            , sales_salesorderheader.totaldue
            , sales_salesorderheader.comment
            , sales_salesreason_with_sk.salesreasonid_sk as salesreason_fk
        from {{  ref('stg_sales_salesorderheader')  }} sales_salesorderheader
        left join sales_customer_with_sk
        on sales_salesorderheader.customerid = sales_customer_with_sk.customerid
        left join sales_creditcard_with_sk
        on sales_salesorderheader.creditcardid = sales_creditcard_with_sk.creditcardid
        left join sales_salesorderheadersalesreason_with_sk
        on sales_salesorderheader.salesorderid = sales_salesorderheadersalesreason_with_sk.salesorderid
        left join sales_salesreason_with_sk
        on sales_salesorderheadersalesreason_with_sk.salesreasonid = sales_salesreason_with_sk.salesreasonid
        left join person_stateprovince_with_sk
        on sales_salesorderheader.territoryid = person_stateprovince_with_sk.territoryid
        left join person_countryregion_with_sk
        on person_stateprovince_with_sk.countryregioncode = person_countryregion_with_sk.countryregioncode
    )

    select * from sales_salesorderheader_with_fk