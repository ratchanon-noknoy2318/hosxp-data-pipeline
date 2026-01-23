select o.*,   concat(p.pname,p.fname,' ',p.lname) as patient_name  ,ar.relation_name ,ag.allergy_group_name,
 asr.seiousness_name  ,ars.result_name,sp.name as spclty_name
 from opd_allergy o
 left outer join patient p on p.hn = o.hn
 left outer join allergy_group ag on ag.allergy_group_id = o.allergy_group_id
 left outer join allergy_seriousness asr on asr.seriousness_id = o.seriousness_id
 left outer join allergy_result ars on ars.allergy_result_id = o.allergy_result_id
 left outer join allergy_relation ar on ar.allergy_relation_id = o.allergy_relation_id
 left outer join spclty sp on sp.spclty = o.spclty
