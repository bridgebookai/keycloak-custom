#!/usr/bin/env bash

trap 'exit' ERR

echo ""
echo "----------------- keycloak_custom_config.sh ---------------"
echo ""

echo ""
echo "--- Assigning service account roles ---"
echo ""

# Assign manage-users role to postman-client service account
echo "Assigning manage-users role to postman-client service account..."
${KCADM} add-roles -r bridgebook \
  --uusername service-account-postman-client \
  --cclientid realm-management \
  --rolename manage-users \
  ${KCADM_CONFIG}

# Assign manage-users role to core-service-api service account  
echo "Assigning manage-users role to core-service-api service account..."
${KCADM} add-roles -r bridgebook \
  --uusername service-account-core-service-api \
  --cclientid realm-management \
  --rolename manage-users \
  ${KCADM_CONFIG}

echo "Service account role assignments completed."

echo ""
echo "--- Creating test Users ---"
echo ""

echo "Creating test users for the bridgebook realm"


