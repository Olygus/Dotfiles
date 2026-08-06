#!/usr/bin/env bash
set -euo pipefail

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
config_home="${XDG_CONFIG_HOME:-$HOME/.config}"
package_file="$script_dir/apps.md"

install_packages() {
  if [[ ! -f "$package_file" ]]; then
    echo "Missing package list: $package_file" >&2
    exit 1
  fi

  if command -v yay >/dev/null 2>&1; then
    helper="yay"
  elif command -v paru >/dev/null 2>&1; then
    helper="paru"
  else
    echo "Install yay or paru first, then rerun this script." >&2
    exit 1
  fi

  mapfile -t packages < <(
    awk '{print $1}' "$package_file" | sed '/^$/d' | sort -u
  )

  "$helper" -Syu --needed --noconfirm "${packages[@]}"
}

sync_configs() {
  if [[ "$script_dir" == "$config_home" ]]; then
    echo "Config source already lives in $config_home; skipping copy step."
    return
  fi

  mkdir -p "$config_home"

  while IFS= read -r -d '' item; do
    cp -a "$item" "$config_home"/
  done < <(
    find "$script_dir" -mindepth 1 -maxdepth 1 \
      \( -name '.git' -o -name '.gitignore' -o -name 'apps.md' -o -name 'setup.sh' -o -name 'school.html' \) -prune -o -print0
  )
}

main() {
  install_packages
  sync_configs
}

main "$@"