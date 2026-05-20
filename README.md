# Common Tables
| Table           | Description                        |
| --------------- | ---------------------------------- |
| `patient`       | Patient information                |
| `ovst`          | Outpatient visit records           |
| `ovstdiag`      | ICD-10 diagnosis for outpatients   |
| `pttype`        | Patient insurance/coverage types   |
| `vn_stat`       | Outpatient billing summary (by VN) |
| `opitemrece`    | Medical service items (ICD/ICode)  |
| `drugitems`     | Drug master list                   |
| `nondrugitems`  | Non-drug supplies                  |
| `doctor`        | Doctor information                 |
| `opduser`       | System user accounts               |
| `sex`           | Gender reference                   |
| `icd101`        | ICD-10 master data                 |
| `kskdepartment` | Department master data             |

# Example SQL

```sql
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
JOIN opdscreen o 
    ON o.hn = p.hn
   AND o.dtx IS NOT NULL
   AND o.dtx <> ''
WHERE p.death = 'N';
```

## Case study

LinkedIn:
https://www.linkedin.com/posts/ratchanon-noknoy_healthcaredata-dataengineering-healthtech-share-7456534276168282112-Qn8r?utm_source=share&utm_medium=member_desktop&rcm=ACoAAF2Q4JEBP4yITEVbIn3E5Y8zTBxoVS6vqRA
