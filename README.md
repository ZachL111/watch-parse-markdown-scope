# watch-parse-markdown-scope

`watch-parse-markdown-scope` is a compact Ruby repository for parsers, centered on this goal: Implement a Ruby parsers project for markdown incremental indexing, using append-only fixtures and checkpoint recovery checks.

## Why It Exists

I want this repository to be useful as a quick reading exercise: fixtures first, implementation second, verifier last.

## Watch Parse Markdown Scope Review Notes

The first comparison I would make is `label quality` against `error locality` because it shows where the rule is most opinionated.

## Features

- `fixtures/domain_review.csv` adds cases for token drift and grammar width.
- `metadata/domain-review.json` records the same cases in structured form.
- `config/review-profile.json` captures the read order and the two review questions.
- `examples/watch-parse-markdown-walkthrough.md` walks through the case spread.
- The Ruby code includes a review path for `label quality` and `error locality`.
- `docs/field-notes.md` explains the strongest and weakest cases.

## Architecture Notes

The repository has two validation layers: the original compact policy fixture and the domain review fixture. They are separate so one can change without hiding failures in the other.

The Ruby addition stays small enough to inspect in one sitting.

## Usage

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File scripts/verify.ps1
```

## Tests

That command is also the regression path. It verifies the domain cases and catches mismatches between the CSV, metadata, and code.

## Limitations And Roadmap

This remains a local project with deterministic fixtures. It does not depend on credentials, hosted services, or live data. Future work should add richer malformed inputs before widening the public API.
