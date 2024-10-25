# OpenSearch Multi-Tenancy Setup

A production-ready OpenSearch deployment with secure multi-tenant isolation and comprehensive testing capabilities.

## Features

- **Multi-Tenant Architecture**
  - Separate secure spaces for tenants X, Y, and Z
  - Complete data isolation between tenants
  - Role-based access control

- **Security**
  - SSL/TLS encryption
  - Basic authentication
  - Role-based authorization
  - Cross-tenant access prevention

- **Container Deployment**
  - Docker Compose setup
  - OpenSearch single-node configuration
  - OpenSearch Dashboards integration

- **Testing Suite**
  - Complete Postman collection
  - Admin operations
  - Per-tenant CRUD operations
  - Security boundary tests

## Prerequisites

- Docker 20.10+
- Docker Compose 2.0+
- Postman (for testing)
- curl (for setup script)

## Quick Start

1. Clone the repository:
```bash
git clone https://github.com/yourusername/opensearch-multi-tenancy.git
cd opensearch-multi-tenancy
```

2. Start the containers:
```bash
docker-compose up -d
```

3. Run the setup script:
```bash
chmod +x setup-tenants.sh
./setup-tenants.sh
```

4. Import the Postman collection:
- Open Postman
- Import `opensearch_collection.json`
- Disable SSL verification in Settings

## Configuration

### Directory Structure
```
.
├── config/
│   ├── internal_users.yml
│   ├── opensearch.yml
│   ├── roles_mapping.yml
│   └── roles.yml
├── docker-compose.yml
├── opensearch_collection.json
└── setup-tenants.sh
```

### Credentials

- **Admin**
  - Username: `admin`
  - Password: `Admin123!@#456`

- **Tenant X**
  - Username: `tenant_x`
  - Password: `TenantX123!@#`

- **Tenant Y**
  - Username: `tenant_y`
  - Password: `TenantY123!@#`

- **Tenant Z**
  - Username: `tenant_z`
  - Password: `TenantZ123!@#`

## Testing

The Postman collection includes tests for:
1. Admin Operations
   - Cluster health check
   - Index listing
2. Tenant X Operations
   - Index creation
   - Document addition
   - Search operations
3. Tenant Y Operations
   - Similar operations as Tenant X
4. Tenant Z Operations
   - Similar operations as Tenant X
5. Cross-Tenant Tests
   - Verification of tenant isolation

## Security Considerations

- Change all passwords in production
- Use proper SSL certificates
- Adjust memory settings based on your needs
- Review and adjust role permissions

## Maintenance

To reset the setup:
```bash
docker-compose down -v
docker-compose up -d
./setup-tenants.sh
```

## Contributing

1. Fork the repository
2. Create your feature branch
3. Commit your changes
4. Push to the branch
5. Create a Pull Request

## License

This project is licensed under the MIT License - see the LICENSE file for details.