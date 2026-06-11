# ASC public content and asset sources

This branch turns the ARIA proof of concept into an ASC Trust website modernization concept. It uses a curated subset of public content and public image/logo assets from the existing ASC Trust website for private stakeholder review.

## Source pages reviewed

Public ASC Trust pages reviewed/scraped for copy, navigation, service categories, form categories, contact details, stats, and imagery:

- `https://www.asctrust.com/`
- `https://www.asctrust.com/about-asc/our-story/`
- `https://www.asctrust.com/about-asc/what-we-do/`
- `https://www.asctrust.com/about-asc/our-mission-values/`
- `https://www.asctrust.com/services/overview/`
- `https://www.asctrust.com/serving-participants/take-control/`
- `https://www.asctrust.com/serving-participants/stay-on-track/`
- `https://www.asctrust.com/serving-participants/maximize-your-contributions/`
- `https://www.asctrust.com/resources/forms/`
- `https://www.asctrust.com/contact/`

The scrape was intentionally limited to public pages and selected public media required for the proof-of-concept presentation.

## Local concept assets

The private concept preview stores selected ASC public site assets under:

```text
public/asc-assets/
```

Included asset types:

- ASC Trust logo/favicon
- team and participant imagery
- current participant education/chart images
- current core-value icons
- current partner-logo graphic

## Usage boundary

These assets and excerpts are included only so ASC stakeholders can review what a modernized replacement site could feel like using their existing public brand/content foundation.

Before production launch:

1. Confirm ASC approves all image/logo/content usage.
2. Replace scraped/compressed web assets with official source files where available.
3. Confirm testimonial, partner, address, service, and form copy with ASC.
4. Replace sample-only ARIA workflow data with approved demo or production-safe data.
5. Keep `noindex,nofollow` until ASC explicitly approves a public launch.

## Data boundary

The public website sections use public ASC Trust content. The secure support workflow still uses fictional sample participant data (`Bank of Mila`, `Malia Santos`) and remains disconnected from Relias, Airtable, authentication, and live AI.
