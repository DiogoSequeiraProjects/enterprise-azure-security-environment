
# Enterprise Azure Security Environment

## Project Overview

### Introduction

The **Enterprise Azure Security Environment** project was designed to simulate the deployment of a secure Azure enterprise landing zone following Microsoft cloud security best practices. The primary objective was to build a production-inspired environment focused on security, governance, networking, monitoring, and Infrastructure as Code (IaC), while remaining entirely within the Azure Free Tier.

Unlike traditional Azure laboratory exercises, this project emphasizes architectural decision-making, security hardening, least-privilege access, governance enforcement, and operational visibility. Every implemented component was selected to reflect real-world enterprise scenarios commonly found in medium and large organizations.

The environment demonstrates how multiple Azure services can be combined to provide a secure and scalable cloud foundation suitable for future workloads.

---

# Project Objectives

The project was developed with the following objectives:

* Design an enterprise-style Azure Landing Zone.
* Implement a Hub-and-Spoke network topology.
* Apply Zero Trust networking principles.
* Enforce governance using Azure Policy and Resource Locks.
* Protect sensitive information using Azure Key Vault.
* Restrict access through Private Endpoints.
* Implement Role-Based Access Control (RBAC) using the Principle of Least Privilege.
* Configure centralized monitoring through Azure Monitor and Log Analytics.
* Demonstrate Infrastructure as Code using Terraform.
* Maintain a fully documented environment suitable for portfolio presentation.

---

# Project Scope

The implemented environment focuses on cloud infrastructure security rather than application deployment.

The project includes:

* Azure Resource Groups
* Virtual Networks
* Hub-and-Spoke Architecture
* Virtual Network Peering
* Network Security Groups (NSGs)
* Route Tables
* Azure Key Vault
* Private Endpoint
* Private DNS Zone
* Managed Identity
* Azure Policy
* Resource Locks
* Azure Monitor
* Log Analytics Workspace
* Diagnostic Settings
* Azure Monitor Alerts
* Action Groups
* Cost Management
* Budgets
* Terraform Infrastructure as Code

No production workloads or virtual machines were deployed, allowing the project to remain within Azure's free usage limits while still demonstrating enterprise architecture concepts.

---

# Architecture Overview

The environment follows a Hub-and-Spoke architecture.

The Hub Virtual Network centralizes shared services and security controls.

Separate Development and Production Virtual Networks are isolated while maintaining controlled connectivity through Virtual Network Peering.

This architecture provides:

* Network segmentation
* Centralized management
* Reduced attack surface
* Easier scalability
* Improved governance
* Simplified future expansion

The architecture was intentionally designed to mirror common enterprise cloud deployments.

---

# Security Design Principles

Security was considered from the initial design phase rather than added after deployment.

The project follows several core principles:

## Least Privilege

Permissions are granted using Azure RBAC with only the minimum required access.

## Defense in Depth

Multiple independent security layers are implemented:

* Network segmentation
* NSGs
* Private Endpoints
* Azure Policies
* Resource Locks
* Key Vault
* Monitoring

## Zero Trust

No resource is considered trusted by default.

Access is explicitly controlled through identity, networking, and governance mechanisms.

## Secure by Default

Resources are configured following secure defaults wherever possible.

Examples include:

* Private connectivity
* Restricted management access
* Governance enforcement
* Monitoring enabled
* Secret protection

---

# Governance Strategy

Governance is implemented using multiple Azure services working together.

The environment includes:

* Azure Policy assignments
* Resource tagging strategy
* Resource Locks
* Cost Management
* Budget alerts

These controls help maintain consistency, prevent accidental resource modification, and improve operational management.

---

# Monitoring Strategy

Operational visibility is provided using Azure Monitor and Log Analytics.

Diagnostic Settings forward platform logs into a centralized Log Analytics Workspace where operational events can be analyzed.

Azure Monitor Alerts and Action Groups provide the foundation for proactive monitoring and future incident response.

Although the environment generates limited activity due to the absence of production workloads, the monitoring infrastructure has been fully configured and is ready for expansion.

---

# Infrastructure as Code

Infrastructure as Code is implemented using Terraform.

Terraform enables:

* Repeatable deployments
* Version-controlled infrastructure
* Simplified change management
* Infrastructure documentation
* Improved collaboration

The repository includes the initial Terraform structure that can be expanded into reusable modules as the project evolves.

---

# Cost Optimization

One of the project requirements was to remain within Azure's Free Tier.

Cost optimization measures include:

* Budget creation
* Cost analysis
* Limited resource deployment
* Free-tier eligible services
* Careful service selection

Throughout the project, cloud costs were continuously monitored to ensure no unexpected charges were incurred.

---

# Technologies Used

## Cloud Platform

* Microsoft Azure

## Infrastructure as Code

* Terraform

## Identity

* Azure RBAC
* Managed Identity

## Networking

* Virtual Networks
* Hub-and-Spoke
* VNet Peering
* Network Security Groups
* Route Tables
* Private Endpoints
* Private DNS Zones

## Security

* Azure Key Vault
* Azure Policy
* Resource Locks

## Monitoring

* Azure Monitor
* Log Analytics Workspace
* Diagnostic Settings
* Azure Monitor Alerts
* Action Groups

## Version Control

* Git
* GitHub

---

# Expected Learning Outcomes

This project demonstrates practical experience in:

* Azure cloud architecture
* Secure networking
* Cloud governance
* Identity and Access Management
* Infrastructure as Code
* Monitoring and observability
* Cloud cost management
* Enterprise documentation

The project serves both as a technical learning experience and as a professional portfolio demonstrating the practical application of Microsoft Azure security best practices.
