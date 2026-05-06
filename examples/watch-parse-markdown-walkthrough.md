# Watch Parse Markdown Scope Walkthrough

This note is the quickest way to read the extra review model in `watch-parse-markdown-scope`.

| Case | Focus | Score | Lane |
| --- | --- | ---: | --- |
| baseline | token drift | 192 | ship |
| stress | grammar width | 216 | ship |
| edge | label quality | 232 | ship |
| recovery | error locality | 185 | ship |
| stale | token drift | 217 | ship |

Start with `edge` and `recovery`. They create the widest contrast in this repository's fixture set, which makes them better review anchors than the middle cases.

`edge` is the optimistic case; use it to make sure the scoring path still rewards strong signal.
