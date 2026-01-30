SELECT
    p.hn,
    p.cid,
    p.pname,
    p.fname,
    p.lname,
    p.sex,
    CASE p.sex
        WHEN 1 THEN 'ชาย'
        WHEN 2 THEN 'หญิง'
        ELSE 'ไม่ระบุ'
    END AS sex_name,
    o.vstdate,
    o.dtx
FROM patient p
JOIN opdscreen o ON o.hn = p.hn
WHERE o.dtx IS NOT NULL
  AND o.dtx <> ''
  AND p.death = 'N';
