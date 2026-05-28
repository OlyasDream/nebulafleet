#!/bin/bash
# NebulaFleet — Node Status CSV Export
# Reads node status files and outputs structured CSV data

NODES=("AV-01" "AV-02" "AV-03" "AV-04")
NODE_DIR=~/nebulafleet/fleet-server/nodes
OUTPUT_DIR=~/nebulafleet/data-pipeline/processed
OUTPUT="$OUTPUT_DIR/node_status_$(date '+%Y-%m-%d').csv"

mkdir -p "$OUTPUT_DIR"

echo "node,status,battery,gps,lidar,timestamp" > "$OUTPUT"

for node in "${NODES[@]}"; do
STATUS_FILE="$NODE_DIR/$node/status.txt"

if [ ! -f "$STATUS_FILE" ]; then
echo "$node,MISSING,NULL,NULL,NULL,$(date '+%Y-%m-%d %H:%M:%S')" >> "$OUTPUT"
continue
fi

STATUS=$(grep "^STATUS" "$STATUS_FILE" | cut -d: -f2 | tr -d ' ')
BATTERY=$(grep "^BATTERY" "$STATUS_FILE" | cut -d: -f2 | tr -d ' ')
GPS=$(grep "^GPS" "$STATUS_FILE" | cut -d: -f2 | tr -d ' ')
LIDAR=$(grep "^LIDAR" "$STATUS_FILE" | cut -d: -f2 | tr -d ' ')
TIMESTAMP=$(date '+%Y-%m-%d %H:%M:%S')

echo "$node,$STATUS,$BATTERY,$GPS,$LIDAR,$TIMESTAMP" >> "$OUTPUT"

done

echo "=============================="
echo " NODE EXPORT COMPLETE"
echo " $(wc -l < "$OUTPUT") rows written"
echo " Saved: $OUTPUT"
echo "=============================="