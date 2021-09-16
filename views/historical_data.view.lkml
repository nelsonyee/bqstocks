view: historical_data {
  sql_table_name: `stocks.historical_data`
    ;;

  dimension: adj_close {
    type: number
    sql: ${TABLE}.Adj_Close ;;
  }

  dimension: close {
    type: number
    value_format: "0.00"
    sql: ${TABLE}.Close ;;
  }

  dimension_group: date {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.Date ;;
  }

  dimension: high {
    type: number
    sql: ${TABLE}.High ;;
  }

  dimension: low {
    type: number
    sql: ${TABLE}.Low ;;
  }

  dimension: open {
    type: number
    sql: ${TABLE}.Open ;;
  }

  dimension: ticker {
    type: string
    sql: ${TABLE}.Ticker ;;
  }

  dimension: volume {
    type: number
    sql: ${TABLE}.Volume ;;
  }

  dimension: last_close_date{
    type: date
    sql: (SELECT MAX(Date) FROM my-project-mysql-277723.stocks.historical_data);;
    label: "Last Close Date"
  }

  measure: adbe_price {
    sql: ${TABLE}.Close ;;
    value_format: "0.00"
    label: "ADBE"
    type: average
    filters: [ticker: "ADBE"]
    drill_fields: []
  }

  measure: nvda_price {
    sql: ${TABLE}.Close ;;
    label: "NVDA"
    type: average
    filters: [ticker: "NVDA"]
    drill_fields: []
  }

  measure: adbe_52_week_high {
    sql: ${TABLE}.Close ;;
    label: "ADBE 52 Week High"
    type: max
    value_format: "0.00"
    filters: [ticker: "ADBE", date_date: "52 weeks ago for 52 weeks"]
    drill_fields: []
  }

  measure: adbe_52_week_low {
    sql: ${TABLE}.Close ;;
    label: "ADBE 52 Week Low"
    type: min
    value_format: "0.00"
    filters: [ticker: "ADBE", date_date: "52 weeks ago for 52 weeks"]
    drill_fields: []
  }

  measure: nvda_52_week_high {
    sql: ${TABLE}.Close ;;
    label: "NVDA 52 Week High"
    type: max
    value_format: "0.00"
    filters: [ticker: "NVDA", date_date: "52 weeks ago for 52 weeks"]
    drill_fields: []
  }

  measure: nvda_52_week_low {
    sql: ${TABLE}.Close ;;
    label: "NVDA 52 Week Low"
    type: min
    value_format: "0.00"
    filters: [ticker: "NVDA", date_date: "52 weeks ago for 52 weeks"]
    drill_fields: []
  }

  measure: nvda_last_closing_price{
    sql: ${TABLE}.Close ;;
    label: "NVDA Last Close Price"
    type: average
    value_format: "0.00"
    filters: [ticker: "NVDA", date_date: "2021-08-06"]
    drill_fields: []
  }

  measure: adbe_last_closing_price{
    sql: ${TABLE}.Close ;;
    label: "ADBE Last Close Price"
    type: average
    value_format: "0.00"
    filters: [ticker: "ADBE", date_date: "2021-08-06"]
    drill_fields: []
  }

  measure: adbe_10_day_moving_average {
    sql: (SELECT SUM(Close)/10 FROM stocks.historical_data WHERE DATE > "2021-07-25" AND TICKER = "ADBE") ;;
    label: "ADBE 10 Day Moving Avg."
    type: average
    value_format: "0.00"
    filters: [ticker: "ADBE"]
  }

  measure: nvda_10_day_moving_average {
    sql: (SELECT SUM(Close)/10 FROM stocks.historical_data WHERE DATE > "2021-07-25" AND TICKER = "NVDA") ;;
    label: "NVDA 10 Day Moving Avg."
    type: average
    value_format: "0.00"
    filters: [ticker: "NVDA"]
  }

  measure: adbe_21_day_moving_average {
    sql: (SELECT SUM(Close)/21 FROM stocks.historical_data WHERE DATE > "2021-07-08" AND TICKER = "ADBE") ;;
    label: "ADBE 21 Day Moving Avg."
    type: average
    value_format: "0.00"
    filters: [ticker: "ADBE"]
  }

  measure: nvda_21_day_moving_average {
    sql: (SELECT SUM(Close)/21 FROM stocks.historical_data WHERE DATE > "2021-07-08" AND TICKER = "NVDA") ;;
    label: "NVDA 21 Day Moving Avg."
    type: average
    value_format: "0.00"
    filters: [ticker: "NVDA"]
  }

  measure: adbe_50_day_moving_average {
    sql: (SELECT SUM(Close)/50 FROM stocks.historical_data WHERE DATE > "2021-05-30" AND TICKER = "ADBE") ;;
    label: "ADBE 50 Day Moving Avg."
    type: average
    value_format: "0.00"
    filters: [ticker: "ADBE"]
  }

  measure: nvda_50_day_moving_average {
    sql: (SELECT SUM(Close)/50 FROM stocks.historical_data WHERE DATE > "2021-05-30" AND TICKER = "NVDA") ;;
    label: "NVDA 50 Day Moving Avg."
    type: average
    value_format: "0.00"
    filters: [ticker: "NVDA"]
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
