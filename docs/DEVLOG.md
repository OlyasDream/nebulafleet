# NebulaFleet — Engineering Dev Log

---

## 2026-05-23 | Day 1
**Role:** Technical Operations  
**Task:** Environment setup + Morning health check script  
**Status:** Complete  

First day setting up the NebulaFleet simulation environment.  
Initialized folder structure, fleet nodes AV-01 through AV-04,  
and wrote the first morning health check script.  

No incidents. All nodes nominal.

---

## 2026-05-25 | Day 1
**Role:** Technical Operations  
**Task:** Morning fleet health check  
**Status:** Complete  

Wrote and executed fleet health check script across all 4 nodes.
AV-01 through AV-04 all online. Disk usage nominal at 42%.
Report auto-saved to fleet-server/reports/.

---
## 2026-05-26 | Day 1
**Role:** Infrastructure Analyst  
**Task:** System baseline report  
**Status:** Complete  

Profiled local system resources — CPU, memory, disk, storage breakdown.

Disk usage flagged at 96% — action required. 

Baseline saved to infrastructure/ for future comparison.  

Disk freed — 25GB recovered. Usage reduced from 96% to 89%.


---
## 2026-05-27 | Day 1
**Role:** Data Operations
**Task:** Log inventory audit
**Status:** Complete

Ran log inventory across all 4 nodes.
No log files found — nodes not yet writing data.
Inventory saved to data-pipeline/.
Baseline established for future comparison.

---

## 2026-05-28 | Day 1
**Role:** Junior Data Engineer
**Task:** Node status CSV export
**Status:** Complete

Built first structured data export pipeline.
Extracted status, battery, GPS and LIDAR fields from all 4 nodes.
Output: 4 rows of clean CSV data saved to data-pipeline/processed/.

---

## 2026-05-31 | Day 2
**Role:** Technical Operations  
**Task:** AV-03 incident response  
**Status:** Complete   

AV-03 flagged offline during morning health check.
All sensors inactive — battery at 0%.
Incident report generated and escalated.

Node restored to online — all sensors active.
Incident closed at 16:44.

---

## 2026-06-01 | Day 2
**Role:** Infrastructure Analyst  
**Task:** System drift check  
**Status:** Complete  

Compared current system state against Day 1 baseline.
Disk usage: 88% vs baseline 89% — stable, within 5% threshold.
CPU load: 3.94 vs baseline 4.89 — improved.
No drift detected. Fleet storage growing as expected.

---

## 2026-06-02 | Day 2
**Role:** Data Operations  
**Task:** Log generation and inventory audit  
**Status:** Complete  

Built log generator script — 10 randomized events per node.
Generated first shift logs across all 4 nodes.
Log inventory confirmed 1 file per node at 4.0K each.
Day 1 baseline: empty. Day 2: data flowing.

---

## 2026-06-08 | Day 2
**Role:** Junior Data Engineer  
**Task:** Node status enrichment pipeline  
**Status:** Complete  

Built enrichment script combining node status CSV with log counts.
Reads existing extracted data — no re-extraction needed.
Added log_count column to structured dataset.
Output: 4 enriched rows saved to data-pipeline/processed/.
First ETL pipeline complete — extract, transform, load.

---

## 2026-06-10 | Day 3
**Role:** Technical Operations  
**Task:** Morning briefing Python script  
**Status:** Complete  

Built first Python script for NebulaFleet.
Reads today's health report automatically using date-based filename.
Prints formatted morning briefing to terminal.
Python integrated into Technical Operations workflow.

---

## 2026-06-10 | Day 3
**Role:** Infrastructure Analyst  
**Task:** Disk usage trend analysis  
**Status:** Complete  

Built Python trend analysis script.
Reads all baseline reports automatically using glob.
Trend: 2026-05-26 at 89%, 2026-06-01 at 88% — stable, slight improvement.
Foundation for long-term infrastructure monitoring.

---

## 2026-06-10 | Day 3
**Role:** Data Operations  
**Task:** Fleet-wide log analysis  
**Status:** Complete  

Built Python log analysis script.
Reads all node logs — 40 total events across 4 nodes.
INFO: 30, WARNING: 10.
Most active sensor: LIDAR at 14 events.
First Python data analysis script complete.

---

## 2026-06-10 | Day 3
**Role:** Junior Data Engineer  
**Task:** Fleet summary report  
**Status:** Complete  

Built final stage of ETL pipeline — load/report.
Used csv.DictReader to read enriched dataset by column name.
Generated stakeholder-readable fleet summary.
Full pipeline complete: extract (Day 1) → transform (Day 2) → report (Day 3).

---