# HOSxP Analytics Pipeline

A SQL-based data pipeline for extracting, transforming, and analyzing operational data from legacy HOSxP hospital systems.

---

## Overview

This project provides a structured approach to working with highly normalized and undocumented hospital databases.

It enables reliable analytics across outpatient (OPD) workflows by simplifying complex joins and improving query performance.

---

## Architecture

```
HOSxP (MySQL)
    ↓
SQL ETL Layer
    ↓
Analytics Views
    ↓
Dashboards / Reports
```

---

## Data Model (OPD)

### Core Entities

* `patient` — patient demographics
* `ovst` — outpatient visits
* `ovstdiag` — diagnoses
* `opdscreen` — screening data
* `vn_stat` — visit-level financial summary

### Billing

* `opitemrece` — billing line items
* `drugitems` — drug catalog
* `nondrugitems` — non-drug services

### Reference Data

* `pttype`, `pttypeno` — insurance / coverage
* `spclty`, `kskdepartment`, `clinic` — organization structure
* `doctor`, `opduser` — staff

### Clinical Coding

* `icd101` — ICD-10
* `icd9cm1` — ICD-9
* `diagtype` — diagnosis types

### Supporting

* `lab_head`, `lab_order` — laboratory data
* `oapp` — appointments
* `thaiaddress` — address hierarchy

---

## Example Query

```sql
SELECT
  o.vstdate,
  COUNT(DISTINCT o.vn) AS visit_count
FROM ovst o
WHERE o.vstdate BETWEEN '2025-03-01' AND '2025-09-30'
GROUP BY o.vstdate
ORDER BY o.vstdate DESC;
```

---

## Design Principles

* **SQL-first**
  All transformations and analytics are implemented in SQL.

* **Minimal infrastructure**
  Avoid external dependencies; leverage existing MySQL systems.

* **Performance-oriented**
  Optimize joins, indexing, and aggregation for large datasets.

* **Incremental development**
  Improve queries without disrupting production workflows.

---

## Challenges

* Undocumented schema
* Deeply nested relationships
* High join complexity
* Query performance at scale

---

## Repository Structure

```
Database/   schema exploration
SQL/        ETL and analytics queries
```

---

## Future Work

* Introduce a data warehouse layer (star schema)
* Add orchestration (e.g., scheduled ETL)
* Implement data validation and monitoring

---

## License

MIT
