<h1 align="center">HOSxP SQL Script Collection</h1>

<p align="center">
  <strong>Advanced SQL Queries for Hospital Data Extraction and Analytics</strong><br>
  <sub>Optimized Core Scripts for HOSxP Information Systems & 43-File Healthcare Reporting</sub>
</p>

<p align="center">
  <img src="https://img.shields.io/badge/Database-SQL-blue" />
  <img src="https://img.shields.io/badge/System-HOSxP-lightgrey" />
  <img src="https://img.shields.io/badge/43--Files-Reporting-2E7D32" />
  <img src="https://img.shields.io/badge/Eligibility_Verification-00897B" />
  <img src="https://img.shields.io/badge/Healthcare_Data_Reporting-green" />
</p>

---

## 💡 Overview & Clinical Context

This repository houses a production-grade collection of SQL queries built to optimize data extraction, auditing, and reporting within the HOSxP ecosystem. Every script was engineered by translating real-world clinical requirements from frontline nursing and OPD (Outpatient Department) staff into optimized database queries.

---

## 📈 Impact & Technical Accomplishments

- **Complex Schema Tracing:** Reverse-engineered and traced over 50+ undocumented database tables (managing 1M+ clinical records) to map out patient journeys accurately.
- **Enhanced Reporting Frequency:** Automated and optimized queries for the standard Thai 43-file healthcare reporting, boosting submission frequency from once a week to **3x per week** based on administrative nursing needs.
- **Pre-submission Eligibility Verification:** Developed queries to cross-verify patient eligibility via NHSO (สปสช.) data integration before finalizing OPD workflows, eliminating insurance rejection errors for **100+ patients/day**.
- **Schema Discovery:** Leveraged advanced prompting with LLMs to successfully map obscure HOSxP database schemas (e.g., dental sub-systems like `dtx`) and locate critical data points within 24 hours.

---

## 🗂️ Script Catalog

A curated collection of SQL queries handling core hospital information tasks:

- 🔍 **`extract_patient_data.sql`** — Core ETL query for comprehensive patient demographic profiling.
- 🩺 **`extract_patient_visit_daily.sql`** — Tracks daily Outpatient Department (OPD) encounter workflows.
- 💊 **`extract_patient_drug_allergy.sql`** — Fetches patient drug hypersensitivity records for clinical safety.
- 🦷 **`extract_patient_dtx_records.sql`** — Extracted dental informatics records by mapping hidden sub-schemas.
- 🧾 **`extract_patient_billing_by_group.sql`** — Aggregates financial and billing groups for insurance verification.
- 🚨 **`check_patient_data_consistency.sql`** — Runs administrative audit checks to reduce manual data-entry errors.
- 🗺️ **`extract_village_list.sql`** — Maps public health geographical data across local community sectors.
- 💻 **`telemedicine_completed.sql`** — Queries intake logs for completed digital telehealth services.

---

## 📖 Sample Query Architecture

Below is an abstract design pattern demonstrating how data is safely joined across core HOSxP relations (`patient`, `ovst`, `opdscreen`) to feed nursing data pipelines:

```sql
SELECT 
    p.hn,
    CONCAT(p.pname, p.fname, ' ', p.lname) AS patient_name,
    o.vstdate,
    o.vsttime,
    s.bps,
    s.bpd,
    s.pulse
FROM ovst o
LEFT JOIN patient p ON p.hn = o.hn
LEFT JOIN opdscreen s ON s.vn = o.vn
WHERE o.vstdate = CURRENT_DATE
ORDER BY o.vsttime DESC;
```

---

## 👥 Mentorship & Collaboration

- **Cross-Functional Synergy:** Collaborated directly with senior clinical coordinators to validate data metrics against real-world hospital workloads.
- **Intern Mentorship:** Structured and documented these scripts to serve as a practical learning foundation for onboarding junior tech interns entering the health-tech domain.

---

## 🔗 References & Case Studies

- 📖 **HOSxP System Overview:** [Wikipedia Reference](https://wikipedia.org)
- 💼 **Deep-Dive Case Study:** Read my detailed engineering analysis on [LinkedIn Post](https://linkedin.com)

---

## License

MIT License
