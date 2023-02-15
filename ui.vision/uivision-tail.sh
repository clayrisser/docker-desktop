#!/bin/sh

tail --quiet -f -n0 $1/*.txt 2>/dev/null &
inotifywait -m "$1" -e create 2>/dev/null | while read path action file; do
  ext=$(echo "$file" | sed -e 's|.*\.||')
  if [ "$action" = "CREATE" ] && [ "$ext" = "txt" ]; then
    tail --quiet -f "$path/$file" 2>/dev/null &
  fi
done
