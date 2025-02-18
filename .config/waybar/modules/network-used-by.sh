#!/bin/bash
allPrograms=$(lsof -P -i -n -T | cut  -f 1 -d " " | tail -n +2)

if [ -z "${allPrograms}" ]; then
    echo ""
    exit
fi

uniquePrograms=$(echo "$allPrograms" | uniq)
programCount=$(echo "$uniquePrograms" | wc -l)

tooltip=""
for program in $uniquePrograms; do
    programUsage=$(echo "$allPrograms" | grep $program | wc -l)
    tooltip+="$program $programUsage\r"
done
tooltip=${tooltip%??}
tooltip=$(echo $tooltip | sed -r 's/\\r/\r/g')

jq -cnM --arg text $programCount --arg tooltip "$tooltip" '{("text"): $text, ("tooltip"): $tooltip}'
