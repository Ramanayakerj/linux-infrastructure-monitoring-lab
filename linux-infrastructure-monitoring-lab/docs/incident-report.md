# Incident Report: Nginx Website Outage

**Project:** Linux Server Administration & Infrastructure Monitoring Lab  
**Environment:** Ubuntu Server 26.04.1 LTS, Oracle VirtualBox  
**Incident type:** Simulated web service outage  
**Severity:** Lab exercise — non-production  
**Status:** Resolved

## 1. Incident Summary

A controlled outage was simulated by stopping the Nginx service on the application server (`192.168.56.10`).

The monitoring server (`192.168.56.20`) detected the resulting HTTP availability failure through Prometheus Blackbox Exporter.

After restarting Nginx, both the HTTP response and Prometheus probe metric confirmed successful recovery.

## 2. Infrastructure

| Component | Details |
|---|---|
| Application server | 192.168.56.10 |
| Monitoring server | 192.168.56.20 |
| Web server | Nginx |
| Metrics collection | Prometheus |
| HTTP availability checks | Blackbox Exporter |
| Visualization | Grafana |

## 3. Incident Detection

The following Prometheus query was used:

`probe_success{job="nginx-website"}`

During the simulated outage, the metric returned `0`, indicating an unsuccessful HTTP probe.

The monitoring system later returned `1` after recovery.

## 4. Investigation

The Nginx service was inspected using:

```bash
sudo systemctl status nginx --no-pager
sudo journalctl -u nginx -n 20 --no-pager
```

The service was intentionally stopped for this controlled test. The outage was not caused by an unexpected application crash.

## 5. Recovery Procedure

Nginx was restored using:

```bash
sudo systemctl start nginx
sudo systemctl is-active nginx
curl -I http://localhost
```

Verification results:

- Nginx service: `active`
- HTTP response: `200 OK`
- Prometheus availability metric: `probe_success = 1`

## 6. Root Cause

The Nginx service was intentionally stopped using `systemctl` to simulate a production-style web service outage in a non-production lab.

## 7. Lessons Learned

- Linux service status and application availability should be monitored separately.
- Blackbox Exporter detects HTTP failures that system metrics alone may not reveal.
- Monitoring should be tested using controlled failure scenarios.
- Recovery must be confirmed through both service checks and external HTTP monitoring.

## 8. Evidence

Add screenshots of the service outage, Prometheus probe failure, service restoration, and successful HTTP response.

**Outcome:** Successful detection, investigation, recovery, and verification of a simulated Nginx outage.

