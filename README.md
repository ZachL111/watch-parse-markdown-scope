# watch-parse-markdown-scope

`watch-parse-markdown-scope` is a focused Ruby codebase around implement a Ruby parsers project for markdown incremental indexing, using append-only fixtures and checkpoint recovery checks. It is meant to be easy to inspect, run, and extend without a hosted service.

## Watch Parse Markdown Scope Walkthrough

I would read the project from the outside in: command, fixture, model, then roadmap. That keeps the parsers idea grounded in files that can be checked locally.

## How It Is Put Together

The core is a scoring model over demand, capacity, latency, risk, and weight. That keeps token shape, error labels, and grammar boundaries in one explicit decision path. The threshold is 160, with risk penalty 6, latency penalty 2, and weight bonus 2. The Ruby code keeps the module small and leans on Minitest for direct fixture checks.

## Reason For The Project

This is not a wrapper around a service. It is a self-contained project that shows how the model behaves when demand, capacity, latency, risk, and weight move in different directions.

## Capabilities

- Uses fixture data to keep error labels changes visible in code review.
- Includes extended examples for grammar boundaries, including `recovery` and `degraded`.
- Documents golden examples tradeoffs in `docs/operations.md`.
- Runs locally with a single verification command and no external credentials.
- Stores project constants and verification metadata in `metadata/project.json`.

## Data Notes

The extended cases are not random smoke tests. `degraded` keeps pressure on the review path, while `recovery` shows the model when capacity and weight are strong enough to clear the threshold.

## Where Things Live

- `lib`: library code
- `tests`: verification harness
- `fixtures`: compact golden scenarios
- `examples`: expanded scenario set
- `metadata`: project constants and verification metadata
- `docs`: operations and extension notes
- `scripts`: local verification and audit commands

## Getting It Running

Clone the repository, enter the directory, and run the verifier. No database server, cloud account, or token is required.

## Command Examples

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File scripts/verify.ps1
```

This runs the language-level build or test path against the compact fixture set.

## Check The Work

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File scripts/audit.ps1
```

The audit command checks repository structure and README constraints before it delegates to the verifier.

## Tradeoffs

The scoring model is simple by design. More domain-specific behavior should be added through explicit adapters or extra fixture classes rather than hidden constants.

## Possible Extensions

- Add a loader for `examples/extended_cases.csv` and promote selected cases into the language test suite.
- Add a short report command that prints the score breakdown for a single scenario.
- Add malformed input fixtures so the failure path is as visible as the happy path.
- Add one more parsers fixture that focuses on a malformed or borderline input.
