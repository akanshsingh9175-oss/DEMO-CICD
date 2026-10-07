#!/usr/bin/env bash
for f in index.html error.html; do
  [ -f "$f" ] || { echo "FAIL: $f is missing"; exit 1; }
  grep -qi "<!doctype html>" "$f" || { echo "FAIL: $f has no DOCTYPE"; exit 1; }
  grep -qi "<html" "$f"          || { echo "FAIL: $f has no <html>"; exit 1; }
  grep -qi "<title>" "$f"        || { echo "FAIL: $f has no <title>"; exit 1; }
  grep -qi "</html>" "$f"        || { echo "FAIL: $f has no </html>"; exit 1; }
  echo "PASS: $f"
done
echo "All tests passed"