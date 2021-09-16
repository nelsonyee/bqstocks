view: project {
  sql_table_name: `project.project`
    ;;
  drill_fields: [project_id]

  dimension: project_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.project_id ;;
  }

  dimension: project_name {
    type: string
    sql: ${TABLE}.project_name ;;
  }

  measure: count {
    type: count
    drill_fields: [project_id, project_name]
  }
}
