#!/bin/bash
# Sort resources, components, and bases lists in all kustomization.yaml files alphabetically

set -e

echo "Sorting kustomization.yaml files alphabetically..."
echo

sorted_count=0
total_count=0

# Function to add blank lines before major sections
add_section_spacing() {
  local file="$1"
  local tmpfile="${file}.tmp"

  awk '
    BEGIN { prev_blank = 0; in_header = 0; seen_kind = 0 }

    # Track apiVersion and kind (header section)
    /^apiVersion:/ { in_header = 1; print; next }
    /^kind:/ { seen_kind = 1; print; next }

    # Major section keywords - add blank line before them if not already present
    /^(resources|components|bases|patches|replacements|configMapGenerator|secretGenerator|commonAnnotations|commonLabels|namespace|images|replicas|namePrefix|nameSuffix|vars|patchesStrategicMerge|patchesJson6902):/ {
      # Add blank line before section if previous line was not blank
      if (!prev_blank) {
        print ""
      }
      prev_blank = 0
      print
      next
    }

    # Track blank lines
    /^[[:space:]]*$/ { prev_blank = 1; print; next }

    # Any other line
    { prev_blank = 0; print }
  ' "$file" > "$tmpfile"

  mv "$tmpfile" "$file"
}

for file in $(find . -name "kustomization.yaml" -type f); do
  total_count=$((total_count + 1))

  # Check if file has yq-sortable lists
  has_resources=$(yq -e '.resources' "$file" >/dev/null 2>&1 && echo "yes" || echo "no")
  has_components=$(yq -e '.components' "$file" >/dev/null 2>&1 && echo "yes" || echo "no")
  has_bases=$(yq -e '.bases' "$file" >/dev/null 2>&1 && echo "yes" || echo "no")

  if [ "$has_resources" = "yes" ] || [ "$has_components" = "yes" ] || [ "$has_bases" = "yes" ]; then
    echo "Processing: $file"

    # Sort resources if present
    if [ "$has_resources" = "yes" ]; then
      yq -i '.resources |= sort' "$file"
      echo "  ✅ Sorted .resources"
    fi

    # Sort components if present
    if [ "$has_components" = "yes" ]; then
      yq -i '.components |= sort' "$file"
      echo "  ✅ Sorted .components"
    fi

    # Sort bases if present (deprecated but some may still use it)
    if [ "$has_bases" = "yes" ]; then
      yq -i '.bases |= sort' "$file"
      echo "  ✅ Sorted .bases"
    fi

    # Add blank lines between sections for readability
    add_section_spacing "$file"
    echo "  ✅ Added section spacing"

    sorted_count=$((sorted_count + 1))
    echo
  fi
done

echo "================================"
echo "Summary:"
echo "  Total kustomization.yaml files: $total_count"
echo "  Files sorted: $sorted_count"
echo "  Files skipped (no sortable lists): $((total_count - sorted_count))"
echo "================================"
echo
echo "✅ Done! Run 'git diff' to see changes."
