#!/bin/bash
#
# create.sh
#

set -eu

SCRIPT_DIR=$(cd "$(dirname "$0")" || exit; pwd)
ROOT_DIR=$(dirname "${SCRIPT_DIR}")
DOWNLOADED_DIR="${ROOT_DIR}"/data/downloaded

CREATED_DIR="${ROOT_DIR}"/data/created
[ -d "${CREATED_DIR}" ] || mkdir -p "${CREATED_DIR}"


echo '薬効分類コード,薬効分類名' >"${CREATED_DIR}"/master.csv
nkf -Luw "${DOWNLOADED_DIR}"/FEK_download.csv |
    tr -d '"' |
    grep '^87' |
    tail -n +2 |
    sed 's/^87//' |
    cut -d, -f 1,2 >>"${CREATED_DIR}"/master.csv

exit 0

