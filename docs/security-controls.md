# Security Controls

# Introduction

Security is the foundation of this project. Every Azure resource was deployed with the objective of reducing the attack surface, enforcing governance, protecting sensitive information, and following Microsoft's cloud security best practices.

Rather than relying on a single security mechanism, the environment adopts a **Defense-in-Depth** strategy, where multiple independent security controls work together to protect cloud resources.

The implemented controls align with widely accepted security principles such as Least Privilege, Zero Trust, Segmentation, Secure by Default, and Continuous Monitoring.

---

# Security Architecture

The environment was designed around several security layers.

```
Identity Security
        │
        ▼
Governance Controls
        │
        ▼
Network Segmentation
        │
        ▼
Private Connectivity
        │
        ▼
Secrets Protection
        │
        ▼
Monitoring & Logging
```

Each layer provides independent protection, significantly reducing the likelihood of unauthorized access or accidental exposure.

---

# Role-Based Access Control (RBAC)

## Purpose

Azure Role-Based Access Control (RBAC) provides fine-grained authorization to Azure resources.

Instead of granting broad administrative permissions, users receive only the minimum level of access required to perform their responsibilities.

This follows the **Principle of Least Privilege**, one of the most important concepts in cloud security.

---

## Implementation

The project uses Azure RBAC assignments to restrict access to critical resources.

Permissions are assigned through Azure's native role definitions rather than using unrestricted Owner or Contributor access wherever unnecessary.

---

## Security Benefits

* Prevents privilege escalation
* Reduces insider threats
* Limits accidental configuration changes
* Simplifies permission auditing
* Supports enterprise governance

---

# Azure Policy

## Purpose

Azure Policy enforces organizational standards across Azure resources.

Policies automatically evaluate resource configurations and help prevent deployments that do not comply with organizational requirements.

---

## Implemented Policies

Examples include:

* Required resource tags
* Allowed deployment locations
* Resource compliance evaluation

---

## Security Benefits

* Standardized deployments
* Compliance enforcement
* Reduced configuration drift
* Governance automation
* Continuous policy evaluation

---

# Resource Locks

## Purpose

Resource Locks prevent accidental deletion or modification of critical cloud resources.

Two lock types are available:

* Delete
* Read-only

The project implements resource protection to reduce operational risks.

---

## Security Benefits

* Prevents accidental deletion
* Protects production resources
* Reduces human error
* Improves operational resilience

---

# Network Segmentation

## Purpose

Network segmentation isolates workloads into dedicated network boundaries.

The project follows a Hub-and-Spoke architecture where Development and Production environments remain logically separated.

---

## Implemented Components

* Hub Virtual Network
* Development Virtual Network
* Production Virtual Network
* Dedicated Subnets
* VNet Peering

---

## Security Benefits

* Reduced attack surface
* Improved traffic isolation
* Better scalability
* Easier access management
* Enterprise-ready architecture

---

# Network Security Groups (NSGs)

## Purpose

Network Security Groups act as stateful packet filtering firewalls at subnet level.

Only explicitly permitted traffic is allowed.

All other traffic is implicitly denied.

---

## Implemented Rules

The project includes custom rules allowing only required communication between selected subnets.

Examples include:

* HTTPS traffic
* Application-to-Database communication
* Restricted management traffic

---

## Security Benefits

* Traffic filtering
* Lateral movement reduction
* Micro-segmentation
* Controlled network access
* Reduced attack surface

---

# Route Tables

## Purpose

User Defined Routes (UDRs) control how network traffic flows inside Azure.

Although this project does not implement Azure Firewall, Route Tables were prepared to support future centralized inspection.

---

## Security Benefits

* Predictable routing
* Centralized traffic management
* Future firewall integration
* Enterprise scalability

---

# Azure Key Vault

## Purpose

Azure Key Vault securely stores secrets, credentials, and sensitive configuration data.

Applications retrieve secrets dynamically instead of storing them inside code or configuration files.

---

## Implemented Features

* Secure Secret Storage
* Azure RBAC
* Private Endpoint
* Private DNS Integration

---

## Security Benefits

* Secret centralization
* Encryption at rest
* Reduced credential exposure
* Secure application authentication

---

# Private Endpoint

## Purpose

Private Endpoints allow Azure services to be accessed using private IP addresses inside Virtual Networks.

The project prevents public network access to the Key Vault.

---

## Security Benefits

* Eliminates public exposure
* Protects sensitive services
* Supports Zero Trust
* Private network communication

---

# Private DNS Zone

## Purpose

Private DNS enables resources inside Virtual Networks to resolve Azure services to private IP addresses.

Without Private DNS, applications would continue using public endpoints.

---

## Security Benefits

* Transparent private connectivity
* Simplified DNS management
* Secure name resolution

---

# Managed Identity

## Purpose

Managed Identity eliminates the need to store credentials inside applications.

Azure automatically manages authentication between supported services.

---

## Security Benefits

* No stored passwords
* Automatic credential rotation
* Reduced secret management
* Improved application security

---

# Azure Monitor

## Purpose

Azure Monitor provides centralized visibility into the cloud environment.

Operational events can be collected, analyzed, and used to trigger alerts.

---

## Implemented Components

* Azure Monitor
* Log Analytics Workspace
* Diagnostic Settings
* Azure Activity Logs
* Alert Rules
* Action Groups

---

## Security Benefits

* Continuous monitoring
* Faster incident detection
* Operational visibility
* Centralized log collection

---

# Log Analytics Workspace

## Purpose

Log Analytics centralizes Azure platform logs for investigation and troubleshooting.

It serves as the foundation for future security monitoring and incident response.

---

## Security Benefits

* Centralized log storage
* Query-based investigations
* Historical analysis
* Security event visibility

---

# Cost Management

## Purpose

Cloud security also includes financial governance.

Unexpected resource creation can generate unnecessary costs.

The environment includes:

* Budget
* Cost Analysis
* Spending visibility

---

## Security Benefits

* Prevents unexpected spending
* Financial governance
* Operational transparency

---

# Defender for Cloud

## Purpose

Microsoft Defender for Cloud provides a centralized overview of cloud security posture.

Although advanced Defender plans were not enabled due to Free Tier limitations, the project includes Defender for Cloud as the primary security posture management solution.

---

## Security Benefits

* Security recommendations
* Secure Score visibility
* Compliance insights
* Continuous assessment

---

# Security Principles Applied

Throughout the project, the following cloud security principles were consistently applied:

* Principle of Least Privilege
* Defense in Depth
* Zero Trust
* Secure by Default
* Infrastructure as Code
* Governance First
* Network Segmentation
* Continuous Monitoring

These principles guided every architectural decision made during the implementation of the environment.

---

# Security Summary

The implemented security controls provide multiple layers of protection across identity, networking, governance, secrets management, and monitoring.

Although intentionally built within Azure Free Tier limitations, the environment closely resembles the security architecture used in real enterprise Azure deployments.

The project demonstrates practical knowledge of Azure cloud security concepts while maintaining scalability for future enhancements such as Azure Firewall, Microsoft Sentinel, Privileged Identity Management (PIM), and Just-In-Time (JIT) access.
