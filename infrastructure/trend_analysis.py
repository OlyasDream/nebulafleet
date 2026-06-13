# NebulaFleet — Infrastructure Trend Analysis
# Reads all baseline reports and shows disk usage over time

import glob
import os

baseline_dir = "/Users/olyalvova/nebulafleet/infrastructure"
files = sorted(glob.glob(f"{baseline_dir}/baseline_*.txt"))

print("=================")
print(" DISK USAGE TREND")
print("=================")

for filepath in files:
    date = os.path.basename(filepath).replace("baseline_", "").replace(".txt", "")
    with open(filepath, "r") as f:
        for line in f:
            if "Usage" in line:
                usage = line.split()[7]
                print(f" {date} - {usage}")

print("=================")