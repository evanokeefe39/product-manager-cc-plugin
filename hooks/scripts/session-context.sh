#!/bin/bash
# Product Management session context hook
# Checks if a PM project exists and provides progress context on session start

CHECKLIST="product-management/checklist.md"

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
  # Check if this phase has incomplete tasks by looking between phase headers
  if grep -A 100 "^## ${PHASE_LETTER}\." "$CHECKLIST" 2>/dev/null | grep -q '^\- \[ \]'; then
    CURRENT_PHASE="$PHASE_LETTER"
    break
  fi
done

if [ -z "$CURRENT_PHASE" ]; then
  CURRENT_PHASE="Complete"
fi

# Output context as system message
cat <<EOF
{"systemMessage": "Product Management project detected. Progress: ${COMPLETED}/${TOTAL} tasks complete. Current phase: ${CURRENT_PHASE}. Use /pm:status for full dashboard or /pm:phase ${CURRENT_PHASE} to continue working."}
EOF
