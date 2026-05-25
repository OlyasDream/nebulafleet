#!/bin/bash
# NebulaFleet — Morning Health Check
# Checks node status and disk usage across the fleet

NODES=("AV-01" "AV-02" "AV-03" "AV-04")
NODE_DIR=~/nebulafleet/fleet-server/nodes
REPORT_DIR=~/nebulafleet/fleet-server/reports
DISK_THRESHOLD=80

mkdir -p "$REPORT_DIR"
REPORT="$REPORT_DIR/health_$(date '+%Y-%m-%d').txt"

echo "==============================" | tee "$REPORT"
echo " NEBULAFLEET HEALTH CHECK" | tee -a "$REPORT"
echo " $(date '+%Y-%m-%d %H:%M')" | tee -a "$REPORT"
echo "==============================" | tee -a "$REPORT"
echo "" | tee -a "$REPORT"

echo "[ NODE STATUS ]" | tee -a "$REPORT"
for node in "${NODES[@]}"; do
  STATUS_FILE="$NODE_DIR/$node/status.txt"
  if [ -f "$STATUS_FILE" ]; then
    STATUS=$(grep "STATUS" "$STATUS_FILE" | cut -d: -f2 | tr -d ' ')
    echo "  $node — $STATUS" | tee -a "$REPORT"
  else
    echo "  $node — OFFLINE ⚠ FLAG" | tee -a "$REPORT"
  fi
done

echo "" | tee -a "$REPORT"
echo "[ DISK USAGE ]" | tee -a "$REPORT"
for node in "${NODES[@]}"; do
  DISK_FILE="$NODE_DIR/$node/disk_usage.txt"
  if [ -f "$DISK_FILE" ]; then
    USAGE=$(grep "DISK_USED" "$DISK_FILE" | cut -d= -f2 | tr -d '%')
    if [ "$USAGE" -gt "$DISK_THRESHOLD" ]; then
      echo "  $node — ${USAGE}% ⚠ ALERT" | tee -a "$REPORT"
    else
      echo "  $node — ${USAGE}% OK" | tee -a "$REPORT"
    fi
  fi
done

echo "" | tee -a "$REPORT"
echo "==============================" | tee -a "$REPORT"
echo "  Report saved: $REPORT" | tee -a "$REPORT"
echo "==============================" | tee -a "$REPORT"