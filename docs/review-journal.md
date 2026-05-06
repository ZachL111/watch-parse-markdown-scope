# Review Journal

The repository goal stays the same: implement a Ruby parsers project for markdown incremental indexing, using append-only fixtures and checkpoint recovery checks. This note explains the added review angle.

The local checks classify each case as `ship`, `watch`, or `hold`. That gives the project a small review vocabulary that matches its parsers focus without claiming live deployment or external usage.

## Cases

- `baseline`: `token drift`, score 192, lane `ship`
- `stress`: `grammar width`, score 216, lane `ship`
- `edge`: `label quality`, score 232, lane `ship`
- `recovery`: `error locality`, score 185, lane `ship`
- `stale`: `token drift`, score 217, lane `ship`

## Note

A future change should add new cases before it changes the scoring rule.
