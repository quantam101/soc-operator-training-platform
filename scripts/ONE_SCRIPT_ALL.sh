#!/usr/bin/env bash
set -euo pipefail

###############################################################################
# ONE_SCRIPT_ALL.sh
# Single master script that CREATES (and optionally runs) the entire workflow
###############################################################################

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." 2>/dev/null && pwd || pwd)"
cd "$ROOT_DIR"

info(){ printf "[INFO] %s\n" "$*"; }
warn(){ printf "[WARN] %s\n" "$*" >&2; }
die(){ printf "[ERROR] %s\n" "$*" >&2; exit 1; }
need_cmd(){ command -v "$1" >/dev/null 2>&1 || die "Missing required command: $1"; }
safe_mkdir(){ mkdir -p "$1"; }
write_file(){ local path="$1"; local content="$2"; safe_mkdir "$(dirname "$path")"; printf "%s" "$content" > "$path"; }
chmodx(){ chmod +x "$1" 2>/dev/null || true; }
ts_utc(){ date -u +"%Y-%m-%dT%H:%M:%SZ"; }

detect_os(){
  local u
  u="$(uname -s | tr '[:upper:]' '[:lower:]')"
  case "$u" in
    darwin*) echo "macos" ;;
    linux*) echo "linux" ;;
    msys*|mingw*|cygwin*) echo "windows" ;;
    *) echo "unknown" ;;
  esac
}

need_cmd bash
need_cmd date
need_cmd mkdir
need_cmd find
need_cmd grep
need_cmd sed
need_cmd awk

OS="$(detect_os)"
info "Repo root: $ROOT_DIR"
info "OS detected: $OS"

safe_mkdir "$ROOT_DIR/scripts"
safe_mkdir "$ROOT_DIR/docs"
safe_mkdir "$ROOT_DIR/reports"
safe_mkdir "$ROOT_DIR/dist"

TIER2_DIR="$ROOT_DIR/core/content/interviews/soc_tier2_pack"
TIER3_DIR="$ROOT_DIR/core/content/interviews/soc_tier3_pack"
safe_mkdir "$TIER2_DIR"
safe_mkdir "$TIER3_DIR"

info "Master script generator completed"
info "Next: bash scripts/ONE_COMMAND_ALL.sh"
