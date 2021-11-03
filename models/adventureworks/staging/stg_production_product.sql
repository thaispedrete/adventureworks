with 
    source_data as (
        select --selecionar primeiro as keys e em uma ordem que faça sentido
            productid
            , name
            , productnumber
            , makeflag
            , finishedgoodsflag
            , color
            , safetystocklevel
            , reorderpoint
            , standardcost
            , listprice
            , size
            , sizeunitmeasurecode
            , weightunitmeasurecode
            , weight
            , daystomanufacture
            , productline
            , class
            , style
            , productsubcategoryid
            , productmodelid
            , sellstartdate
            , sellenddate
            , discontinueddate
            --, rowguid
            --, modifieddate

        from {{  source('pipelineEL','production_product')  }}
    )

    select * from source_data