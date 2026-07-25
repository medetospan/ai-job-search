# Search Queries for Job Scraper

<!-- SETUP: Customize these queries based on your skills, target roles, and location -->

## Installed portal CLIs (primary for `/scrape`)

`/scrape` discovers every portal skill under `.agents/skills/*/SKILL.md` and runs its CLI first. Shipped country-agnostic CLIs include `linkedin-search` and `freehire-search`; Danish demos and any skill you add with `/add-portal` are included the same way. You do **not** need a matching `site:` line below for those CLIs to run.

The `site:` query templates in this file are the **WebSearch fallback** — for portals without a CLI, company career pages, or when a CLI fails.

## Search Sites

Primary (your market's job boards - scaffold one with `/add-portal`):
- **hh.kz (HeadHunter Kazakhstan)** - largest general job board for Kazakhstan/CIS (no CLI shipped yet - use `/add-portal` to scaffold one, or WebSearch fallback below)
- **linkedin.com/jobs** - LinkedIn job listings (filter: Kazakhstan / Astana, and international remote/advisory); also covered by `linkedin-search` CLI
- **indeed.com** - broader international board, useful for remote/international advisory roles (WebSearch fallback until a CLI exists)
- (optional) health-tech-specific boards or company career pages for target organizations

Secondary (company career pages via Google):
- Direct Google searches with `site:` filters for known target companies

## Query Categories

Queries are grouped by priority. Each query should be combined with your location terms (e.g. your city, region, or metro area) where the site supports it.

**Note on scope:** This is a deliberately broad, exploratory search across the candidate's full target-role cluster (see `04-job-evaluation.md`), not a single ideal role. All four priority tiers below are in scope every run of `/scrape` - do not treat Priority 3/4 as "only if Priority 1/2 comes up empty."

### Priority 1: Healthcare Quality / Accreditation Advisor & Chief Quality Officer

These match the strongest and most direct career fit.

```
site:hh.kz "healthcare quality" OR "JCI accreditation" Astana OR Kazakhstan
site:hh.kz "Chief Quality Officer" OR "директор по качеству"
site:linkedin.com/jobs "Healthcare Quality Advisor" OR "Chief Quality Officer" Kazakhstan
site:linkedin.com/jobs "JCI accreditation" consultant
```

### Priority 2: Digital Health Director & AI Automation Lead (Healthcare)

These match the domain expertise + AI automation combination.

```
site:hh.kz "digital health" OR "цифровое здравоохранение" Kazakhstan
site:linkedin.com/jobs "Head of Digital Health" OR "Digital Health Director"
site:linkedin.com/jobs "AI Automation Lead" healthcare OR clinical
indeed.com "AI automation" healthcare director OR lead
```

### Priority 3: Healthcare Consulting Partner & Board/Advisor Roles

Adjacent roles that combine healthcare and strategic/advisory work.

```
site:linkedin.com/jobs "Healthcare Consulting" partner Kazakhstan OR remote
site:linkedin.com/jobs "Board Advisor" healthcare OR "health-tech"
site:linkedin.com/jobs "non-executive director" healthcare
```

### Priority 4: Broader Chief-Level / CEO Healthcare Roles

Wider net for leadership roles across healthcare organizations.

```
site:hh.kz "CEO" OR "генеральный директор" клиника OR медицинский центр
site:linkedin.com/jobs "CEO" healthcare Kazakhstan OR "Central Asia"
site:linkedin.com/jobs "Chief Executive" clinic network OR diagnostic
```

## Location Filter

When evaluating results, verify the location fits the candidate's stated flexibility (Astana-based, hybrid, full remote, or international advisory without relocation; open to relocation for the right role - see `01-candidate-profile.md`). Define acceptable areas:
- Astana and surrounding areas (base location)
- Almaty and other major Kazakhstan cities (acceptable - Mediscan/ACCREDO network cities)
- Fully remote or international advisory/board roles requiring no relocation (acceptable)
- Roles requiring relocation (borderline - not required, but flag for discussion rather than auto-reject; not a deal-breaker)
- (no "too far" tier - relocation is not a hard deal-breaker for this search)

## Date Filter

Only include jobs posted within the last 14 days, or with an application deadline that has not yet passed. If a posting date cannot be determined, include it but flag as "date unknown".

## Adapting Queries

If the user specifies a focus area, select queries from the matching category and also generate 2-3 custom queries for that focus. For example:
- "/scrape [focus_area]" -> relevant category queries + custom focus-specific queries
