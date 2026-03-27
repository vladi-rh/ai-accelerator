#!/bin/bash
# Sort resources, components, and bases lists in all kustomization.yaml files alphabetically

set -e

echo "Sorting kustomization.yaml files alphabetically..."
echo

sorted_count=0
total_count=0

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
