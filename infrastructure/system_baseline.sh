#!/bin/bash
# NebulaFleet — System Baseline Report
# Documents system resources and current usage

REPORT_DIR=~/nebulafleet/infrastructure
REPORT="$REPORT_DIR/baseline_$(date '+%Y-%m-%d').txt"

echo "==============================" | tee "$REPORT"
echo " NEBULAFLEET SYSTEM BASELINE" | tee -a "$REPORT"
echo " $(date '+%Y-%m-%d %H:%M')" | tee -a "$REPORT"
echo "==============================" | tee -a "$REPORT"
echo "" | tee -a "$REPORT"

echo "[ CPU ]" | tee -a "$REPORT"
sysctl -n machdep.cpu.brand_string | tee -a "$REPORT"
echo "Load average: $(sysctl -n vm.loadavg | awk '{print $2, $3, $4}')" | tee -a "$REPORT"
echo "" | tee -a "$REPORT"

echo "[ MEMORY ]" | tee -a "$REPORT"
total=$(sysctl -n hw.memsize | awk '{printf "%.0f", $1/1024/1024/1024}')
echo "Total RAM: ${total}GB" | tee -a "$REPORT"
echo "" | tee -a "$REPORT"

echo "[ DISK ]" | tee -a "$REPORT"
df -h ~ | awk 'NR==2 {print "Total: "$2"  Used: "$3"  Available: "$4"  Usage: "$5}' | tee -a "$REPORT"
echo "" | tee -a "$REPORT"

echo "[ NEBULAFLEET STORAGE ]" | tee -a "$REPORT"
du -sh ~/nebulafleet/* | tee -a "$REPORT"
echo "" | tee -a "$REPORT"

echo "==============================" | tee -a "$REPORT"
echo " Baseline saved: $REPORT" | tee -a "$REPORT"
echo "==============================" | tee -a "$REPORT"