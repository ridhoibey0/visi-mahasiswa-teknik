#!/usr/bin/env bash
set -euo pipefail

INPUT="diagrams/mindmap-visi-mahasiswa-teknik.mmd"
OUTDIR="assets"
mkdir -p "$OUTDIR"

# Render ke PNG
npx --yes @mermaid-js/mermaid-cli -i "$INPUT" -o "$OUTDIR/mindmap-visi-mahasiswa-teknik.png" -s 1.0 -p .puppeteer.json

# Konversi ke JPG (latar putih)
convert "$OUTDIR/mindmap-visi-mahasiswa-teknik.png" -background white -flatten -quality 92 "$OUTDIR/mindmap-visi-mahasiswa-teknik.jpg"

echo "Gambar berhasil dibuat:"
ls -lah "$OUTDIR"/mindmap-visi-mahasiswa-teknik.*
