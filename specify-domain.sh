#!/bin/sh -e

if [[ -z "${domain}" ]]; then
  echo "Environment variable of domain not found. Use sit as default."
  DOMAIN="sit"
else
  DOMAIN="${domain}"
fi

if [[ -z "${app_base}" ]]; then
  echo "Environment variable of app_base not found. Use sit as default."
  APP_BASE="/home/zyb/apache-tomcat-6.0.53/webapps/intm"
else
  APP_BASE="${app_base}"
fi

echo "Domain=${DOMAIN}"

SRC="${APP_BASE}/WEB-INF/config/${DOMAIN}"
DES="${APP_BASE}/WEB-INF/classes"

if [ ! -d "$SRC" ]; then
  echo "Error: ${SRC} not found. Can not continue."
  exit 1
fi

if [ ! -d "$DES" ]; then
  echo "Error: ${DES} not found. Can not continue."
  exit 1
fi

cp -f -v "${SRC}"/* "${DES}"