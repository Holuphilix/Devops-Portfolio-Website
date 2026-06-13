# 🚀 Production-Style DevOps Portfolio Platform

This project is a production-style DevOps portfolio platform that demonstrates how a simple static website can evolve into a fully automated, secure, observable, and operationally monitored cloud workload.

It showcases practical DevOps and cloud engineering workflows including:

- Infrastructure as Code (Terraform)
- CI/CD automation (GitHub Actions)
- Secure global content delivery (AWS CloudFront + ACM)
- Custom domain integration (Namecheap)
- Monitoring and alerting (Prometheus, Grafana, Alertmanager, Blackbox Exporter)
- Incident notification workflows (Slack integration)

👉 **Live Site:** https://philipoludolamu.com

![Production-Style DevOps Portfolio Platform homepage](assets/portfolio-devops-website.png)

## 🎯 Why This Repository Exists

This repository serves two purposes:

1. It powers my live portfolio website at `https://philipoludolamu.com`
2. It demonstrates how a simple frontend application can be engineered, automated, secured, monitored, and operated using modern DevOps practices

Many portfolio websites stop at frontend deployment alone.

This project extends beyond static hosting by introducing:

* Infrastructure as Code
* CI/CD automation
* CDN-backed HTTPS delivery
* DNS and certificate management
* Monitoring and observability
* Alert routing and incident notifications
* Operational validation through controlled failure testing

The goal is to treat a simple web application like a real production-style workload rather than a static showcase page.

## 🧩 Engineering Areas Demonstrated

This repository demonstrates practical implementation across multiple areas of DevOps and cloud engineering:

* Static frontend delivery on AWS
* Infrastructure provisioning with Terraform
* CI/CD automation using GitHub Actions
* CDN-backed HTTPS delivery with CloudFront and ACM
* DNS integration using Namecheap
* Infrastructure observability with Prometheus and Grafana
* Host-level metrics collection with Node Exporter
* External uptime probing with Blackbox Exporter
* Alert routing with Alertmanager
* Incident notifications through Slack
* Operational validation through simulated failure scenarios

## 📊 Project Snapshot

| Area           | What this project demonstrates                                      |
| -------------- | ------------------------------------------------------------------- |
| Frontend       | Responsive portfolio frontend optimized for recruiter visibility    |
| Hosting        | AWS S3 static website hosting                                       |
| Delivery       | Automated CI/CD deployment pipeline                                 |
| Infrastructure | Terraform-managed AWS resources                                     |
| Security       | HTTPS via CloudFront + ACM                                          |
| DNS            | Namecheap custom domain routing                                     |
| Observability  | Prometheus, Grafana, Alertmanager, Node Exporter, Blackbox Exporter |
| Notifications  | Real-time incident and recovery notifications via Slack             |

## 🌐 Live Access

| Endpoint                                                                 | Purpose                      |
| ------------------------------------------------------------------------ | ---------------------------- |
| `https://philipoludolamu.com`                                            | Primary live portfolio URL   |
| `https://www.philipoludolamu.com`                                        | Secondary live portfolio URL |
| `http://philipdev-portfolio-website.s3-website-us-east-1.amazonaws.com/` | Direct S3 website endpoint   |

> Note: the CloudFront domain is managed by AWS and may change after distribution updates. Use the custom domain above for the latest site version.

## 🖥️ Local Observability Endpoints

When the monitoring stack is running locally with Docker Compose, these endpoints are available:

| Service           | URL                     |
| ----------------- | ----------------------- |
| Grafana           | `http://localhost:3001` |
| Prometheus        | `http://localhost:9091` |
| Alertmanager      | `http://localhost:9094` |
| Node Exporter     | `http://localhost:9101` |
| Blackbox Exporter | `http://localhost:9116` |

## 🏗️ Architecture Overview

### 🚚 Delivery Architecture

```mermaid
flowchart LR
    A[Developer] --> B[GitHub Repository]
    B --> C[GitHub Actions]
    C --> D[AWS S3 Static Website Bucket]
    E[Terraform] --> D
    E --> F[AWS CloudFront]
    E --> G[AWS ACM Certificate]
    H[Namecheap DNS] --> F
    D --> F
    F --> I[philipoludolamu.com]
    F --> J[www.philipoludolamu.com]
    I --> K[End Users]
    J --> K
```

### 📡 Monitoring and Alerting Architecture

```mermaid
flowchart LR
    A[Node Exporter] --> B[Prometheus]
    C[Blackbox Exporter] --> B
    D[https://philipoludolamu.com] --> C
    B --> E[Grafana]
    B --> F[Alertmanager]
    F --> G[Slack Channel]
```

## 🧠 Architecture Explained

This section outlines both the delivery pipeline and the observability workflow used to deploy, monitor, and operate the application in a production-style environment.

### 🚚 Delivery Path

* `GitHub` stores the application source, infrastructure files, and deployment workflows.
* `GitHub Actions` automatically deploys updated frontend assets to the S3 website bucket after changes are pushed to `main`.
* `Terraform` provisions and manages the AWS infrastructure required for application delivery.
* `S3` stores the static frontend assets.
* `CloudFront` provides global CDN delivery, HTTPS termination, and edge caching.
* `ACM` manages the TLS certificate attached to the CloudFront distribution.
* `Namecheap` routes the custom domain to CloudFront through DNS configuration.

### 📡 Monitoring Path

* `Node Exporter` exposes host-level infrastructure metrics such as CPU, memory, and system usage.
* `Blackbox Exporter` probes the live portfolio endpoint and returns uptime and response metrics.
* `Prometheus` scrapes exporters, stores time-series metrics, and evaluates alert rules.
* `Grafana` visualizes infrastructure and application monitoring data through dashboards.
* `Alertmanager` receives alerts from Prometheus and manages routing, grouping, and notification delivery.
* `Slack` serves as the operational notification channel for incidents and recovery events.

## 🎯 Project Objectives

* Build and operate a production-style personal portfolio platform
* Automate infrastructure provisioning using Terraform
* Implement repeatable CI/CD deployment workflows
* Secure public delivery using CloudFront and HTTPS
* Integrate DNS and certificate management for a real custom domain
* Introduce observability and operational monitoring
* Validate monitoring and alerting workflows through controlled failure testing
* Demonstrate practical DevOps, cloud, and platform engineering workflows in a single repository

## 🛠️ Tools and Services

| Category       | Tools / Services                 | Why they are here                              |
| -------------- | -------------------------------- | ---------------------------------------------- |
| Frontend       | HTML, CSS, JavaScript            | Build the portfolio frontend                   |
| Cloud Platform | AWS S3, CloudFront, ACM          | Host, secure, and globally distribute the site |
| DNS            | Namecheap                        | Route the custom domain to CloudFront          |
| IaC            | Terraform                        | Provision infrastructure consistently          |
| CI/CD          | GitHub Actions                   | Automate deployment workflows                  |
| Monitoring     | Prometheus, Grafana              | Collect and visualize operational metrics      |
| Exporters      | Node Exporter, Blackbox Exporter | Expose host metrics and probe website uptime   |
| Alerting       | Alertmanager, Slack              | Route incidents and recovery notifications     |
| Runtime        | Docker Compose                   | Run the local observability stack              |
| OS / Shell     | Linux, Bash                      | Local development and operational workflows    |

## 📁 Repository Structure

```text
Devops-Portfolio-Website/
├── index.html
├── style.css
├── script.js
├── README.md
├── .gitignore
├── assets/
│   ├── portfolio-devops-website.png
│   ├── Philip-Oludolamu-Resume.pdf
│   ├── ACM_certificate_issued.png
│   ├── cloudfront_custom_domain_config.png
│   ├── docker_compose_running.png
│   ├── grafana_full_monitoring_dashboard.png
│   ├── prometheus_probe_success.png
│   ├── slack_alert_firing.png
│   └── other screenshots used inline throughout this README
├── .github/
│   └── workflows/
│       └── deploy.yml
├── terraform/
│   ├── versions.tf
│   ├── main.tf
│   ├── variables.tf
│   ├── outputs.tf
│   ├── terraform.tfvars
│   └── .terraform.lock.hcl
└── monitoring/
    ├── docker-compose.yml
    ├── prometheus/
    │   ├── prometheus.yml
    │   └── alerts.yml
    ├── grafana/
    │   ├── dashboards/
    │   │   └── node-exporter-overview.json
    │   └── provisioning/
    │       ├── datasources/
    │       │   └── prometheus.yml
    │       └── dashboards/
    │           └── default.yml
    ├── alertmanager/
    │   └── alertmanager.yml
    ├── blackbox/
    │   └── blackbox.yml
    └── secrets/
        └── slack_webhook_url   # local only, gitignored
```

> `monitoring/secrets/slack_webhook_url` is intentionally kept local and excluded from Git. The webhook is treated as a secret and should never be committed to source control.

## ⚙️ Prerequisites

The following tools and services were used to build and operate this project:

- AWS account
- Namecheap account (for custom domain configuration)
- GitHub repository with Actions enabled
- Terraform installed locally
- Docker and Docker Compose installed locally
- Slack workspace with an incoming webhook for alert notifications

## ⚡ Quick Start

### ▶️ Run the Portfolio Locally

Because the frontend is fully static, it can be served locally using any lightweight web server.

```bash
python3 -m http.server 8000
```

Then open:

```text
http://localhost:8000
```

### 📊 Run the Monitoring Stack Locally

From the repository root:

```bash
cd monitoring
docker compose up -d
```

Then open:

* Grafana: `http://localhost:3001`
* Prometheus: `http://localhost:9091`
* Alertmanager: `http://localhost:9094`

Current Grafana credentials from `monitoring/docker-compose.yml`:

* username: `admin`
* password: `*******`

## 📖 How To Read The Rest Of This README

This project is structured as a progressive engineering journey from Task 1 through Task 7.

- Tasks 1 to 6 cover frontend delivery, infrastructure provisioning, CI/CD automation, HTTPS enablement, and custom domain integration.
- Task 7 focuses on observability, monitoring, alerting, and operational validation workflows.

Each task section explains:

- why the implementation matters
- what was deployed or configured
- how the components interact operationally
- where the relevant files are located
- supporting screenshots and validation evidence

## 🛣️ Delivery Journey Summary

| Task   | Focus                   | Outcome                                                     |
| ------ | ----------------------- | ----------------------------------------------------------- |
| Task 1 | Frontend engineering    | Built a recruiter-focused portfolio frontend                |
| Task 2 | AWS S3 static hosting   | Deployed the site as a publicly accessible static workload  |
| Task 3 | Terraform               | Converted infrastructure provisioning into reusable IaC     |
| Task 4 | GitHub Actions CI/CD    | Automated deployments from GitHub to AWS                    |
| Task 5 | CloudFront + HTTPS      | Enabled secure CDN-backed HTTPS delivery                    |
| Task 6 | Custom domain           | Integrated Namecheap DNS, ACM, and CloudFront               |
| Task 7 | Monitoring and alerting | Implemented observability, dashboards, alerting, and Slack notifications |

## 🧩 Task 1: Frontend Engineering

### 🎯 Objective

Build a clean, recruiter-focused portfolio frontend that serves as the application layer for the broader DevOps and cloud delivery workflow.

### 💡 Why This Task Matters

Without an actual application workload, the project would remain infrastructure-only.

Task 1 establishes the frontend application that is later deployed, automated, secured, monitored, and operationally validated throughout the rest of the project lifecycle.

This creates a realistic foundation for demonstrating:

- deployment workflows
- infrastructure automation
- CI/CD pipelines
- CDN delivery
- monitoring and alerting
- production-style operational practices

### ⚙️ What Was Implemented

- Sticky navigation for fast section access
- Hero section with a clear DevOps engineering value proposition
- About, Skills, Projects, Resume, and Contact sections
- Responsive layout for desktop and mobile viewing
- Theme toggle and improved UI interactions
- Project cards designed to showcase real engineering work and technical projects
- Resume integration for recruiter accessibility

### 📂 Key Files

- `index.html`
- `style.css`
- `script.js`

### 🔍 How It Works

The frontend intentionally uses a lightweight static architecture while maintaining a professional and recruiter-focused user experience.

- `index.html` defines the structure and content layout
- `style.css` manages responsiveness, theming, spacing, and visual presentation
- `script.js` handles UI interactions and frontend behavior

Using a static frontend architecture simplifies downstream infrastructure and delivery workflows because the application can be efficiently:

- hosted on S3
- distributed globally through CloudFront
- deployed through CI/CD pipelines
- monitored externally through uptime probes

This keeps the operational model simple while still enabling production-style DevOps practices around the application.

### 📸 Evidence

The application was fully functional locally before cloud deployment and infrastructure automation were introduced:

![Local portfolio website during frontend development](assets/local_website.png)

### 🧠 What To Notice

- A simple static application is sufficient for demonstrating real DevOps workflows
- Clean frontend structure simplifies automation, deployment, and observability later in the project
- Lightweight applications are ideal for learning infrastructure automation and operational workflows without unnecessary backend complexity

## ☁️ Task 2: AWS S3 Static Hosting

### 🎯 Objective

Deploy the portfolio application to AWS and make it publicly accessible through cloud-based static hosting.

### 💡 Why This Task Matters

Task 1 established the application layer locally.

Task 2 transitions the project into a real cloud runtime environment by introducing public hosting on AWS. This marks the shift from local-only development into externally accessible infrastructure.

It also establishes the delivery foundation that is later enhanced with:

- Terraform automation
- CI/CD deployment workflows
- CloudFront CDN integration
- HTTPS encryption
- custom domain routing
- monitoring and observability

### ⚙️ What Was Implemented

- S3 bucket creation for static website hosting
- Static website hosting configuration
- Public access configuration for website delivery
- Upload and hosting of frontend application assets
- Initial public endpoint exposure through the S3 website URL

### 📂 AWS Components Introduced

| Component | Purpose |
| --- | --- |
| Amazon S3 | Stores and serves static frontend assets |
| Static Website Hosting | Enables browser-based public website access |
| Bucket Policy / Public Access | Allows external users to access website files |

### 🔍 How S3 Hosting Works Here

Amazon S3 can directly host static frontend assets including:

- HTML
- CSS
- JavaScript
- Images
- PDF documents

At this stage, requests are served directly from the S3 static website endpoint.

This provides a fast and cost-effective method for publicly hosting frontend applications, but there are still important limitations:

- no HTTPS encryption
- no CDN edge caching
- no custom domain support
- limited production-grade traffic optimization

These limitations are addressed later through CloudFront, ACM, and DNS integration.

### 📸 Evidence

The S3 bucket was created for static website hosting:

![S3 bucket created for the portfolio website](assets/S3_Bucket_Created.png)

Static website hosting was enabled successfully:

![Static website hosting enabled on the S3 bucket](assets/Static_Hosting_Enabled.png)

The application became publicly accessible through the S3 website endpoint:

![Portfolio website accessible through the early hosted URL](assets/live_website.png)

### 🧠 What To Notice

- S3 provides a lightweight and highly cost-effective hosting model for static applications
- Static hosting creates a strong foundation for later CDN and HTTPS integration
- Separating frontend delivery from backend infrastructure simplifies deployment workflows
- Direct S3 hosting is useful for initial deployment validation before introducing production-grade delivery optimizations

## 🏗️ Task 3: Terraform Infrastructure as Code

### 🎯 Objective

Replace manual AWS configuration with Terraform to make the infrastructure reproducible, version-controlled, and easier to manage operationally.

### 💡 Why This Task Matters

Manual infrastructure provisioning through the AWS Console introduces several operational challenges:

- inconsistent environments
- difficult change tracking
- limited reproducibility
- increased risk of configuration drift

Terraform addresses these issues by defining infrastructure declaratively as code.

This enables the infrastructure to become:

- reusable
- reviewable
- auditable
- easier to maintain over time

Introducing Infrastructure as Code (IaC) also establishes the foundation for scalable automation and repeatable cloud delivery workflows.

### 📂 Key Terraform Files

- [`terraform/versions.tf`](terraform/versions.tf)
- [`terraform/main.tf`](terraform/main.tf)
- [`terraform/variables.tf`](terraform/variables.tf)
- [`terraform/outputs.tf`](terraform/outputs.tf)
- [`terraform/terraform.tfvars`](terraform/terraform.tfvars)

### ⚙️ What Terraform Now Manages

Terraform provisions and manages the core AWS delivery infrastructure, including:

- S3 bucket and static website configuration
- Bucket ownership controls and public access settings
- Bucket policy for public content delivery
- CloudFront CDN distribution
- ACM certificate request configuration
- Certificate validation outputs
- Custom domain aliases for CloudFront
- Infrastructure outputs used for DNS routing and verification

This transitions the project from manually configured infrastructure into a codified and repeatable cloud environment.

### 📈 Infrastructure Evolution

#### Before Terraform

- Infrastructure provisioning was manual and console-driven
- Resource configuration required repetitive click-based setup
- Reproducing environments was time-consuming
- Infrastructure changes were difficult to audit or version-control

#### After Terraform

- Infrastructure is defined declaratively in code
- Cloud resources are version-controlled alongside the application
- Infrastructure changes are easier to review and maintain
- CloudFront, ACM, and DNS workflows became more structured and repeatable
- Deployment environments became easier to reproduce consistently

### 🧠 Operational Considerations

This repository currently uses a local Terraform state file as part of the project scope.

In collaborative or production-grade environments, Terraform state should typically be stored remotely using a backend such as:

- Amazon S3 for remote state storage
- DynamoDB for state locking and concurrency protection

This helps prevent state conflicts and improves collaboration across teams and deployment environments.

### 📸 Evidence

Terraform was used to provision and manage the AWS infrastructure required for application delivery and HTTPS configuration:

![Terraform provisioning and infrastructure deployment](assets/terraform_apply_custom_domain.png)

### 🧠 What To Notice

- Terraform improves both infrastructure automation and operational consistency
- Infrastructure definitions become version-controlled alongside application code
- Declarative infrastructure simplifies repeatability and long-term maintenance
- Infrastructure as Code enables more reliable CI/CD and cloud delivery workflows

## 🔄 Task 4: GitHub Actions CI/CD

### 🎯 Objective

Automate deployment workflows so that updates pushed to `main` are automatically delivered to the live production environment.

### 💡 Why This Task Matters

Before automation, deployments required manual file uploads and infrastructure interaction.

This introduces operational risks such as:

- inconsistent deployments
- missed files
- manual deployment errors
- slower release workflows

GitHub Actions introduces Continuous Integration and Continuous Delivery (CI/CD) automation into the project lifecycle.

This transforms deployments into:

- repeatable workflows
- source-controlled delivery pipelines
- automated release operations
- faster and more reliable deployment processes

### 📂 Workflow File

- [`.github/workflows/deploy.yml`](.github/workflows/deploy.yml)

### ⚙️ What The Deployment Workflow Does

On every push to the `main` branch, the GitHub Actions workflow automatically:

1. Checks out the latest repository code
2. Configures AWS authentication using GitHub Secrets
3. Syncs updated frontend assets to the S3 bucket
4. Invalidates the CloudFront cache to refresh edge-delivered content

This creates a lightweight but production-style deployment pipeline for the static application.

### 🔐 Secure Credential Handling

AWS credentials are stored securely using GitHub Secrets rather than hardcoded into the repository.

This helps:

- protect sensitive credentials
- separate secrets from source control
- align with secure CI/CD practices

### ❗ Why CloudFront Cache Invalidation Matters

CloudFront caches assets at edge locations to improve performance and reduce latency.

Without cache invalidation:

- users may continue receiving stale frontend assets
- newly deployed updates may not appear immediately

Including automated invalidation ensures that updated files propagate consistently across edge locations after deployment.

This improves delivery reliability and reduces deployment inconsistency.

### 📸 Evidence

The CI/CD workflow completed successfully and deployed updates automatically to the live environment:

![Successful GitHub Actions deployment workflow](assets/Successful_GitHub_Actions.png)

### 🧠 What To Notice

- CI/CD workflows are valuable even for static frontend applications
- Deployment automation improves reliability and reduces operational overhead
- GitHub Actions enables infrastructure-aware deployment workflows directly from source control
- CDN cache behavior must be considered in production-style deployment pipelines

## 🔐 Task 5: CloudFront + HTTPS

### 🎯 Objective

Introduce CloudFront in front of the S3 origin to enable secure HTTPS delivery, improve performance through CDN edge caching, and establish a production-style public delivery layer.

### 💡 Why This Task Matters

Although S3 static website hosting is suitable for initial frontend deployment, it is not ideal as a direct production-facing entry point.

Introducing CloudFront significantly improves the delivery architecture by adding:

- HTTPS encryption
- Global CDN edge caching
- Lower latency for end users
- Improved scalability and availability
- Centralized traffic handling
- A foundation for custom domain integration

This marks the transition from basic static hosting into a more production-oriented cloud delivery model.

### ⚙️ What Was Added

- CloudFront distribution
- HTTPS delivery through CloudFront
- HTTP-to-HTTPS redirection
- CDN-backed frontend delivery
- Edge caching for improved response performance
- CloudFront cache invalidation integration with GitHub Actions

### 🔄 How Request Flow Changed

#### Before Task 5

```text
User → S3 Website Endpoint
```

#### After Task 5

```text
User → CloudFront CDN → S3 Website Bucket
```

This architectural change introduces a dedicated delivery layer between end users and the application origin.

Instead of accessing S3 directly, users now interact with CloudFront, which becomes the secure public-facing entry point for the application.

### ⚙️ How CloudFront Works in This Setup

In this architecture:

- CloudFront acts as the public entry layer
- S3 remains the application origin storing static assets
- Frequently requested content is cached at CloudFront edge locations
- HTTPS termination is handled at the CDN layer
- Users are automatically redirected from HTTP to HTTPS
- GitHub Actions invalidates cached assets after deployments

This improves both delivery performance and operational consistency.

### 📸 Evidence

CloudFront became the secure public delivery layer for the application:

![CloudFront distribution used to deliver the portfolio over HTTPS](assets/deployed_cloudfront.png)

### 🧠 What To Notice

- CloudFront introduces a production-style CDN delivery architecture
- CDN-backed delivery improves scalability, latency, and user experience
- HTTPS encryption is handled at the edge through CloudFront and ACM
- Separating the application origin (S3) from the delivery layer (CloudFront) is a common cloud architecture pattern
- CDN cache invalidation becomes an important operational consideration during deployments

## 🌍 Task 6: Custom Domain Integration with Namecheap, ACM, and CloudFront

### 🎯 Objective

Replace the default CloudFront distribution URL with a branded custom domain while maintaining secure HTTPS delivery and infrastructure-driven configuration.

### 💡 Why This Task Matters

Custom domain integration transforms the application from a technically functional deployment into a more realistic production-style system.

This task introduces several important cloud and networking concepts including:

- TLS/SSL certificate management
- DNS-based domain ownership validation
- Public DNS routing
- CDN alias configuration
- HTTPS delivery for custom domains

It also improves the professional presentation and accessibility of the application.

### 🌐 Final Domain Result

- `https://philipoludolamu.com`
- `https://www.philipoludolamu.com`

These domains now serve as the primary public entry points for the application.

### 1️⃣ Step 1: Terraform Requests the ACM Certificate

Terraform was used to request an ACM certificate for the custom domains.

The initial Terraform apply outputs the DNS validation records required to prove domain ownership.

This step is critical because CloudFront requires ACM certificates to exist in the `us-east-1` region.

![Terraform output for custom domain and ACM setup](assets/terraform_apply_custom_domain.png)

### 2️⃣ Step 2: Add DNS Validation Records in Namecheap

The ACM-generated DNS validation records were added in Namecheap to validate ownership of:

- `philipoludolamu.com`
- `www.philipoludolamu.com`

Once propagated, ACM was able to verify domain ownership successfully.

![Namecheap ACM DNS validation records](assets/namecheap_acm_validation_records.png)

### 3️⃣ Step 3: ACM Issues the Certificate

After DNS propagation completed, ACM validated the records and issued the TLS certificate.

This certificate is later attached to the CloudFront distribution to enable HTTPS delivery for the custom domain.

![ACM certificate issued for the custom domain](assets/ACM_certificate_issued.png)

### 4️⃣ Step 4: Attach the Certificate to CloudFront

The CloudFront distribution was updated with:

- Alternate domain names (CNAME aliases)
- The validated ACM certificate

This enables CloudFront to securely serve the application over HTTPS using the custom domain.

![CloudFront custom domain configuration](assets/cloudfront_custom_domain_config.png)

### 5️⃣ Step 5: Configure DNS Routing in Namecheap

DNS routing records were configured in Namecheap to direct traffic from the public domains to the CloudFront distribution.

Routing configuration included:

- Root domain (`@`) → CloudFront
- `www` subdomain → CloudFront

![Namecheap routing records pointing to CloudFront](assets/Namecheap_routing_records.png)

### 6️⃣ Step 6: Validate the Live Domain

After DNS propagation completed, the application became publicly accessible through the custom domain over HTTPS.

The custom domain now acts as the primary production-style public endpoint for the application.

![Live portfolio website on the custom domain](assets/live_custom_domain_root.png)

### 🧠 What To Notice

- DNS validation and DNS routing serve different operational purposes
- ACM certificate validation must complete before HTTPS delivery can function properly
- Custom domain integration requires coordination across multiple services:
  - Terraform
  - ACM
  - CloudFront
  - Namecheap DNS
- CloudFront aliases differ from DNS redirects and serve a different routing role
- Proper sequencing is important:
  - certificate request
  - DNS validation
  - certificate issuance
  - CloudFront configuration
  - DNS routing
- HTTPS delivery depends on successful integration between DNS, CloudFront, and ACM

## 📡 Task 7: Monitoring and Alerting with Prometheus, Grafana, Alertmanager, Blackbox Exporter, and Slack

### 🎯 Objective

Introduce observability and operational monitoring into the platform so the application is not only deployed, but also measurable, monitorable, and capable of generating actionable alerts during failure conditions.

### 💡 Why Task 7 Matters

Many portfolio projects stop after deployment.

In production environments, deployment alone is not sufficient. Systems must also provide operational visibility into:

- infrastructure health
- service availability
- uptime status
- response performance
- failure detection
- incident notification workflows

This task introduces a complete observability and alerting workflow that allows the platform to be monitored and operationally validated in real time.

It transforms the project from a simple hosted application into a production-style observable system.

### 📊 Monitoring Stack At A Glance

| Component | Role in this project |
| --- | --- |
| Prometheus | Scrapes metrics and evaluates alert rules |
| Grafana | Visualizes infrastructure and application metrics |
| Node Exporter | Exposes host-level metrics such as CPU and memory |
| Blackbox Exporter | Probes the public website endpoint externally |
| Alertmanager | Routes and manages alert notifications |
| Slack | Receives real-time incident and recovery alerts |

### 📂 Monitoring Files

* [`monitoring/docker-compose.yml`](monitoring/docker-compose.yml)
* [`monitoring/prometheus/prometheus.yml`](monitoring/prometheus/prometheus.yml)
* [`monitoring/prometheus/alerts.yml`](monitoring/prometheus/alerts.yml)
* [`monitoring/grafana/provisioning/datasources/prometheus.yml`](monitoring/grafana/provisioning/datasources/prometheus.yml)
* [`monitoring/grafana/provisioning/dashboards/default.yml`](monitoring/grafana/provisioning/dashboards/default.yml)
* [`monitoring/grafana/dashboards/node-exporter-overview.json`](monitoring/grafana/dashboards/node-exporter-overview.json)
* [`monitoring/alertmanager/alertmanager.yml`](monitoring/alertmanager/alertmanager.yml)
* [`monitoring/blackbox/blackbox.yml`](monitoring/blackbox/blackbox.yml)

### ⚙️ How The Monitoring Stack Was Built

#### 1️⃣ Step 1: Bootstrap the Stack Locally

The observability stack was initialized locally using Docker Compose:

```bash
cd monitoring
docker compose up -d
```

This provisions the monitoring components as isolated containers and establishes the local operational environment.

![Docker Compose running the initial monitoring stack](assets/docker_compose_running.png)

#### 2️⃣ Step 2: Verify Prometheus Self-Scraping

Prometheus was first configured to scrape its own metrics in order to validate:

- service availability
- scrape configuration correctness
- metric ingestion functionality

The `up` metric returned `1`, confirming successful metric collection and healthy target status.

![Prometheus targets page showing the self-scrape job](assets/prometheus_targets.png)

![Prometheus up query result](assets/prometheus_up_query.png)

#### 3️⃣ Step 3: Connect Grafana to Prometheus

Grafana was integrated with Prometheus as the primary metrics data source.

Initial validation included:

- manual datasource verification
- query testing in Grafana Explore

![Grafana Prometheus datasource view](assets/grafana_prometheus_datasource.png)

![Grafana Explore up query result](assets/grafana_explore_up_query.png)

The setup was later improved by provisioning the datasource through configuration files rather than manual UI configuration.

This makes the monitoring environment more reproducible and infrastructure-driven.

![Provisioned Prometheus datasource in Grafana](assets/grafana_provisioned_datasource.png)

#### 4️⃣ Step 4: Add Node Exporter for Host Metrics

Node Exporter was introduced to expose host-level infrastructure metrics including:

- CPU utilization
- memory consumption
- system-level operational metrics

Prometheus successfully scraped the exporter metrics:

![Node Exporter container running alongside the stack](assets/node_exporter_container_running.png)

![Prometheus targets with Node Exporter included](assets/prometheus_targets_with_node_exporter.png)

![Prometheus query for Node Exporter CPU metrics](assets/prometheus_node_exporter_query.png)

![Grafana query for Node Exporter metrics](assets/grafana_node_exporter_query.png)

This introduced infrastructure observability into the stack.

#### 5️⃣ Step 5: Build Dashboards in Grafana

Grafana dashboards were provisioned automatically through mounted configuration files.

This avoids manual dashboard setup and improves reproducibility across environments.

![Grafana dashboard loaded under the project folder](assets/grafana_dashboard_loaded.png)

![Grafana dashboard view for the project](assets/grafana_dashboard_view.png)

Expanded dashboards included operational metrics such as:

- CPU utilization
- memory usage
- exporter health status
- infrastructure visibility panels

![Grafana dashboard showing CPU and memory panels](assets/grafana_cpu_memory_dashboard.png)

#### 6️⃣ Step 6: Add Alert Rules in Prometheus

Prometheus alert rules were introduced to detect infrastructure and service failures automatically.

Example alert rule:

```promql
up{job="node-exporter"} == 0
```

This alert transitions to `FIRING` if the Node Exporter target remains unavailable for more than one minute.

![Prometheus alert rule loaded and inactive](assets/prometheus_alert_rule_loaded.png)

![Prometheus alert firing for Node Exporter downtime](assets/prometheus_alert_firing.png)

This introduces automated failure detection into the monitoring workflow.

#### 7️⃣ Step 7: Integrate Alertmanager

Alertmanager was added to receive alerts from Prometheus and manage notification routing.

This component acts as the central alert orchestration layer for the monitoring stack.

![Alertmanager container running with the monitoring stack](assets/alertmanager_container_running.png)

![Alertmanager UI running locally](assets/alertmanager_ui.png)

![Alertmanager receiving the firing alert](assets/alertmanager_alert_firing.png)

Alertmanager enables:

- alert routing
- grouping
- deduplication
- notification delivery workflows

#### 8️⃣ Step 8: Add Blackbox Exporter for External Service Monitoring

Blackbox Exporter was configured to probe the live production endpoint externally:

```text
https://philipoludolamu.com
```

This introduced uptime and response monitoring for the publicly accessible application.

Key metrics included:

- `probe_success`
- `probe_duration_seconds`

![Prometheus blackbox target for the live portfolio website](assets/prometheus_blackbox_target.png)

![Prometheus probe_success query result](assets/prometheus_probe_success.png)

![Prometheus probe_duration_seconds query result](assets/prometheus_probe_duration.png)

This extends monitoring beyond infrastructure metrics into application availability monitoring.

#### 9️⃣ Step 9: Expand Alert Rules for Website Monitoring

Additional alert rules were introduced for application-level monitoring:

- `PortfolioWebsiteDown`
- `PortfolioWebsiteSlow`

These alerts monitor:

- website availability
- external uptime status
- response latency thresholds

![Prometheus alert rules including website-specific alerts](assets/portfolio_alert_rules_loaded.png)

This introduces service-level operational monitoring into the stack.

#### 🔟 Step 10: Build Final Unified Dashboard

The final Grafana dashboard consolidated:

- infrastructure metrics
- exporter health
- website uptime
- response latency
- operational visibility indicators

![Full Grafana monitoring dashboard for the portfolio](assets/grafana_full_monitoring_dashboard.png)

This creates a centralized operational visibility layer for the application.

#### 📣 Step 11: Send Alerts to Slack

Alertmanager was configured to send notifications to Slack through an incoming webhook integration.

```text
monitoring/secrets/slack_webhook_url
```

This enables:

- real-time incident notifications
- recovery notifications
- operational visibility outside the monitoring stack itself

![Slack firing alert notification](assets/slack_alert_firing.png)

![Slack resolved alert notification](assets/slack_alert_resolved.png)

This completes the end-to-end alerting workflow from detection through notification delivery.

### 🧪 How To Reproduce the Main Alert Test

```bash
cd monitoring
docker compose stop node-exporter
```

Wait approximately one minute, then verify:

- Prometheus alert status
- Alertmanager notification routing
- Slack alert delivery

To restore the exporter:

```bash
docker compose start node-exporter
```

## 🧪 Failure Testing & Validation

To validate the monitoring and alerting workflows under realistic operational conditions, controlled failure scenarios were intentionally simulated and observed end-to-end.

This ensured that the monitoring stack was not only configured, but operationally verified.

### 🔻 Infrastructure Failure Test (Node Exporter)

The Node Exporter container was stopped to simulate infrastructure-level monitoring failure:

```bash
docker compose stop node-exporter
```

### ✅ Observed Behavior

- Prometheus marked the exporter target as `DOWN`
- Alert rule `NodeExporterDown` transitioned to `FIRING`
- Alertmanager received and processed the alert
- Slack received a real-time incident notification

![Prometheus alert firing for Node Exporter downtime](assets/prometheus_alert_firing.png)

![Slack firing alert notification](assets/slack_alert_firing.png)

After restarting the exporter:

```bash
docker compose start node-exporter
```

- The alert transitioned to `RESOLVED`
- Slack received a recovery notification

![Slack resolved alert notification](assets/slack_alert_resolved.png)

This validated the full infrastructure alert lifecycle from detection through recovery.

### 🌐 Application Availability Test (Blackbox Exporter)

The live portfolio endpoint was monitored through Blackbox Exporter to validate external uptime monitoring behavior.

### ✅ Observed Behavior During Failure Conditions

- Blackbox probe failed (`probe_success = 0`)
- Prometheus triggered `PortfolioWebsiteDown`
- Alertmanager routed the incident
- Slack received a firing alert notification

After service recovery:

- Probe returned to success (`probe_success = 1`)
- The alert resolved automatically
- Slack received a recovery notification

This validated application-level availability monitoring and external uptime detection workflows.

### ⚡ Key Validation Outcomes

- Alerts trigger only after configured thresholds are exceeded
- False-positive risk is reduced through alert timing controls
- Alert lifecycle transitions function correctly (`FIRING → RESOLVED`)
- Slack integration provides real-time operational visibility
- Both infrastructure and application failures are detected successfully
- The full alert pipeline (`Prometheus → Alertmanager → Slack`) is operationally validated

### 💥 Why This Matters

This validation process demonstrates that the platform is not only deployed, but also operationally observable and incident-aware.

Key operational behaviors were actively verified rather than assumed:

- monitoring functionality
- failure detection
- alert routing
- notification delivery
- recovery handling

This reflects real-world DevOps and Site Reliability Engineering (SRE) practices where system reliability must be continuously observable and operationally validated.

### 💪 Why Task 7 Strengthens the Project

Task 7 transforms the project from a simple deployed application into a production-style observable platform.

The project evolves from:

```text
"I can deploy a website"
```

to:

```text
"I can deploy, monitor, detect failures, and respond to incidents"
```

This reflects a broader operational engineering mindset where deployment, observability, reliability, and incident response are treated as equally important parts of the system lifecycle.

## 🛠️ Troubleshooting and Lessons Learned

### ⚠️ Browser Caching Can Mask Recent Changes

During frontend development and deployment validation, browser caching occasionally caused stale assets to appear even after successful updates.

This affected:

- CSS modifications
- Resume (PDF) updates
- Image replacements

A hard browser refresh was required to force retrieval of the latest assets:

```text
Ctrl + Shift + R
```

### 🧠 Operational Insight

Client-side caching can create misleading deployment validation results if stale assets remain stored locally.

This reinforces the importance of:

- cache invalidation strategies
- deployment verification
- CDN cache awareness during frontend delivery workflows

### ⚠️ Docker Port Conflicts

Running multiple local services and previously existing containers resulted in host port conflicts during monitoring stack initialization.

To resolve this, custom host ports were assigned:

- Grafana → `3001`
- Prometheus → `9091`
- Alertmanager → `9094`
- Node Exporter → `9101`
- Blackbox Exporter → `9116`

This ensured all observability services remained accessible simultaneously without interfering with existing local workloads.

### 🧠 Operational Insight

Port allocation planning becomes increasingly important when operating multiple local services, monitoring stacks, or development environments concurrently.

### ⚠️ Container Restart vs Recreate

When configuration files or mounted volumes were updated, restarting containers alone did not always apply changes correctly.

Forcing container recreation ensured updated configurations were fully reflected:

```bash
docker compose up -d --force-recreate
```

### 🧠 Operational Insight

Container recreation is sometimes required when:

- mounted configuration files change
- provisioning files are updated
- persistent container state causes stale behavior

Understanding the difference between restarting and recreating containers is important when troubleshooting containerized environments.

### ⚠️ Git Commit Scope Confusion (Subdirectory Commits)

At one stage, commits were executed from inside the `terraform/` directory instead of the repository root.

Although `git add .` was used, only changes within that subdirectory were staged and committed.

This resulted in:

- monitoring files being excluded
- frontend updates not being committed
- README changes missing from GitHub

### 🧠 Lesson Learned

Git command scope depends on the current working directory.

To ensure complete repository visibility during commits:

> Always execute Git commands from the repository root unless intentionally targeting a specific subdirectory.

### ⚠️ Force Reset and History Rewrite Can Cause Data Loss

Using destructive Git commands such as:

```bash
git reset --hard
git push --force
```

resulted in:

- loss of uncommitted local changes
- overwritten branch history
- reverted monitoring and frontend updates

### 🧠 Lesson Learned

Destructive Git operations should be used carefully and only with a clear understanding of their impact.

Before performing resets or force pushes:

- commit changes
- create backup branches
- or stash uncommitted work

This reduces the risk of accidental data loss during repository recovery operations.

### ⚠️ Detached HEAD State Is Unsafe for Active Development

While inspecting historical commits, the repository entered a detached `HEAD` state:

```bash
git checkout <commit-hash>
```

In this state:

- changes are not attached to a branch
- new work can become difficult to recover
- commits may become orphaned if not preserved properly

### 🧠 Lesson Learned

Detached `HEAD` mode is useful for repository inspection, but unsafe for ongoing development work.

Before continuing development:

> Always return to an active branch such as `main` or a dedicated recovery branch.

### ⚠️ Uncommitted Changes Can Be Lost During Branch Switching

Attempting to switch branches while local changes were still uncommitted caused Git to block the checkout operation:

```text
Your local changes would be overwritten by checkout
```

This highlighted the importance of preserving work before changing contexts.

### 🧠 Lesson Learned

Before switching branches:

- commit work
- stash changes
- or create a temporary recovery branch

This prevents accidental overwrites and improves workflow safety during active development.

### ⚠️ Git Stash Became Critical During Recovery

During repository recovery and troubleshooting, `git stash` became an important safety mechanism for temporarily preserving local changes.

Commands used:

```bash
git stash list
git stash apply stash@{0}
```

This allowed restoration of:

- CSS changes
- README updates
- frontend modifications

### 🧠 Lesson Learned

`git stash` is highly valuable when:

- switching branches
- troubleshooting risky operations
- recovering interrupted work
- preserving temporary changes without committing incomplete work

### ⚠️ CloudFront Caching Can Delay Website Updates

Even after successful GitHub Actions deployments, updates were not immediately visible on the public website.

This occurred because CloudFront continued serving cached assets from edge locations.

### ✅ Resolution

- CloudFront invalidation was integrated into the CI/CD workflow
- Propagation time was allowed for edge cache refresh

### 🧠 Lesson Learned

Successful deployment does not always guarantee immediate frontend visibility.

CDN caching layers must be considered as part of deployment verification and operational troubleshooting workflows.

## 🧠 Key Takeaway

This project reinforced that DevOps engineering extends beyond deployment alone.

It also involves:

```text
debugging → recovering → validating → improving
```

The troubleshooting process provided deeper operational understanding across:

- Git recovery workflows
- infrastructure behavior
- deployment troubleshooting
- container operations
- monitoring validation
- caching and CDN behavior

### 🔒 Secret Management for Slack Webhooks

Slack webhook URLs are treated as sensitive credentials and are intentionally excluded from version control.

In this project:

- the webhook is stored in a gitignored local file
- the secret is injected into the Alertmanager container at runtime

This approach helps prevent accidental credential exposure and aligns with common secure configuration management practices used in production environments.

### 🌐 DNS Validation vs DNS Routing

DNS validation and DNS routing serve different operational purposes during custom domain integration.

| Function | Purpose |
| --- | --- |
| DNS Validation | Proves domain ownership for ACM certificate issuance |
| DNS Routing | Directs public traffic to the CloudFront distribution |

Understanding this distinction is important when troubleshooting HTTPS and custom domain configuration workflows.

## 🏁 Final Outcome

This project demonstrates the ability to design, automate, deploy, monitor, and operate a production-style cloud application workflow.

Key capabilities demonstrated include:

- Building a recruiter-facing frontend workload
- Provisioning AWS infrastructure with Terraform
- Automating deployments using GitHub Actions
- Delivering content securely through CloudFront and ACM
- Integrating a real custom domain through DNS configuration
- Collecting infrastructure metrics with Prometheus and Node Exporter
- Monitoring external application availability using Blackbox Exporter
- Visualizing operational metrics through Grafana dashboards
- Routing alerts with Alertmanager
- Sending real-time incident notifications through Slack
- Validating monitoring workflows through controlled failure testing

In summary, the project evolved from a simple static website into a production-style DevOps workflow covering:

```text
build → automate → deploy → secure → observe → alert → validate
```

## 👤 Author

### **Philip Oludolamu**

DevOps and Cloud Engineer focused on infrastructure automation, CI/CD workflows, observability, and production-style cloud operations.

* 🌐 Portfolio: https://philipoludolamu.com
* 💻 GitHub: https://github.com/holuphilix
* 🔗 LinkedIn: https://www.linkedin.com/in/philip-oludolamu

## 📄 License

This project is licensed under the **MIT License**.

You are free to use, modify, and distribute the code with attribution.

See the [LICENSE](LICENSE) file for full license details.