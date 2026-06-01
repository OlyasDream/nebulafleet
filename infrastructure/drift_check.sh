#!/bin/bash
# NebulaFleet Infrustructure drift check
# Compares current system state against Day 1 baseline

BASELINE_DISK=89
BASELINE_LOAD=4.89
DRIFT_DISK=5
DRIFT_LOAD=2
REPORT_DIR=~/nebulafleet/infrastructure
REPORT="$REPORT_DIR/drift_$(date '+%Y-%m-%d').txt"

echo "=================" | tee "$REPORT"
echo " NEBULA DRIFT CHECK" | tee -a "$REPORT"
echo " $(date '+%Y-%m-%d %H:%M')" | tee -a "$REPORT"
echo "=================" | tee -a "$REPORT"
echo "" | tee -a "$REPORT"
echo " [ DISK USAGE ]" | tee -a "$REPORT"
CURRENT_DISK=$(df -h ~ | awk 'NR==2{print $5}' | tr -d '%')
DISK_DIFF=$((CURRENT_DISK - BASELINE_DISK))
echo " Baseline: ${BASELINE_DISK}%" | tee -a "$REPORT"
echo " Current: ${CURRENT_DISK}%" | tee -a "$REPORT"
if [ "$DISK_DIFF" -gt "$DRIFT_DISK" ]; then
echo " ! DRIFT DETECTED: +${DISK_DIFF}% above baseline" | tee -a "$REPORT"
elif [ "$DISK_DIFF" -lt "-$DRIFT_DISK" ]; then
echo " Improved: ${DISK_DIFF}% below baseline" | tee -a "$REPORT"
else
echo " Stable - within ${DRIFT_DISK}% threshold" | tee -a "$REPORT"
fi
echo "" | tee -a "$REPORT"
echo "[ CPU LOAD ]" | tee -a "$REPORT"
CURRENT_LOAD=$(sysctl -n vm.loadavg | awk '{print $4}')
echo " Baseline: ${BASELINE_LOAD} (15 min avg)" | tee -a "$REPORT"
echo " Current: ${CURRENT_LOAD} (15 min avg)" | tee -a "$REPORT"
echo "" | tee -a "$REPORT"
echo "[ NEBULA FLEET STORAGE ]" | tee -a "$REPORT"
du -sh ~/nebulafleet/* | tee -a "$REPORT"
echo "=================" | tee -a "$REPORT"
echo " Drift report saved: $REPORT" | tee -a "$REPORT"
echo "=================" | tee -a "$REPORT"