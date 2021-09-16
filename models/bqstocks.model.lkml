connection: "bqstocks"

# include all the views
include: "/views/**/*.view"

datagroup: bqstocks_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: bqstocks_default_datagroup

explore: historical_data {}

# explore: adbe {}

