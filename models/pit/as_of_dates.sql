WITH util_days AS (
    {{ dbt_utils.date_spine(
        datepart="day",
        start_date="date_trunc('month', getdate())",
        end_date="dateadd(month, 1, date_trunc('month', getdate()))"
    )
    }}
)

select date_day as AS_OF_DATE from util_days