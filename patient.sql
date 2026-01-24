SELECT 
    JSON_ARRAYAGG(
        JSON_OBJECT(
            'hn', hn,
            'prefix', pname,
            -- แปลงค่าตัวเลขเป็นคำอ่าน
            'gender_label', CASE 
                WHEN sex = '1' THEN 'ชาย' 
                WHEN sex = '2' THEN 'หญิง' 
                ELSE 'ไม่ระบุ' 
            END,
            'age', TIMESTAMPDIFF(YEAR, birthday, CURDATE())
        )
    ) AS patient_json_data
FROM patient
-- ดึงมาเฉพาะกลุ่มที่เสี่ยงจะผิดเพื่อประหยัด Token ของ AI
WHERE 
    (pname = 'นาย' AND sex != '1') 
    OR (pname IN ('นาง', 'นางสาว') AND sex != '2')
    OR (pname IN ('ด.ช.', 'ด.ญ.') AND TIMESTAMPDIFF(YEAR, birthday, CURDATE()) >= 15)
LIMIT 100;