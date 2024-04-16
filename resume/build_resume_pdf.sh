#!/bin/bash

# Build HTML from Markdown (delete first three lines containing Jekyll header from index.md).
pandoc -o resume.html -f gfm resume_head.md <(sed '1,3d' ../index.md)

# Compile SCSS to CSS.
sass resume.scss resume.css

# Inject latest update into CSS.
latest_update=$(grep latest_update: ../_config.yml | sed 's/latest_update: //' | tr -d '"') 
sed -i "s/latest update: <latest_update>/latest update: $latest_update/" resume.css

# Build PDF from HTML styled with CSS.
weasyprint resume.html ../assets/resume.pdf -s resume.css