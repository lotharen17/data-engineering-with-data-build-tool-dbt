select 
  v.summons_number, 
  v.issue_date, 
  v.violation_code, 
  v.is_manhattan_96th_st_below, 
  v.issuing_agency, 
  v.violation_location, 
  v.violation_precinct, 
  v.issuer_precinct, 
  v.issuer_code, 
  v.issuer_command, 
  v.issuer_squad, 
  v.violation_time, 
  v.violation_county, 
  v.violation_legal_code, 
  c.fee_usd
from 
  {{ref('silver_parking_violations')}} as v 
  left join {{ref('silver_parking_violation_codes')}} as c 
  on v.violation_code = c.violation_code and v.is_manhattan_96th_st_below = c.is_manhattan_96th_st_below