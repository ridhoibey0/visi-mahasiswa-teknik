#!/usr/bin/env bash
set -euo pipefail

INPUT="diagrams/mindmap-visi-mahasiswa-teknik.mmd"
OUTDIR="assets"
mkdir -p "$OUTDIR"

# Render ke PNG (untuk preview cepat)
npx --yes @mermaid-js/mermaid-cli -i "$INPUT" -o "$OUTDIR/mindmap-visi-mahasiswa-teknik.png" -s 1.0 -p .puppeteer.json -c .mermaid-config.json

# Konversi ke JPG (untuk submission tugas)
convert "$OUTDIR/mindmap-visi-mahasiswa-teknik.png" -background white -flatten -quality 92 "$OUTDIR/mindmap-visi-mahasiswa-teknik.jpg"

# Render ke SVG (untuk diedit di Figma)
npx --yes @mermaid-js/mermaid-cli -i "$INPUT" -o "$OUTDIR/mindmap-visi-mahasiswa-teknik.svg" -s 1.0 -p .puppeteer.json -c .mermaid-config.json

echo "Gambar berhasil dibuat:"
ls -lah "$OUTDIR"/mindmap-visi-mahasiswa-teknik.*