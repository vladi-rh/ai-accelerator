# OpenShift Logging (Cluster Logging Operator)

Deploys the Red Hat OpenShift Logging operator (CLO) with a `ClusterLogForwarder` that collects **application**, **infrastructure**, and **audit** logs and forwards them to the LokiStack instance in `openshift-loki-operator`.

## Components

- **Operator** — Subscription for `cluster-logging` on the `stable-6.2` channel
- **Instance** — ServiceAccount, RBAC (4 ClusterRoleBindings), ClusterLogForwarder, LogFileMetricExporter

## Storage Trade-offs

The LokiStack is configured as `1x.demo` backed by an in-cluster MinIO with a 20Gi PVC. This is suitable for **dev/lab environments only**.

- **Audit logs** are the highest-volume log type. On a busy cluster they can generate several GB/day. On a quiet lab cluster, expect hundreds of MB/day.
- **Retention** is set to **7 days** on the LokiStack (`limits.global.retention.days: 7`). Loki automatically deletes data older than this.
- **If MinIO fills up**, Loki stops ingesting new logs but does not crash. Existing logs remain queryable until retention prunes them or you expand storage.

## How to manage storage

### Check MinIO disk usage

```bash
oc exec -n openshift-loki-operator deploy/loki-minio -- df -h /data
```

### Reduce retention (e.g. to 3 days)

Edit `components/operators/loki/instance/base/lokistack.yaml`:

```yaml
spec:
  limits:
    global:
      retention:
        days: 3
```

### Per-tenant retention

You can set different retention per log type to keep infrastructure/app logs longer while pruning audit logs sooner:

```yaml
spec:
  limits:
    tenants:
      application:
        retention:
          days: 7
      infrastructure:
        retention:
          days: 7
      audit:
        retention:
          days: 2
```

### Expand MinIO storage

Edit the PVC size in `components/operators/loki/instance/base/minio.yaml` and ensure the StorageClass supports volume expansion (`allowVolumeExpansion: true`).

### Stop collecting audit logs

Remove `audit` from `inputRefs` in `components/operators/openshift-logging/instance/base/clusterlogforwarder.yaml`:

```yaml
pipelines:
  - name: default-lokistack
    inputRefs:
      - application
      - infrastructure
```

## Production considerations

For production use, replace:
- MinIO with a managed object store (AWS S3, ODF, etc.)
- `1x.demo` with `1x.extra-small` or larger LokiStack size
- Add node tolerations/affinity for infra nodes
