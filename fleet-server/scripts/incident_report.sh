#!/bin/bash
# NebulaFleet incident report generatior
# Creates a formal incident repord for offline or degraded nodes

NODE=$1
INCIDENT_DIR=~/nebulafleet/fleet-server/reports/incidents
NODE_DIR=~/nebulafleet/fleet-server/nodes
TIMESTAMP=$(date '+%Y-%m-%d %H:%M:%S')
DATE=$(date '+%Y-%m-%d')

mkdir -p "$INCIDENT_DIR"

REPORT="$INCIDENT_DIR/incident_${NODE}_${DATE}.txt"

STATUS_FILE="$NODE_DIR/$NODE/status.txt"
STATUS=$(grep "^STATUS" "$STATUS_FILE" | cut -d: -f2 | tr -d ' ')
BATTERY=$(grep "^BATTERY" "$STATUS_FILE" | cut -d: -f2 | tr -d ' ')
GPS=$(grep "^GPS" "$STATUS_FILE" | cut -d: -f2 | tr -d ' ')
LIDAR=$(grep "^LIDAR" "$STATUS_FILE" | cut -d: -f2 | tr -d ' ')

echo "=================" | tee "$REPORT"
echo " NEBULA FLEET INCIDENT REPORT" | tee -a "$REPORT"
echo "=================" | tee -a "$REPORT"
echo "" | tee -a "$REPORT"
echo "Node:          $NODE" | tee -a "$REPORT"
echo "Status:        $STATUS" | tee -a "$REPORT"
echo "Battery:       $BATTERY" | tee -a "$REPORT"
echo "GPS:           $GPS" | tee -a "$REPORT"
echo "LIDAR:         $LIDAR" | tee -a "$REPORT"
echo "Detected:      $TIMESTAMP" | tee -a "$REPORT"
echo "Reported by: fleet-ops" | tee -a "$REPORT"

echo "[ INVESTIGATION ]" | tee -a "$REPORT"
echo " Node failed morning health check." | tee -a "$REPORT"
echo "  Status file reviewed - all sensors inactive." | tee -a "$REPORT"
echo " Escalated for hardware inspection." | tee -a "$REPORT"

echo "[ STATUS ]" | tee -a "$REPORT"
echo " Open - pending resolution" | tee -a "$REPORT"


echo "=================" | tee -a "$REPORT"
echo " Report saved: $REPORT" | tee -a "$REPORT"
echo "=================" | tee -a "$REPORT"