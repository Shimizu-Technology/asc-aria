# ASC + ARIA Rails API

Rails API backend for the private ASC + ARIA prototype.

## Boundaries

- Fake/sample data only.
- No real participant data, SSNs, DOBs, signatures, beneficiary data, documents, Relias data, or Airtable records.
- Controlled seeded knowledge and fake plan rules only.
- No live AI or production authentication in this foundation stage.

## Run locally

```bash
bundle install
bin/rails db:prepare
bin/rails server -p 3000
```

Health check:

```text
GET /api/v1/health
```

Seeded-data endpoints:

```text
GET /api/v1/bootstrap
GET /api/v1/plan_rules
GET /api/v1/knowledge_entries
GET /api/v1/admin/audit_events
```

## Verify

```bash
bin/rails test
bin/rubocop
bin/brakeman -q
bin/bundler-audit check
```
