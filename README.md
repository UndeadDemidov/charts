# Hot Fixed charts and Mirrors

A Helm chart repository combining two types of artifacts:

- **Hot Fixed charts** — charts with local fixes and customizations that haven't yet made it upstream or require specific changes
- **Mirrors** — mirrors of third-party charts for stable use of fixed versions, air-gapped environments, and independence from external sources

The repository is served via GitHub Pages and can be used as a regular Helm repo:

```bash
helm repo add undead https://UndeadDemidov.github.io/charts
helm repo update undead
helm search repo undead/
```

## Available charts

| Chart | Type | Description |
|-------|------|-------------|
| `cloudnative-pg` | Hot fix | CloudNativePG Operator for managing PostgreSQL in Kubernetes; includes CRD annotations |
| `nxs-universal-chart` | Mirror | Nixys universal Helm chart for deploying applications to Kubernetes |

### Chart details

- **cloudnative-pg** — upstream PR [cloudnative-pg/charts#812](https://github.com/cloudnative-pg/charts/pull/812): add custom labels and annotations for CRDs
- **nxs-universal-chart** — upstream: [github.com/nixys/nxs-universal-chart](https://github.com/nixys/nxs-universal-chart/)

## Repository management

- `make index` — update `index.yaml`
- `make verify` — verify the index
