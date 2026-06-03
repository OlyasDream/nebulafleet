#!/bin/bash
# NebulaFleet — Log Generator
# Simulates vehicle log entries for all fleet nodes

NODES=("AV-01" "AV-02" "AV-03" "AV-04")
LOG_DIR=~/nebulafleet/fleet-server/nodes
DATE=$(date '+%Y-%m-%d')

for node in "${NODES[@]}"; do 
LOG_FILE="$LOG_DIR/$node/logs/system_${DATE}.log"
EVENTS=(
  "INFO | LIDAR | Obstacle detected at 12m"
  "INFO | CAMERA | Traffic light: RED — vehicle stopped"
  "INFO | CAMERA | Traffic light: GREEN — vehicle moving"
  "INFO | GPS | Position updated"
  "INFO | SYSTEM | Speed: 25mph"
  "INFO | SYSTEM | Speed: 15mph"
  "WARNING | RADAR | Vehicle detected 8m ahead"
  "WARNING | LIDAR | Pedestrian detected at 6m"
  "INFO | SYSTEM | Lane change executed"
  "INFO | CAMERA | Stop sign detected — vehicle stopped"
)
for i in {1..10}; do
TIMESTAMP=$(date '+%Y-%m-%d %H:%M:%S')
EVENT=${EVENTS[$RANDOM % ${#EVENTS[@]}]}
echo "$TIMESTAMP | $EVENT" >> "$LOG_FILE"
done
echo " $node - log generated"
done

echo "=================" 
echo " Log generation complete"
echo " $(date '+%Y-%m-%d %H:%M')"
echo "================="