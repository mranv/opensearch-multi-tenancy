#!/bin/bash

echo "Waiting for OpenSearch to be ready..."
until curl -s -k -u "admin:Admin123!@#456" https://localhost:9200/_cluster/health > /dev/null; do
    sleep 5
    echo "Still waiting..."
done

echo "OpenSearch is ready! Setting up tenants..."

# Create roles for each tenant
echo "Creating roles..."

# Tenant X Role
curl -k -X PUT "https://localhost:9200/_plugins/_security/api/roles/tenant_x_role" \
  -u "admin:Admin123!@#456" \
  -H 'Content-Type: application/json' \
  -d '{
    "cluster_permissions": ["cluster_composite_ops_ro"],
    "index_permissions": [{
      "index_patterns": ["tenant-x-*"],
      "allowed_actions": ["crud", "create_index"]
    }]
  }'

# Tenant Y Role
curl -k -X PUT "https://localhost:9200/_plugins/_security/api/roles/tenant_y_role" \
  -u "admin:Admin123!@#456" \
  -H 'Content-Type: application/json' \
  -d '{
    "cluster_permissions": ["cluster_composite_ops_ro"],
    "index_permissions": [{
      "index_patterns": ["tenant-y-*"],
      "allowed_actions": ["crud", "create_index"]
    }]
  }'

# Tenant Z Role
curl -k -X PUT "https://localhost:9200/_plugins/_security/api/roles/tenant_z_role" \
  -u "admin:Admin123!@#456" \
  -H 'Content-Type: application/json' \
  -d '{
    "cluster_permissions": ["cluster_composite_ops_ro"],
    "index_permissions": [{
      "index_patterns": ["tenant-z-*"],
      "allowed_actions": ["crud", "create_index"]
    }]
  }'

# Create users
echo "Creating users..."

# Tenant X User
curl -k -X PUT "https://localhost:9200/_plugins/_security/api/internalusers/tenant_x" \
  -u "admin:Admin123!@#456" \
  -H 'Content-Type: application/json' \
  -d '{
    "password": "TenantX123!@#",
    "roles": ["tenant_x_role"],
    "attributes": {
      "tenant": "x"
    }
  }'

# Tenant Y User
curl -k -X PUT "https://localhost:9200/_plugins/_security/api/internalusers/tenant_y" \
  -u "admin:Admin123!@#456" \
  -H 'Content-Type: application/json' \
  -d '{
    "password": "TenantY123!@#",
    "roles": ["tenant_y_role"],
    "attributes": {
      "tenant": "y"
    }
  }'

# Tenant Z User
curl -k -X PUT "https://localhost:9200/_plugins/_security/api/internalusers/tenant_z" \
  -u "admin:Admin123!@#456" \
  -H 'Content-Type: application/json' \
  -d '{
    "password": "TenantZ123!@#",
    "roles": ["tenant_z_role"],
    "attributes": {
      "tenant": "z"
    }
  }'

echo "Setup complete! Here are the credentials:"
echo "----------------------------------------"
echo "Admin:"
echo "  Username: admin"
echo "  Password: Admin123!@#456"
echo ""
echo "Tenant X:"
echo "  Username: tenant_x"
echo "  Password: TenantX123!@#"
echo ""
echo "Tenant Y:"
echo "  Username: tenant_y"
echo "  Password: TenantY123!@#"
echo ""
echo "Tenant Z:"
echo "  Username: tenant_z"
echo "  Password: TenantZ123!@#"
echo "----------------------------------------"