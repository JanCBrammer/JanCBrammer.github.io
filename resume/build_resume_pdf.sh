#!/bin/bash

# Build html from Markdown (delete first three lines containing Jekyll header from index.md).
pandoc -o resume.html -f gfm -s resume_head.md <(sed '1,3d' ../index.md) --metadata title="Jan C. Brammer"

# compile SCSS to SCC
sass resume.scss resume.css

# Build pdf from html styled with css.
weasyprint resume.html resume.pdf -s resume.css