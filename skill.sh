#!/usr/bin/env bash
# Install Allergos into a project's .cursor/skills/allergos/
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SKILL_NAME="allergos"

usage() {
  cat <<EOF
Usage:
  ./skill.sh list
  ./skill.sh install /path/to/target/project

Installs: SKILL.md, references/, examples/, VERSION
  -> <target>/.cursor/skills/${SKILL_NAME}/
EOF
}

copy_skill() {
  local dest="$1"
  mkdir -p "${dest}"
  cp "${ROOT}/SKILL.md" "${ROOT}/VERSION" "${dest}/"
  rm -rf "${dest}/references" "${dest}/examples"
  cp -R "${ROOT}/references" "${dest}/references"
  cp -R "${ROOT}/examples" "${dest}/examples"
}

cmd="${1:-}"
case "$cmd" in
  list)
    echo "${SKILL_NAME} (v$(tr -d '\r\n' < "${ROOT}/VERSION"))"
    echo "  ${ROOT}/SKILL.md"
    echo "  references/: $(find "${ROOT}/references" -name '*.md' | wc -l | tr -d ' ') files"
    ;;
  install)
    target="${2:-}"
    if [[ -z "$target" ]]; then
      usage
      exit 1
    fi
    abs_target="$(cd "$target" && pwd)"
    dest="${abs_target}/.cursor/skills/${SKILL_NAME}"
    copy_skill "${dest}"
    echo "Installed Allergos to ${dest}"
    echo "Reload Cursor, then invoke: /${SKILL_NAME}"
    ;;
  *)
    usage
    exit 1
    ;;
esac
