#!/bin/bash
# NebulaFleet — Log Inventory
# Checks node status and disk usage across the fleet

NODES=("AV-01" "AV-02" "AV-03" "AV-04")
NODE_DIR=~/nebulafleet/fleet-server/nodes
REPORT_DIR=~/nebulafleet/data-pipeline
REPORT="$REPORT_DIR/log-inventory_$(date '+%Y-%m-%d').txt"

echo "==============================" | tee "$REPORT"
echo " NEBULAFLEET LOG INVENTORY" | tee -a "$REPORT"
echo " $(date '+%Y-%m-%d %H:%M')" | tee -a "$REPORT"
echo "==============================" | tee -a "$REPORT"
echo "" | tee -a "$REPORT"

echo "[ NODE LOG AUDIT ]" | tee -a "$REPORT"


for node in "${NODES[@]}"; do
LOG_DIR="$NODE_DIR/$node/logs"
echo "--- $node ---" | tee -a "$REPORT"

if [ ! -d "$LOG_DIR" ]; then
echo " No log directory found" | tee -a "$REPORT"
echo "" | tee -a "$REPORT"
continue
fi
COUNT=$(find "$LOG_DIR" -type f | wc -l | tr -d ' ')
if [ "$COUNT" -eq 0 ]; then
    echo "  No log files found — node may not be writing data" | tee -a "$REPORT"
  else
    echo "  Log files found: $COUNT" | tee -a "$REPORT"
    find "$LOG_DIR" -type f | while read file; do
      echo "    $(basename $file) — $(du -sh $file | cut -f1)" | tee -a "$REPORT"
    done
  fi
  echo "" | tee -a "$REPORT"
done

echo "==============================" | tee -a "$REPORT"
echo " Inventory saved: $REPORT" | tee -a "$REPORT"
echo "==============================" | tee -a "$REPORT"
