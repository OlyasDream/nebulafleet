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

---