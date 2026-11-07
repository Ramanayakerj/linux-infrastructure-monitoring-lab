# Linux Server Administration & Infrastructure Monitoring Lab

A hands-on Linux infrastructure project demonstrating server administration, networking, web hosting, monitoring, troubleshooting, Bash automation, and backup management.

Built using free and open-source tools in a local Oracle VirtualBox environment.

## Project Overview

This lab simulates a small IT infrastructure environment using two Ubuntu Server virtual machines.

The application server hosts an Nginx website and exposes Linux system metrics. A dedicated monitoring server collects metrics using Prometheus, performs HTTP availability checks using Blackbox Exporter, and visualizes infrastructure health through Grafana.

The project also includes Bash automation, scheduled website backups, disk usage checks, and a controlled web service outage simulation.

## Infrastructure Architecture

| Server | Private IP Address | Services |
|---|---|---|
| app-server | 192.168.56.10 | Nginx, Node Exporter |
| monitor-server | 192.168.56.20 | Prometheus, Grafana, Blackbox Exporter |

Both virtual machines use VirtualBox Host-Only networking for private communication and NAT for internet access.

The Windows host manages the servers through SSH key-based authentication.

## Technology Stack

- Ubuntu Server 26.04.1 LTS
- Oracle VirtualBox
- Linux administration and systemd
- SSH and Linux networking
- Nginx
- Prometheus
- Prometheus Node Exporter
- Prometheus Blackbox Exporter
- Grafana OSS
- Bash scripting
- Cron
- Tar and gzip

## Implemented Features

### 1. Linux Server Administration

- Provisioned two Ubuntu Server virtual machines.
- Configured static private IP addresses using Netplan.
- Configured hostnames and network connectivity.
- Enabled SSH key-based remote administration.
- Managed services using systemctl and journalctl.

### 2. Web Server Deployment

- Installed and configured Nginx.
- Deployed a custom static IT Infrastructure Operations Portal.
- Configured a dedicated Nginx virtual host.
- Verified HTTP availability from the Windows host and monitoring server.

### 3. Infrastructure Monitoring

Configured Prometheus to collect Linux server metrics through Node Exporter.

Created a Grafana dashboard displaying:

- CPU utilization
- Memory utilization
- Root filesystem utilization
- Network traffic
- Application server availability
- Nginx website availability

### 4. HTTP Website Monitoring

Installed Blackbox Exporter on the monitoring server.

Configured Prometheus to probe:

`http://192.168.56.10`

The `probe_success` metric indicates whether the configured HTTP check succeeds.

### 5. Bash Automation

Created scripts for:

- Server health reporting
- Disk usage threshold checking
- Website and Nginx configuration backups

The disk alert script supports configurable thresholds and returns exit codes for healthy and warning conditions.

### 6. Backup and Recovery

- Created compressed website backup archives.
- Protected backup files with root-only permissions.
- Verified archive readability.
- Restored website files to a temporary directory.
- Compared restored files with their originals.
- Configured daily backup execution using cron.
- Implemented a seven-day backup retention policy.

### 7. Incident Simulation

Performed a controlled Nginx service outage.

Verified that:

1. Nginx entered the inactive state.
2. Prometheus recorded `probe_success = 0`.
3. Nginx was successfully restarted.
4. Prometheus recorded `probe_success = 1`.
5. The website returned HTTP 200 OK after recovery.

See [Incident Report](docs/incident-report.md).

## Key Commands

Check Nginx:

```bash
sudo systemctl status nginx
```

Check website availability:

```bash
curl -I http://localhost
```

Run the health-check script:

```bash
./scripts/health-check.sh
```

Run the disk alert script:

```bash
./scripts/disk-alert.sh 80
```

Run the website backup:

```bash
sudo ./scripts/backup-web.sh
```

## Screenshots

Screenshots of the Grafana dashboard, Prometheus monitoring results, website deployment, backup verification, and controlled outage simulation will be added to the `screenshots/` directory.

## Future Improvements

- Confirm unattended cron backup execution.
- Validate Grafana alert transitions during controlled failures.
- Add secure off-VM backup storage.
- Extend monitoring to additional services.
- Add automated configuration validation and recovery tests.

## Project Purpose

This project was built to develop practical skills relevant to Linux System Administration, Infrastructure Operations, Cloud Support, and Network Engineering roles.

It demonstrates the ability to deploy, monitor, troubleshoot, automate, and document a small Linux infrastructure environment.# Linux Server Administration & Infrastructure Monitoring Lab

A hands-on Linux infrastructure project demonstrating server administration, networking, web hosting, monitoring, troubleshooting, Bash automation, and backup management.

Built using free and open-source tools in a local Oracle VirtualBox environment.

## Project Overview

This lab simulates a small IT infrastructure environment using two Ubuntu Server virtual machines.

The application server hosts an Nginx website and exposes Linux system metrics. A dedicated monitoring server collects metrics using Prometheus, performs HTTP availability checks using Blackbox Exporter, and visualizes infrastructure health through Grafana.

The project also includes Bash automation, scheduled website backups, disk usage checks, and a controlled web service outage simulation.

## Infrastructure Architecture

| Server | Private IP Address | Services |
|---|---|---|
| app-server | 192.168.56.10 | Nginx, Node Exporter |
| monitor-server | 192.168.56.20 | Prometheus, Grafana, Blackbox Exporter |

Both virtual machines use VirtualBox Host-Only networking for private communication and NAT for internet access.

The Windows host manages the servers through SSH key-based authentication.

## Technology Stack

- Ubuntu Server 26.04.1 LTS
- Oracle VirtualBox
- Linux administration and systemd
- SSH and Linux networking
- Nginx
- Prometheus
- Prometheus Node Exporter
- Prometheus Blackbox Exporter
- Grafana OSS
- Bash scripting
- Cron
- Tar and gzip

## Implemented Features

### 1. Linux Server Administration

- Provisioned two Ubuntu Server virtual machines.
- Configured static private IP addresses using Netplan.
- Configured hostnames and network connectivity.
- Enabled SSH key-based remote administration.
- Managed services using systemctl and journalctl.

### 2. Web Server Deployment

- Installed and configured Nginx.
- Deployed a custom static IT Infrastructure Operations Portal.
- Configured a dedicated Nginx virtual host.
- Verified HTTP availability from the Windows host and monitoring server.

### 3. Infrastructure Monitoring

Configured Prometheus to collect Linux server metrics through Node Exporter.

Created a Grafana dashboard displaying:

- CPU utilization
- Memory utilization
- Root filesystem utilization
- Network traffic
- Application server availability
- Nginx website availability

### 4. HTTP Website Monitoring

Installed Blackbox Exporter on the monitoring server.

Configured Prometheus to probe:

`http://192.168.56.10`

The `probe_success` metric indicates whether the configured HTTP check succeeds.

### 5. Bash Automation

Created scripts for:

- Server health reporting
- Disk usage threshold checking
- Website and Nginx configuration backups

The disk alert script supports configurable thresholds and returns exit codes for healthy and warning conditions.

### 6. Backup and Recovery

- Created compressed website backup archives.
- Protected backup files with root-only permissions.
- Verified archive readability.
- Restored website files to a temporary directory.
- Compared restored files with their originals.
- Configured daily backup execution using cron.
- Implemented a seven-day backup retention policy.

### 7. Incident Simulation

Performed a controlled Nginx service outage.

Verified that:

1. Nginx entered the inactive state.
2. Prometheus recorded `probe_success = 0`.
3. Nginx was successfully restarted.
4. Prometheus recorded `probe_success = 1`.
5. The website returned HTTP 200 OK after recovery.

See [Incident Report](docs/incident-report.md).

## Key Commands

Check Nginx:

```bash
sudo systemctl status nginx
```

Check website availability:

```bash
curl -I http://localhost
```

Run the health-check script:

```bash
./scripts/health-check.sh
```

Run the disk alert script:

```bash
./scripts/disk-alert.sh 80
```

Run the website backup:

```bash
sudo ./scripts/backup-web.sh
```

## Screenshots

Screenshots of the Grafana dashboard, Prometheus monitoring results, website deployment, backup verification, and controlled outage simulation will be added to the `screenshots/` directory.

## Future Improvements

- Confirm unattended cron backup execution.
- Validate Grafana alert transitions during controlled failures.
- Add secure off-VM backup storage.
- Extend monitoring to additional services.
- Add automated configuration validation and recovery tests.

## Project Purpose

This project was built to develop practical skills relevant to Linux System Administration, Infrastructure Operations, Cloud Support, and Network Engineering roles.

It demonstrates the ability to deploy, monitor, troubleshoot, automate, and document a small Linux infrastructure environment.qq
