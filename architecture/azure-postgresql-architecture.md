# Azure PostgreSQL Architecture

## Overview

This project demonstrates the deployment and administration of a secure PostgreSQL environment on Microsoft Azure using private networking and cloud infrastructure best practices.

---

## Infrastructure Components

### Resource Group
- rg-cloud-dba-lab

### Networking
- Virtual Network: vnet-cloud-dba
- public-subnet: 10.0.1.0/24
- private-db-subnet: 10.0.2.0/24

### Database
- Azure PostgreSQL Flexible Server
- PostgreSQL 16
- Private access enabled
- Azure managed backups

### Administration
- Azure CLI
- pgAdmin
- GitHub repository

---

## Security

- Private subnet isolation
- Restricted database access
- MFA enabled
- Secure PostgreSQL authentication

---

## Objectives

- Build secure cloud database environments
- Practice PostgreSQL cloud administration
- Learn platform engineering concepts
- Prepare Infrastructure as Code with Terraform