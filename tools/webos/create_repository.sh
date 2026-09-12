#!/usr/bin/env bash
set -euo pipefail

if [ "$#" -ne 4 ]; then
  echo "Usage: $0 OWNER/REPOSITORY TAG MANIFEST OUTPUT" >&2
  exit 2
fi

repository="$1"
tag="$2"
manifest_path="$3"
output_path="$4"

manifest_name="$(basename "$manifest_path")"
release_base="https://github.com/${repository}/releases/download/${tag}"
source_url="https://github.com/${repository}"
icon_url="https://raw.githubusercontent.com/${repository}/${tag}/deploy/webos/largeIcon.png"
ipk_name="$(jq -r '.ipkUrl' "$manifest_path" | xargs basename)"

jq \
  --arg source_url "$source_url" \
  --arg ipk_url "${release_base}/${ipk_name}" \
  --arg icon_url "$icon_url" \
  '.sourceUrl = $source_url | .ipkUrl = $ipk_url | .iconUri = $icon_url' \
  "$manifest_path" > "${manifest_path}.tmp"
mv "${manifest_path}.tmp" "$manifest_path"

jq -n \
  --arg manifest_url "${release_base}/${manifest_name}" \
  --arg icon_url "$icon_url" \
  '{packages: [{
    id: "fi.jukisto.ihsplay",
    title: "IHSplay Fixed",
    iconUri: $icon_url,
    manifestUrl: $manifest_url,
    shortDescription: "Steam Remote Play client with fixed webOS navigation and visible computer discovery status."
  }]}' > "$output_path"
