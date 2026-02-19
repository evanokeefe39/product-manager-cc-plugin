#!/bin/bash
# Product Management session context hook
# Checks if a PM project exists and provides progress context on session start

CHECKLIST="product-management/checklist.md"
CLAUDEMD="CLAUDE.md"

if [ ! -f "$CHECKLIST" ]; then
  # No PM project initialized - stay silent
  exit 0
fi

# Count completed and total tasks
COMPLETED=$(grep -c '^\- \[x\]' "$CHECKLIST" 2>/dev/null || echo "0")
TOTAL=$(grep -c '^\- \[' "$CHECKLIST" 2>/dev/null || echo "166")

# Find current phase (first phase with incomplete tasks)
CURRENT_PHASE=""
for PHASE_LETTER in A B C D E F G H I J K L M; do
  # Use awk to extract only lines within this phase section, then check for incomplete tasks
  if awk "/^## ${PHASE_LETTER}\./,/^## [A-M]\./" "$CHECKLIST" 2>/dev/null | grep -q '^\- \[ \]'; then
    CURRENT_PHASE="$PHASE_LETTER"
    break
  fi
done

if [ -z "$CURRENT_PHASE" ]; then
  CURRENT_PHASE="Complete"
fi

# Check CLAUDE.md for configured tool preferences
TOOLS_MSG=""
if [ -f "$CLAUDEMD" ]; then
  DOC_TOOL=$(grep -i '^\- \*\*Documentation\*\*:' "$CLAUDEMD" 2>/dev/null | sed 's/.*: //' | head -1)
  TASK_TOOL=$(grep -i '^\- \*\*Task Tracking\*\*:' "$CLAUDEMD" 2>/dev/null | sed 's/.*: //' | head -1)
  ANALYTICS_TOOL=$(grep -i '^\- \*\*Analytics\*\*:' "$CLAUDEMD" 2>/dev/null | sed 's/.*: //' | head -1)

  if [ -n "$DOC_TOOL" ] || [ -n "$TASK_TOOL" ] || [ -n "$ANALYTICS_TOOL" ]; then
    TOOLS_MSG=" Tools:"
    [ -n "$DOC_TOOL" ] && TOOLS_MSG="${TOOLS_MSG} Documentation: ${DOC_TOOL}."
    [ -n "$TASK_TOOL" ] && TOOLS_MSG="${TOOLS_MSG} Task Tracking: ${TASK_TOOL}."
    [ -n "$ANALYTICS_TOOL" ] && TOOLS_MSG="${TOOLS_MSG} Analytics: ${ANALYTICS_TOOL}."
  fi
fi

# Output context as system message
cat <<EOF
{"systemMessage": "Product Management project detected. Progress: ${COMPLETED}/${TOTAL} tasks complete. Current phase: ${CURRENT_PHASE}.${TOOLS_MSG} Use /pm:status for full dashboard or /pm:phase ${CURRENT_PHASE} to continue working."}
EOF
