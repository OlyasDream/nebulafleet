# NebulaFleet — Fleet Summary Report
# Reads enriched node data and produces a readable stakeholder report

import csv
input_file = "/Users/olyalvova/nebulafleet/data-pipeline/processed/node_enriched_2026-06-08.csv"

print("=================")
print(" NEBULAFLEET FLEET SUMMARY REPORT")
print("=================")
print()

online_count = 0
total_logs = 0

with open(input_file, "r") as f:
    reader = csv.DictReader(f)
    for row in reader:
        print(f"Node: {row['node']}")
        print(f" Status:    {row['node_status']}")
        print(f" Battery:   {row['battery']}")
        print(f" GPS:       {row['gps']}")
        print(f" LIDAR:     {row['lidar']}")
        print(f" Log_count {row['log_count']}")
        print()

        if row['node_status'] == "ONLINE":
            online_count +=1
        total_logs += int(row['log_count'])

print("=================")
print(" FLEET TOTALS")
print("=================")
print(f" Nodes online: {online_count} / 4")
print(f" Total log events {total_logs}")
print("=================")


