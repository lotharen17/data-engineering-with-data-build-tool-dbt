WITH manhattan_violation_codes AS (
  select 
    violation_code, 
    definition, 
    TRUE as is_manhattan_96th_st_below, 
    manhattan_96th_st_below as fee_usd, 
  FROM 
    {{ref('bronze_parking_violation_codes')}}
), 
all_other_violation_codes AS (
  SELECT 
    violation_code, 
    definition, 
    FALSE as is_manhattan_96th_st_below, 
    all_other_areas as fee_usd
  FROM 
    {{ref('bronze_parking_violation_codes')}}
)
SELECT * FROM manhattan_violation_codes
UNION ALL 
SELECT * FROM all_other_violation_codes
ORDER BY violation_code ASC