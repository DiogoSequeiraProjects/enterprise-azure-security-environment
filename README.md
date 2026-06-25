# Enterprise Azure Security Environment

![Azure](https://img.shields.io/badge/Cloud-Microsoft%20Azure-0078D4?logo=microsoftazure\&logoColor=white)
![Terraform](https://img.shields.io/badge/IaC-Terraform-623CE4?logo=terraform\&logoColor=white)
![Security](https://img.shields.io/badge/Security-Enterprise-success)
![License](https://img.shields.io/badge/License-MIT-green)
![Status](https://img.shields.io/badge/Status-Completed-brightgreen)

Enterprise-inspired Azure cloud environment implementing secure networking, governance, monitoring, and Infrastructure as Code following Microsoft best practices.

---

# Project Overview

This project demonstrates the design and implementation of a secure Azure environment based on enterprise cloud architecture principles.

The objective was to build a production-inspired Azure Landing Zone using only Azure Free Tier services while applying security, governance, networking, monitoring, and Infrastructure as Code best practices.

Rather than deploying workloads, the focus is on creating a secure cloud foundation suitable for future enterprise applications.

---

# Objectives

* Design an enterprise-style Azure environment.
* Implement Hub-and-Spoke networking.
* Apply Zero Trust principles.
* Enforce governance with Azure Policy.
* Protect resources using RBAC.
* Secure secrets with Azure Key Vault.
* Restrict public exposure using Private Endpoints.
* Centralize monitoring with Azure Monitor and Log Analytics.
* Demonstrate Infrastructure as Code using Terraform.
* Maintain comprehensive technical documentation.

---

# Architecture

```
Azure Subscription
│
├── rg-enterprise-network
├── rg-enterprise-security
├── rg-enterprise-monitoring
├── rg-enterprise-identity
├── rg-enterprise-dev
└── rg-enterprise-prod
```

Networking follows a Hub-and-Spoke topology.

```
                    Hub VNet
          ┌────────────┼────────────┐
          │            │            │
   Management     Shared Services   Security
          │
      VNet Peering
      ┌───────────────┐
      │               │
  DEV VNet       PROD VNet
  App | Data     App | Data
```

---

# Azure Services Implemented

| Category               | Services                                                                           |
| ---------------------- | ---------------------------------------------------------------------------------- |
| Networking             | Virtual Networks, Subnets, VNet Peering, NSGs, Route Tables                        |
| Identity               | Azure RBAC, Managed Identity                                                       |
| Governance             | Azure Policy, Resource Locks, Tags                                                 |
| Security               | Azure Key Vault, Private Endpoint, Private DNS Zone                                |
| Monitoring             | Azure Monitor, Log Analytics Workspace, Diagnostic Settings, Alerts, Action Groups |
| Cost Management        | Budget, Cost Analysis                                                              |
| Infrastructure as Code | Terraform                                                                          |

---

# Security Controls

The project implements multiple layers of security following Microsoft's Defense-in-Depth strategy.

Implemented controls include:

* Role-Based Access Control (RBAC)
* Principle of Least Privilege
* Azure Policy
* Resource Locks
* Hub-and-Spoke Network Segmentation
* Network Security Groups
* Route Tables
* Azure Key Vault
* Managed Identity
* Private Endpoints
* Private DNS Zones
* Azure Monitor
* Log Analytics Workspace
* Diagnostic Settings
* Azure Monitor Alerts
* Cost Management

---

# Networking Design

The environment follows a Hub-and-Spoke architecture.

### Hub Network

* Shared Services
* Security Resources
* Centralized Management

### Development Network

* Application Subnet
* Data Subnet

### Production Network

* Application Subnet
* Data Subnet

Benefits:

* Network Isolation
* Reduced Attack Surface
* Scalability
* Easier Governance

---

# Identity & Access Management

Identity security is implemented using Azure RBAC.

The environment follows the Principle of Least Privilege, ensuring users receive only the permissions required to perform their responsibilities.

Sensitive resources such as Azure Key Vault are protected using Azure RBAC together with Private Endpoints.

---

# Governance

Governance controls include:

* Azure Policy
* Required Resource Tags
* Allowed Azure Region
* Resource Locks
* Cost Management
* Budget Monitoring

These controls help maintain consistency while reducing configuration drift and operational risk.

---

# Monitoring

Monitoring capabilities include:

* Azure Monitor
* Log Analytics Workspace
* Diagnostic Settings
* Azure Activity Logs
* Azure Monitor Alerts
* Action Groups

These services provide centralized operational visibility and prepare the environment for future security monitoring.

---

# Cost Management

The project was intentionally designed around Azure Free Tier services.

Cost optimization includes:

* Azure Budget
* Cost Analysis
* Resource Planning
* Governance Controls

The objective was to maintain cloud costs close to zero while implementing enterprise architecture concepts.

---

# Infrastructure as Code

Terraform provides the foundation for Infrastructure as Code.

Current structure:

```text
terraform/
│
├── provider.tf
├── versions.tf
├── variables.tf
├── outputs.tf
├── main.tf
└── terraform.tfvars.example
```

Future versions will introduce reusable Terraform modules and automated deployment pipelines.

---

# Repository Structure

```text
enterprise-azure-security-environment
│
├── README.md
├── docs/
├── architecture/
├── report/
├── terraform/
└── .github/
```

---

# Skills Demonstrated

## Cloud

* Microsoft Azure
* Azure Resource Management
* Azure Governance

## Networking

* Hub-and-Spoke Architecture
* Virtual Networks
* Network Security Groups
* Route Tables
* Private Networking

## Security

* Azure RBAC
* Azure Policy
* Azure Key Vault
* Managed Identity
* Private Endpoints
* Defense in Depth
* Zero Trust

## Monitoring

* Azure Monitor
* Log Analytics
* Alert Rules
* Diagnostic Settings

## DevOps

* Terraform
* Infrastructure as Code
* Git
* GitHub

---

# Project Documentation

Detailed documentation is available in the **docs/** directory.

Included documents:

* Project Overview
* Security Controls
* Cost Control
* Lessons Learned
* Future Improvements

A complete technical report with implementation details, diagrams, and configuration screenshots is also included in the **report/** directory.

---

# Future Improvements

Planned enhancements include:

* Azure Firewall Premium
* Microsoft Sentinel
* Azure Bastion
* Microsoft Entra PIM
* Conditional Access
* GitHub Actions CI/CD
* Terraform Modules
* Checkov Security Scanning
* Azure Virtual WAN
* Multi-Subscription Landing Zone

---

# Key Takeaways

This project demonstrates how Microsoft Azure can be used to build a secure, well-governed, and scalable cloud foundation while remaining within Azure Free Tier limitations.

It combines cloud architecture, security, networking, governance, monitoring, and Infrastructure as Code into a single enterprise-inspired environment that reflects modern Cloud Security Engineering practices.

---

# Author

**Diogo Sequeira**

Computer Engineering Student | Cloud Security Enthusiast

Focused on Azure Security, Cloud Governance, Infrastructure Security and DevSecOps.

---

# License

This project is released under the MIT License.
