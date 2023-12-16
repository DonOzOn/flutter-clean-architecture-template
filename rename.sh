#!/usr/bin/env sh

bundle_id="com.donozon.template"
name="Flutter Template"

GREEN=$(tput setaf 2)
RESET=$(tput sgr0)

echo ""
echo "Bundle ID will change to: ${GREEN}${bundle_id}${RESET}";
echo "App name will change to: ${GREEN}${name}${RESET}";
echo ""
flutter pub global run rename setBundleId --value "$bundle_id" --targets ios,android
flutter pub global run rename setAppName  --value "$name" --targets ios,android