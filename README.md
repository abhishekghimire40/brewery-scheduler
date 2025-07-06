# Brewery-Scheduler

<!--toc:start-->
- [Brewery-Scheduler](#brewery-scheduler)
  - [What’s in place right now](#whats-in-place-right-now)
    - [Current Schema](#current-schema)
  - [Getting it running locally](#getting-it-running-locally)
<!--toc:end-->

A small side-project to move a brewery  or a pub shift planning from paper to a web app.  
So far I’ve laid the foundations (database, migrations, API stub, and dev tooling).  
Below is a quick tour of what’s done and how to spin it up on your laptop.

---

## What’s in place right now

| Layer | Tools & libraries |
|-------|------------------|
| **Backend** | Go 1.22 · Gin · oapi-codegen v2 |
| **Database** | PostgreSQL  (Docker) · Goose migrations · pgcrypto for UUIDs |
| **Frontend** |  NOT DECIDED YET BUT WILL PROBABLY GO WITH REACT + TAILWIND|
| **Dev helpers** | Docker Compose (Postgres + pgAdmin) · Makefile targets |

---

### Current Schema

| Table | Purpose |
|-------|---------|
| **users** | login identity – email, password hash, soft-delete flag |
| **employees** | 1-to-1 with users – roster role, hire date, active flag |
| **role enum** | `host`, `server`, `food_runner`, `bartender_north`, `bartender_south`, `cocktailer`, `kitchen_line`, `kitchen_prep` (just a basic one more can be added based on further requirements)|
 **shift_templates** | Recurring time blocks – weekday, start/end, label, active flag |
| **template_roles** | Default head-counts per template (`template_id`, `role`, `default_needed`) |

Migrations live in **`sql/schema/`**; Goose tracks them in `goose_db_version`.

---

## Getting it running locally

First setup .env file with all required fields then

```bash
# 1. start the database & pgadmin containers in detached mode
docker compose up -d postgres pgadmin

# 2. apply migrations (creates enum & tables)
make migrate-up

# 3. compile and launch the API 
make dev   # API available at http://localhost:8080
