# HOSxP Data Integration Pipeline

SQL-based pipeline for **400K+ healthcare records**, optimized for executive BI, AI data auditing, and staff automation.

---

## Data Governance (PDPA Compliant)
* **PII Protection:** Strategic data minimization for workflow security.
* **Integrity:** Strict schema constraints to prevent duplication/leakage.
* **Reliability:** Managed sensitive records in compliance with Thailand's PDPA.

---

## Schema Mapping
| Source (HOSxP) | Target (Integrated) | Type | Note |
| :--- | :--- | :--- | :--- |
| p.cid | citizen_id | VARCHAR(13) | **Unique/PII** |
| p.pname | title | VARCHAR(20) | Identity |
| p.fname | first_name | VARCHAR(100) | Identity |
| p.lname | last_name | VARCHAR(100) | Identity |
| p.birthdate | birthdate | DATE | Sensitive |
| p.sex | gender | INT | Demographic |
| h.address | house_number| VARCHAR(50) | Location |
| h.road | road | VARCHAR(100) | Location |
| v.village_name| village_name | VARCHAR(100) | Location |

---

## Data Utilization
### 1. Executive Decision Support
* **BI Dashboards:** Real-time stats for **Top Management** strategic planning.
* **Resource Allocation:** Trend-based budgeting and staffing optimization.

### 2. AI-Powered Data Quality
* **Anomaly Detection:** AI models identify mismatched ages or invalid IDs.
* **Auto-Audit:** Automated cleaning of inconsistent or duplicate Master Data.

### 3. Staff Workflow Automation
* **Staff Alerts:** LINE API integration for automated appointment & task reminders.
* **System Sync:** Automatic patient data sync to eliminate manual entry errors.

---

## Contact
* **Ratchanon Noknoy**
* [LinkedIn](https://linkedin.com/in/ratchanon-noknoy/) | [GitHub](https://github.com/ratchanon.noknoy2318)
* **Email:** ratchanon.noknoy2318@gmail.com
