#!/bin/bash
# Nebula Fleet - Node Status Enrichment
# Combines node status CSV with log counts per node

NODES=("AV-01" "AV-02" "AV-03" "AV-04")
NODE_DIR=~/nebulafleet/fleet-server/nodes
INPUT=~/nebulafleet/data-pipeline/processed/node_status_2026-05-28.csv
OUTPUT_DIR=~/nebulafleet/data-pipeline/processed
OUTPUT="$OUTPUT_DIR/node_enriched_$(date '+%Y-%m-%d').csv"

mkdir -p "$OUTPUT_DIR"
echo "node,node_status,battery,gps,lidar,log_count,timestamp" > "$OUTPUT"

while IFS="," read -r node node_status battery gps lidar timestamp; do
if [ "$node" = "node" ]; then
continue
fi

LOG_COUNT=$(find "$NODE_DIR/$node/logs" -type f | wc -l | tr -d ' ')
echo "$node,$node_status,$battery,$gps,$lidar,$LOG_COUNT,$(date '+%Y-%m-%d %H:%M:%S')" >> "$OUTPUT"
done < "$INPUT"

echo "=============================="
echo " Enrichment complete"
echo " Saved: $OUTPUT"
echo "=============================="