# 🚀 Production-Ready DevOps Portfolio Website

This project is a **production-style DevOps portfolio** that demonstrates how a simple static website evolves into a fully automated, secure, and observable cloud system.

It showcases end-to-end DevOps practices including:

- Infrastructure as Code (Terraform)
- CI/CD automation (GitHub Actions)
- Secure global delivery (AWS CloudFront + ACM)
- Custom domain integration (Namecheap)
- Monitoring and alerting (Prometheus, Grafana, Alertmanager, Blackbox Exporter)
- Incident notifications (Slack integration)

👉 **Live Site:** https://philipoludolamu.com

![Production-Ready DevOps Portfolio Website homepage](assets/portfolio-devops-website.png)

## 🎯 Why This Repository Exists

This project serves two purposes at the same time:

1. It is my live portfolio website at `https://philipoludolamu.com`.
2. It is a documented DevOps case study that shows how a simple frontend can evolve into a secure, automated, observable workload.

That second goal matters because many portfolio sites stop at "I built a webpage." This project goes further and shows:

* cloud hosting
* infrastructure as code
* CI/CD automation
* CDN delivery
* HTTPS and DNS integration
* monitoring and alerting
* basic incident response workflow through Slack

## 📘 What You Will Learn From This Project

By working through this repository, a learner can see how to:

* build a recruiter-friendly frontend with HTML, CSS, and JavaScript
* host a static site on AWS S3
* convert manual infrastructure to Terraform
* automate deployment with GitHub Actions
* place CloudFront in front of S3 for HTTPS and CDN delivery
* connect a real custom domain using Namecheap and ACM
* build a monitoring stack with Prometheus and Grafana
* expose infrastructure metrics with Node Exporter
* probe a real live website with Blackbox Exporter
* route alerts with Alertmanager
* send firing and resolved notifications to Slack

## 📊 Project Snapshot

| Area           | What this project demonstrates                                      |
| -------------- | ------------------------------------------------------------------- |
| Frontend       | Responsive personal portfolio with recruiter-focused sections       |
| Hosting        | AWS S3 static website hosting                                       |
| Delivery       | GitHub Actions deployment pipeline                                  |
| Infrastructure | Terraform-managed AWS resources                                     |
| Security       | HTTPS via CloudFront + ACM                                          |
| DNS            | Namecheap custom domain routing                                     |
| Observability  | Prometheus, Grafana, Alertmanager, Node Exporter, Blackbox Exporter |
| Notifications  | Slack alerts for firing and resolved incidents                      |

## 🌐 Live Access

| Endpoint                                                                 | Purpose                      |
| ------------------------------------------------------------------------ | ---------------------------- |
| `https://philipoludolamu.com`                                            | Primary live portfolio URL   |
| `https://www.philipoludolamu.com`                                        | Secondary live portfolio URL |
| `https://d22hq7kuctu23g.cloudfront.net`                                  | CloudFront distribution URL  |
| `http://philipdev-portfolio-website.s3-website-us-east-1.amazonaws.com/` | Direct S3 website endpoint   |

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
This section illustrates both the delivery pipeline and the observability system used to operate the application in a production-style environment.

### 🚚 Delivery Path

* `GitHub` stores the application source, infrastructure files, and deployment workflow.
* `GitHub Actions` publishes updated files to the S3 website bucket after pushes to `main`.
* `Terraform` manages the AWS infrastructure required for delivery.
* `S3` stores the static website files.
* `CloudFront` sits in front of S3 to add global delivery, caching, and HTTPS.
* `ACM` provides the certificate used by CloudFront.
* `Namecheap` routes the custom domain to the CloudFront distribution.

### 📡 Monitoring Path

* `Node Exporter` exposes host metrics such as CPU and memory.
* `Blackbox Exporter` probes the live portfolio URL and returns probe metrics.
* `Prometheus` scrapes exporters, stores time-series data, and evaluates alert rules.
* `Grafana` visualizes the metrics.
* `Alertmanager` receives alerts from Prometheus and forwards them to Slack.
* `Slack` serves the human-facing notification channel for incidents and recoveries.

## 🎯 Project Objectives

* Build a professional personal portfolio and treat it like a real workload
* Move from manual hosting to repeatable infrastructure as code
* Automate deployment from source control to AWS
* Secure public traffic with HTTPS and CloudFront
* Attach a real custom domain through DNS and ACM
* Add observability so the project can be operated, not only deployed
* Demonstrate a monitoring and notification workflow that is easy to explain in interviews

## 🛠️ Tools and Services

| Category       | Tools / Services                 | Why they are here                              |
| -------------- | -------------------------------- | ---------------------------------------------- |
| Frontend       | HTML, CSS, JavaScript            | Build the portfolio UI                         |
| Cloud Platform | AWS S3, CloudFront, ACM          | Host, secure, and distribute the site          |
| DNS            | Namecheap                        | Route the custom domain to CloudFront          |
| IaC            | Terraform                        | Provision infrastructure consistently          |
| CI/CD          | GitHub Actions                   | Automate website deployment                    |
| Monitoring     | Prometheus, Grafana              | Collect and visualize metrics                  |
| Exporters      | Node Exporter, Blackbox Exporter | Expose host metrics and probe the live website |
| Alerting       | Alertmanager, Slack              | Route incidents to a communication channel     |
| Runtime        | Docker Compose                   | Run the local observability stack              |
| OS / Shell     | Linux, Bash                      | Local development and operations               |

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

> `monitoring/secrets/slack_webhook_url` is intentionally kept local and excluded from Git. The webhook is a secret and should never be committed.

## ⚙️ Prerequisites

The following tools and services were used to build and operate this project:

- AWS account
- Namecheap account (for custom domain configuration)
- GitHub repository with Actions enabled
- Terraform installed locally
- Docker and Docker Compose installed locally
- Slack workspace with an incoming webhook (for alert notifications)

## ⚡ Quick Start

### ▶️ Run the Portfolio Locally

Because the frontend is static, you can serve it with any simple local web server.

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

This project is structured as a step-by-step journey from Task 1 to Task 7.

- Tasks 1 to 6 cover how the application was built, deployed, automated, secured, and connected to a custom domain.
- Task 7 focuses on observability, showing how the system is monitored and operated in a production-style environment.

Each task section explains:

- why the task matters
- what was implemented
- how the components work together
- where to find the relevant files
- supporting screenshots as evidence

## 🛣️ Delivery Journey Summary

| Task   | Focus                   | Outcome                                                     |
| ------ | ----------------------- | ----------------------------------------------------------- |
| Task 1 | Frontend engineering    | Built a recruiter-focused portfolio interface               |
| Task 2 | AWS S3 static hosting   | Deployed the site as a public static website                |
| Task 3 | Terraform               | Converted infrastructure into code (IaC)                    |
| Task 4 | GitHub Actions CI/CD    | Automated deployments from GitHub to AWS                    |
| Task 5 | CloudFront + HTTPS      | Enabled CDN delivery and secure HTTPS access                |
| Task 6 | Custom domain           | Connected domain via Namecheap, ACM, and CloudFront         |
| Task 7 | Monitoring and alerting | Implemented observability, dashboards, and Slack alerts     |

## 🧩 Task 1: Frontend Engineering

### 🎯 Objective

Build a clean, recruiter-focused portfolio frontend that serves as the application layer for the rest of the DevOps workflow.

### 💡 Why This Task Matters

Without a real application layer, the project would be limited to infrastructure. Task 1 establishes a visible product surface that is later deployed, automated, secured, and monitored throughout the DevOps lifecycle.

### ⚙️ What Was Implemented

- Sticky navigation for quick section access
- Hero section with a clear DevOps value proposition
- About, Skills, Projects, Resume, and Contact sections
- Theme toggle and refined UI interactions
- Project cards designed to showcase real engineering work

### 📂 Key Files

- `index.html`
- `style.css`
- `script.js`

### 🔍 How It Works

The frontend is intentionally simple in technology but deliberate in design:

- `index.html` defines the structure and content
- `style.css` manages layout, responsiveness, and theming
- `script.js` handles interactivity and UI behavior

This simplicity becomes an advantage later, as static assets are easy to host on S3 and distribute through CloudFront.

### 📸 Evidence

The application was fully functional locally before any cloud integration:

![Local portfolio website during frontend development](assets/local_website.png)

### 🧠 What A Learner Should Notice

- A simple static frontend is sufficient to build a meaningful DevOps project
- Starting with a clean application layer simplifies later infrastructure and deployment stages

## ☁️ Task 2: AWS S3 Static Hosting

### 🎯 Objective

Deploy the portfolio to AWS, making it publicly accessible over the internet.

### 💡 Why This Task Matters

Task 1 established the application layer. Task 2 provides a real cloud runtime environment, transitioning the project from local development to public deployment.

### ➕ What Was Added

- S3 bucket for static website hosting
- Static website hosting configuration
- Public access configuration for content delivery
- Upload of website assets to the bucket

### ⚙️ How S3 Hosting Works Here

Amazon S3 can serve static assets such as:

- HTML
- CSS
- JavaScript
- Images
- PDF files

At this stage, requests are served directly from the S3 website endpoint. This makes the application publicly accessible, but it still lacks:

- CDN-based distribution
- HTTPS support
- Custom domain integration

These limitations are addressed in later tasks.

### 📸 Evidence

The S3 bucket was created for the portfolio:

![S3 bucket created for the portfolio website](assets/S3_Bucket_Created.png)

Static website hosting was enabled:

![Static website hosting enabled on the S3 bucket](assets/Static_Hosting_Enabled.png)

The application became publicly accessible via the S3 endpoint:

![Portfolio website accessible through the early hosted URL](assets/live_website.png)

### 🧠 What A Learner Should Notice

- S3 provides a simple and cost-effective entry point for hosting static applications
- Direct S3 hosting is useful for initial deployment, but not sufficient for production-grade delivery due to lack of HTTPS and CDN support

## 🏗️ Task 3: Terraform Infrastructure as Code

### 🎯 Objective

Replace manual AWS configuration with Terraform, making the infrastructure repeatable, version-controlled, and easier to manage.

### 💡 Why This Task Matters

Manual setup through the AWS Console is difficult to reproduce, audit, and maintain. Terraform enables infrastructure to be defined as code, which is a core DevOps practice for building consistent and reliable environments.

### 📂 Key Terraform Files

- [`terraform/versions.tf`](terraform/versions.tf)
- [`terraform/main.tf`](terraform/main.tf)
- [`terraform/variables.tf`](terraform/variables.tf)
- [`terraform/outputs.tf`](terraform/outputs.tf)
- [`terraform/terraform.tfvars`](terraform/terraform.tfvars)

### ⚙️ What Terraform Now Manages

- S3 bucket and static website configuration
- Ownership controls and public access settings
- Bucket policy for content delivery
- CloudFront distribution
- ACM certificate request
- Certificate validation configuration
- Custom domain aliases for CloudFront
- Outputs used for DNS configuration and verification

### 📈 How This Improved The Project

**Before Terraform:**

- Infrastructure changes were manual and click-based
- Reproducibility was limited
- Documentation relied on memory and screenshots

**After Terraform:**

- Infrastructure is defined, version-controlled, and reviewable
- Changes are easier to track and reason about
- CloudFront and custom domain integration became more structured and reliable

### 🧠 Important Learning Note

This repository currently uses a local Terraform state file as part of the learning process. In a production environment, a remote backend (e.g., S3 with DynamoDB state locking) should be used to enable collaboration and prevent state conflicts.

### 🧠 What A Learner Should Notice

- Terraform is not only for provisioning resources; it also improves documentation by defining the desired state in code
- Once infrastructure is codified, automation (CI/CD) and advanced configurations such as custom domains become significantly easier to implement

## 🔄 Task 4: GitHub Actions CI/CD

### 🎯 Objective

Automate deployments so that every push to `main` updates the live site without manual intervention.

### 💡 Why This Task Matters

This is the stage where the project transitions from static hosting to continuous delivery. The application is no longer updated manually, but through a repeatable and automated pipeline.

### 📂 Workflow File

- [`.github/workflows/deploy.yml`](.github/workflows/deploy.yml)

### ⚙️ What The Workflow Does

On every push to `main`, the workflow:

- Checks out the repository
- Configures AWS credentials using GitHub Secrets
- Syncs static assets to the S3 bucket
- Invalidates the CloudFront cache to ensure fresh content is served

### ❗ Why CloudFront Invalidation Matters

CloudFront caches content at edge locations. Without invalidation, users may continue to receive stale assets even after deployment.

Including cache invalidation ensures that updates are propagated immediately, making the deployment pipeline more reliable and production-ready.

### 📸 Evidence

The deployment workflow completed successfully:

![Successful GitHub Actions deployment workflow](assets/Successful_GitHub_Actions.png)

### 🧠 What A Learner Should Notice

- CI/CD is not limited to applications with build steps; static sites also benefit from automated deployment pipelines
- A complete delivery pipeline must account for caching layers such as CloudFront

## 🔐 Task 5: CloudFront + HTTPS

### 🎯 Objective

Introduce CloudFront in front of S3 to enable HTTPS delivery and improve performance through CDN distribution.

### 💡 Why This Task Matters

S3 website endpoints are suitable for initial hosting, but they are not ideal as a production-facing entry point. CloudFront enhances the architecture by providing:

* HTTPS support
* Global edge caching
* Improved performance and reduced latency
* A scalable foundation for custom domain integration

### ➕ What Was Added

* CloudFront distribution
* HTTPS delivery via CloudFront
* HTTP to HTTPS redirection
* CDN-backed access layer in front of S3
* Cache invalidation integration with GitHub Actions

### 🔄 How Request Flow Changed

**Before Task 5:**

```text
User -> S3 website endpoint
```

**After Task 5:**

```text
User -> CloudFront -> S3 website bucket
```

This represents a key architectural improvement, as end users now interact with a CDN layer instead of directly accessing the S3 origin.

### ⚙️ How CloudFront Works in This Setup

* CloudFront acts as the public entry point for the application
* It retrieves content from the S3 bucket (origin)
* Frequently requested content is cached at edge locations
* HTTPS is handled at the CloudFront layer
* Users are automatically redirected from HTTP to HTTPS

### 📸 Evidence

CloudFront became the secure public delivery layer:

![CloudFront distribution used to deliver the portfolio over HTTPS](assets/deployed_cloudfront.png)

### 🧠 What A Learner Should Notice

* CloudFront acts as the entry point for production-style delivery of static applications
* Introducing a CDN layer enables HTTPS, improves performance, and prepares the system for custom domain integration
* Separating the origin (S3) from the delivery layer (CloudFront) is a key architectural pattern in cloud systems

## 🌍 Task 6: Custom Domain Integration with Namecheap, ACM, and CloudFront

### 🎯 Objective

Replace the default CloudFront URL with a branded custom domain while maintaining an infrastructure-driven setup.

### 💡 Why This Task Matters

This step transforms the project from a technically functional deployment into a production-style system. A custom domain is not only about branding—it demonstrates:

* TLS/SSL certificate management
* DNS-based domain validation
* Domain routing and resolution
* CDN alias configuration

---

### 🌐 Final Domain Result

* `https://philipoludolamu.com`
* `https://www.philipoludolamu.com`

### 1️⃣ Step 1: Terraform Requests the ACM Certificate

The initial Terraform apply requests an ACM certificate and outputs the DNS validation records required for domain verification.

This is critical because CloudFront requires ACM certificates to be provisioned in the `us-east-1` region.

![Terraform output for custom domain and ACM setup](assets/terraform_apply_custom_domain.png)

### 2️⃣ Step 2: Add DNS Validation Records in Namecheap

The ACM-generated CNAME records are added in Namecheap to validate ownership of:

* `philipoludolamu.com`
* `www.philipoludolamu.com`

![Namecheap ACM DNS validation records](assets/namecheap_acm_validation_records.png)

### 3️⃣ Step 3: ACM Issues the Certificate

After DNS propagation, ACM validates the records and issues the certificate.

![ACM certificate issued for the custom domain](assets/ACM_certificate_issued.png)

### 4️⃣ Step 4: Attach the Certificate to CloudFront

The CloudFront distribution is updated with:

* Alternate domain names (aliases)
* The validated ACM certificate

This enables secure HTTPS delivery for the custom domain.

![CloudFront custom domain configuration](assets/cloudfront_custom_domain_config.png)

### 5️⃣ Step 5: Configure DNS Routing in Namecheap

DNS records are configured to route traffic:

* Root domain (`@`) → CloudFront
* `www` subdomain → CloudFront

![Namecheap routing records pointing to CloudFront](assets/Namecheap_routing_records.png)

### 6️⃣ Step 6: Validate the Live Domain

The application becomes accessible over HTTPS using the custom domain, which now serves as the primary public entry point.

![Live portfolio website on the custom domain](assets/live_custom_domain_root.png)

### 🧠 What A Learner Should Notice

* DNS validation and DNS routing serve different purposes and occur at different stages
* Custom domain integration involves coordination between multiple systems: Terraform, ACM, CloudFront, and an external DNS provider
* DNS-level URL redirects are different from CloudFront alias-based routing
* Proper sequencing (certificate → validation → CloudFront → DNS routing) is critical for a successful setup

## 📡 Task 7: Monitoring and Alerting with Prometheus, Grafana, Alertmanager, Blackbox Exporter, and Slack

### 🎯 Objective

Introduce observability into the system so the application is not only deployed, but also monitored, analyzed, and capable of triggering alerts when issues occur.

### 💡 Why Task 7 Matters

Most portfolio projects stop at deployment. In real-world systems, operational visibility is critical:

* Is the system healthy?
* Are infrastructure resources performing correctly?
* Is the public application reachable?
* Can incidents be detected automatically?
* Can stakeholders be notified when issues occur and when they are resolved?

Task 7 addresses these operational requirements.

### 📊 Monitoring Stack At A Glance

| Component         | Role in this project                           |
| ----------------- | ---------------------------------------------- |
| Prometheus        | Scrapes metrics and evaluates alert rules      |
| Grafana           | Visualizes infrastructure and application data |
| Node Exporter     | Exposes host-level metrics (CPU, memory)       |
| Blackbox Exporter | Probes the public website endpoint             |
| Alertmanager      | Routes alerts to notification channels         |
| Slack             | Receives firing and resolved alerts            |

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

The monitoring environment was initialized using Docker Compose:

```bash
cd monitoring
docker compose up -d
```

![Docker Compose running the initial monitoring stack](assets/docker_compose_running.png)

#### 2️⃣ Step 2: Verify Prometheus Self-Scraping

Prometheus was configured to scrape itself to validate:

* Service availability
* Correct scrape configuration
* Metric collection functionality

The `up` metric returned `1`, confirming a healthy target:

![Prometheus targets page showing the self-scrape job](assets/prometheus_targets.png)

![Prometheus up query result](assets/prometheus_up_query.png)

#### 3️⃣ Step 3: Connect Grafana to Prometheus

Grafana was integrated with Prometheus as a data source:

* Manual verification via UI
* Query validation in Explore view

![Grafana Prometheus datasource view](assets/grafana_prometheus_datasource.png)

![Grafana Explore up query result](assets/grafana_explore_up_query.png)

The setup was later improved by provisioning the data source from code, eliminating manual configuration:

![Provisioned Prometheus datasource in Grafana](assets/grafana_provisioned_datasource.png)

#### 4️⃣ Step 4: Add Node Exporter for Host Metrics

Node Exporter was introduced to expose system-level metrics:

* CPU usage
* Memory usage

Prometheus successfully scraped these metrics:

![Node Exporter container running alongside the stack](assets/node_exporter_container_running.png)

![Prometheus targets with Node Exporter included](assets/prometheus_targets_with_node_exporter.png)

![Prometheus query for Node Exporter CPU metrics](assets/prometheus_node_exporter_query.png)

![Grafana query for Node Exporter metrics](assets/grafana_node_exporter_query.png)

#### 5️⃣ Step 5: Build Dashboards in Grafana

Dashboards were provisioned automatically from configuration files:

![Grafana dashboard loaded under the project folder](assets/grafana_dashboard_loaded.png)

![Grafana dashboard view for the project](assets/grafana_dashboard_view.png)

Expanded dashboards included:

* CPU utilization
* Memory usage
* Exporter health

![Grafana dashboard showing CPU and memory panels](assets/grafana_cpu_memory_dashboard.png)

#### 6️⃣ Step 6: Add Alert Rules in Prometheus

Prometheus alerting rules were introduced to detect failures.

Example alert:

```promql
up{job="node-exporter"} == 0
```

Triggers when Node Exporter is down for more than one minute.

![Prometheus alert rule loaded and inactive](assets/prometheus_alert_rule_loaded.png)

![Prometheus alert firing for Node Exporter downtime](assets/prometheus_alert_firing.png)

#### 7️⃣ Step 7: Integrate Alertmanager

Alertmanager was added to route alerts:

![Alertmanager container running with the monitoring stack](assets/alertmanager_container_running.png)

![Alertmanager UI running locally](assets/alertmanager_ui.png)

![Alertmanager receiving the firing alert](assets/alertmanager_alert_firing.png)

#### 8️⃣ Step 8: Add Blackbox Exporter for Service Monitoring

Blackbox Exporter was configured to probe:

```text
https://philipoludolamu.com
```

Key metrics:

* `probe_success`
* `probe_duration_seconds`

![Prometheus blackbox target for the live portfolio website](assets/prometheus_blackbox_target.png)

![Prometheus probe\_success query result](assets/prometheus_probe_success.png)

![Prometheus probe\_duration\_seconds query result](assets/prometheus_probe_duration.png)

#### 9️⃣ Step 9: Expand Alert Rules for Website Monitoring

New alerts were added:

* `PortfolioWebsiteDown`
* `PortfolioWebsiteSlow`

These monitor:

* Website availability
* Response latency

![Prometheus alert rules including website-specific alerts](assets/portfolio_alert_rules_loaded.png)

#### 🔟 Step 10: Build Final Unified Dashboard

The final dashboard combines:

* Infrastructure metrics
* Service availability
* Performance indicators

![Full Grafana monitoring dashboard for the portfolio](assets/grafana_full_monitoring_dashboard.png)

#### 📣 Step 11: Send Alerts to Slack

Alertmanager was configured with a Slack webhook:

```text
monitoring/secrets/slack_webhook_url
```

* Alerts are sent when issues occur
* Recovery notifications are sent when resolved

![Slack firing alert notification](assets/slack_alert_firing.png)

![Slack resolved alert notification](assets/slack_alert_resolved.png)

### 🧪 How To Reproduce the Main Alert Test

```bash
cd monitoring
docker compose stop node-exporter
```

Wait ~1 minute, then verify:

* Prometheus Alerts
* Alertmanager Alerts
* Slack notifications

To restore:

```bash
docker compose start node-exporter
```

## 🧪 Failure Testing & Validation

To ensure the monitoring and alerting system behaves correctly under real-world conditions, controlled failure scenarios were intentionally simulated and observed end-to-end.

### 🔻 Infrastructure Failure Test (Node Exporter)

The Node Exporter container was stopped to simulate a host-level monitoring failure:

```bash
docker compose stop node-exporter
```

**Observed behavior:**

* Prometheus marked the target as `DOWN`
* Alert rule `NodeExporterDown` transitioned to `FIRING`
* Alertmanager received and processed the alert
* Slack received a real-time incident notification

![Prometheus alert firing for Node Exporter downtime](assets/prometheus_alert_firing.png)

![Slack firing alert notification](assets/slack_alert_firing.png)

After restarting the container:

```bash
docker compose start node-exporter
```

* Alert transitioned to `RESOLVED`
* Slack received a recovery notification

![Slack resolved alert notification](assets/slack_alert_resolved.png)

### 🌐 Application Availability Test (Blackbox Exporter)

The live portfolio website was monitored using Blackbox Exporter to validate external uptime detection.

**Observed behavior during failure conditions:**

* Blackbox probe failed (`probe_success = 0`)
* Prometheus triggered `PortfolioWebsiteDown`
* Alertmanager routed the alert
* Slack received a firing alert notification

Once the service recovered:

* Probe returned to success (`probe_success = 1`)
* Alert resolved automatically
* Slack received recovery notification

### ⚡ Key Validation Outcomes

* Alerts trigger only after defined thresholds (reducing false positives)
* Alert lifecycle is correctly handled (`FIRING → RESOLVED`)
* Slack integration provides real-time incident visibility
* Monitoring system detects both infrastructure and application failures
* End-to-end alert pipeline (Prometheus → Alertmanager → Slack) is fully validated

### 💥 Why This Matters

This validation demonstrates that the system is not only deployed, but also **operationally reliable**.

* Monitoring is actively verified, not assumed
* Failure scenarios are tested and observed
* Alert delivery is confirmed in real time

This reflects real-world DevOps and Site Reliability Engineering (SRE) practices.

### 💪 Why Task 7 Strengthens the Project

Task 7 transforms the project from a static deployment into a **production-style observable system**.

It shifts the focus from:

```text
"I can deploy a website"
```

to:

```text
"I can deploy, monitor, detect failures, and respond to incidents"
```

This progression reflects real-world DevOps and Site Reliability Engineering (SRE) responsibilities, where operating systems reliably is as important as deploying them.

## 🛠️ Troubleshooting and Lessons Learned

### ⚠️ Browser Caching Can Mask Recent Changes

During development, browser caching affected:

* CSS updates
* Resume (PDF) updates
* Image replacements

A hard refresh was required to ensure the latest assets were loaded:

```text
Ctrl + Shift + R
```

### ⚠️ Docker Port Conflicts

Running multiple services locally resulted in port conflicts with previously running containers.

This was resolved by assigning custom host ports:

* Grafana → `3001`
* Prometheus → `9091`
* Alertmanager → `9094`
* Node Exporter → `9101`
* Blackbox Exporter → `9116`

This ensured all services remained accessible without interfering with each other.

### ⚠️ Container Restart vs Recreate

In cases where configuration files or mounted volumes were updated, restarting containers did not always apply changes.

Forcing container recreation ensured that updates were properly reflected:

```bash
docker compose up -d --force-recreate
```

### ⚠️ Git Commit Scope Confusion (Subdirectory Commits)

At one point, commits were made from inside the `terraform/` directory. Although `git add .` was used, only changes within that directory were staged and committed.

This led to a situation where:

* Monitoring files were not included
* README and frontend updates were not pushed
* GitHub reflected outdated project state

**Lesson learned:**

> Always run Git commands from the repository root to ensure all changes are included.

### ⚠️ Force Reset and History Rewrite Can Cause Data Loss

Using commands like:

```bash
git reset --hard
git push --force
```

resulted in loss of uncommitted local changes and overwriting of branch history.

This caused:

* Loss of monitoring configuration files
* Reversion of README and frontend updates

**Lesson learned:**

> Avoid destructive commands unless you fully understand their impact. Always commit or stash changes before performing resets.

### ⚠️ Detached HEAD State Is Unsafe for Development

While inspecting previous commits, the repository entered a **detached HEAD** state:

```bash
git checkout <commit-hash>
```

In this state:

* Changes are not attached to a branch
* Work can be lost if not saved to a new branch

**Lesson learned:**

> Always return to a branch (e.g., `recovery-7` or `main`) before making changes.

### ⚠️ Uncommitted Changes Can Be Lost During Branch Switching

Attempting to switch branches without committing changes resulted in Git blocking the operation:

```text
Your local changes would be overwritten by checkout
```

This highlighted the risk of losing work when switching contexts.

**Lesson learned:**

> Always commit or stash changes before switching branches.

### ⚠️ Importance of Git Stash for Temporary Recovery

During recovery, `git stash` played a critical role in preserving uncommitted work.

Using:

```bash
git stash list
git stash apply stash@{0}
```

allowed restoration of:

* CSS updates
* Index changes
* README edits

**Lesson learned:**

> `git stash` is a powerful safety tool for temporarily saving work without committing.

### ⚠️ CloudFront Caching Can Delay Website Updates

Even after successful deployment via GitHub Actions, changes were not immediately visible on the live website.

This was due to CloudFront caching old assets.

**Solution:**

* Ensure CloudFront invalidation runs in CI/CD
* Wait briefly for propagation

**Lesson learned:**

> Deployment success does not always mean immediate visibility — caching layers must be considered.

## 🧠 Key Takeaway

This project reinforced that DevOps is not just about building systems, but also about:

```text
debugging → recovering → understanding → improving
```

Each issue provided deeper insight into:

* Git workflows and recovery strategies
* Infrastructure behavior
* Deployment and caching mechanisms

### 🔒 Secret Management for Slack Webhooks

Slack webhook URLs are treated as sensitive credentials and must never be committed to version control.

In this project, the webhook is stored in a gitignored local file and injected into the Alertmanager container at runtime.

This approach prevents accidental exposure of secrets and aligns with secure configuration practices commonly used in production environments, where sensitive values are externalized and managed outside of source code.

### 🌐 DNS Validation vs DNS Routing

DNS validation (for ACM certificates) and DNS routing (for directing traffic) serve different purposes and occur at different stages.

Understanding this distinction is essential for successfully configuring custom domains.

## 🏁 Final Outcome

This project demonstrates the ability to design, deploy, and operate a production-style DevOps system:

* Build a recruiter-facing frontend and treat it as a real application workload
* Provision AWS infrastructure using Terraform
* Automate deployments using GitHub Actions
* Secure delivery using CloudFront, ACM, and a custom domain
* Collect infrastructure metrics using Prometheus and Node Exporter
* Monitor application availability using Blackbox Exporter
* Visualize system metrics using Grafana
* Route alerts through Alertmanager
* Send incident notifications to Slack

In summary, the project evolved from a simple static website into a complete DevOps workflow covering:

```text
**build → deploy → secure → observe → alert → respond**
```

## 👤 Author

### **Philip Oludolamu**

* 🌐 Portfolio: https://philipoludolamu.com
* 💻 GitHub: https://github.com/holuphilix
* 🔗 LinkedIn: https://www.linkedin.com/in/philip-oludolamu

## 📄 License

This project is licensed under the **MIT License**.

You are free to use, modify, and share the code with attribution. See the [LICENSE](LICENSE) file for full details.
