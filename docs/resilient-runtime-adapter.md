# Resilient Runtime Adapter

This repository should use the shared resilient runtime through the dashboard API rather than embedding a second engine.

Authoritative runtime owner:

```text
quantam101/already-here-dashboard
```

Runtime API base path:

```text
/api/resilient-runtime
```

## Use cases for this repo

- SOC lab result validation.
- Evidence bundle preflight checks.
- Detection exercise scoring checks.
- Incident report data quality checks.
- Offline-friendly deterministic rubric validation.

## Adapter endpoints

```text
GET  /api/resilient-runtime/health
POST /api/resilient-runtime/execute
GET  /api/resilient-runtime/events
```

## Required environment variable

```text
ALREADY_HERE_DASHBOARD_URL=https://app.alreadyherellc.com
```

For local development:

```text
ALREADY_HERE_DASHBOARD_URL=http://127.0.0.1:8000
```

## Example validation payload

```json
{
  "query": "validate severity not null and describe",
  "records": [
    {"alert_id": "A-001", "severity": "high", "status": "triaged"}
  ],
  "schema_context": {"severity": "str", "status": "str"},
  "session_id": "soc-operator-training-platform"
}
```

## Boundary

Keep this repo focused on SOC curriculum, labs, scoring, and evidence workflows. The runtime engine remains centralized in the dashboard.
