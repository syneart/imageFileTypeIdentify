#!/bin/sh
#https://www.syneart.com
#v1.0 (20180324) by Syneart
shopt -s nocasematch

echo Calculate Files Count ...

IFS=$'\n'
FILES=($(find $1 -type f -exec echo {} \;))
FILE_CNT=${#FILES[@]}

for (( FILE_INDEX=0; FILE_INDEX<${FILE_CNT}; FILE_INDEX++ )); do
    FILE=${FILES[${FILE_INDEX}]}
    FILE_NAME=${FILE%.[^.]*}
    FILE_EXT=${FILE##*.}

    CORRECT_EXT=`./imageFileTypeIdentify ${FILE} 2>null`
    if [ -z "${CORRECT_EXT}" ]; then continue; fi
    echo \($((${FILE_INDEX}+1)) of ${FILE_CNT}\) [${CORRECT_EXT}] \"${FILE}\"
    if [[ "${CORRECT_EXT}" != "${FILE_EXT}" ]] ; then
        CORRECT_EXT=`echo ${CORRECT_EXT} | tr '[:upper:]' '[:lower:]'`
        echo RENAME \"${FILE}\" -\> \"${FILE_NAME}.${CORRECT_EXT}\"
        mv "${FILE}" "${FILE_NAME}.${CORRECT_EXT}"
    fi
done

echo -e "\nAll Finish ~"
exit
