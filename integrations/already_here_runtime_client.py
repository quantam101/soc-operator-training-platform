from __future__ import annotations

import json
import os
import urllib.error
import urllib.request
from typing import Any


class AlreadyHereRuntimeClient:
    """Thin adapter for the dashboard-owned resilient runtime API.

    The runtime engine lives in quantam101/already-here-dashboard.
    This client avoids duplicating runtime code across repositories.
    """

    def __init__(self, base_url: str | None = None, timeout_seconds: float = 15.0) -> None:
        self.base_url = (base_url or os.environ.get("ALREADY_HERE_RUNTIME_URL") or "http://127.0.0.1:8000/api/resilient-runtime").rstrip("/")
        self.timeout_seconds = timeout_seconds

    def health(self) -> dict[str, Any]:
        return self._request("GET", "/health")

    def execute(
        self,
        query: str,
        records: list[dict[str, Any]],
        schema_context: dict[str, str] | None = None,
        session_id: str = "soc-operator-training-platform",
    ) -> dict[str, Any]:
        return self._request(
            "POST",
            "/execute",
            {
                "query": query,
                "records": records,
                "schema_context": schema_context or {},
                "session_id": session_id,
            },
        )

    def _request(self, method: str, path: str, payload: dict[str, Any] | None = None) -> dict[str, Any]:
        body = None if payload is None else json.dumps(payload).encode("utf-8")
        request = urllib.request.Request(
            f"{self.base_url}{path}",
            data=body,
            method=method,
            headers={"Content-Type": "application/json"},
        )
        try:
            with urllib.request.urlopen(request, timeout=self.timeout_seconds) as response:
                return json.loads(response.read().decode("utf-8"))
        except urllib.error.URLError as exc:
            return {
                "status": "unavailable",
                "mode": "adapter_offline",
                "errors": [str(exc)],
                "telemetry": {},
            }
