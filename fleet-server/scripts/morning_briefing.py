# NebulaFleet — Morning Briefing
# Reads fleet health data and prints daily summary

from datetime import date
today = date.today().strftime("%Y-%m-%d")
health_report= f"/Users/olyalvova/nebulafleet/fleet-server/reports/health_{today}.txt"

print(" ================= ")
print(" NEBULAFLEET MORNING BRIEFING ")
print(f" {today}")
print(" ================= ")
print()

print("[ HEALTH REPORT ]")
try:
    with open(health_report, "r") as f:
        content = f.read()
    print(content)
except FileNotFoundError:
    print("  No health report found for today.")
    print("  Run health_check.sh first.")