# NebulaFleet — Log Analysis
# Reads all node logs and produces fleet-wide event summary

import os
import glob

nodes = ["AV-01","AV-02","AV-03","AV-04"]
log_dir = "/Users/olyalvova/nebulafleet/fleet-server/nodes"

severity_count = {"INFO": 0, "WARNING": 0}
sensor_count = {}

for node in nodes:
    log_files = glob.glob(f"{log_dir}/{node}/logs/*.log")
    for filepath in log_files:
        with open(filepath, "r") as f:
            for line in f:
                parts = line.split("|")
                if len(parts) >= 3:
                    severity = parts[1].strip()
                    sensor = parts[2].strip()
                    if severity in severity_count:
                        severity_count[severity] += 1
                    if sensor not in sensor_count:
                        sensor_count[sensor] = 0
                    sensor_count[sensor] += 1

print("=================")
print(" NEBULAFLEET LOG ANALYSIS")
print("=================")
print(" [SEVERITY SUMMARY] ")
for key, value in severity_count.items():
    print(f" {key}: {value}")
print()
for key, value in sensor_count.items():
    print(f" {key}: {value}")
print()
print("=================")                  





