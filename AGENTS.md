# AGENTS.md: Release Copilot Mocks

Instructions for AI coding agents working in this repository.

- Mock enterprise APIs used by `../release-copilot` (the agents repo). Routers copy the real vendor paths,
  JSON shapes, auth and error bodies; keep that fidelity, so real clients only need a different base URL.
- Scenario data: `src/release_copilot_mocks/scenarios/` (`base.py` world + `variants.py` edits). Each scenario's
  `expected` block is the golden label for the agents' evals; change it only together with the data.
- `/_admin` is a control plane for tests and evals; it must never be exposed to agents as a tool.
- No real secrets: every credential is a test value (see `.env.example`).
- `uv sync` then `uv run pytest`; tests must pass.
- Never run destructive git commands (reset --hard, push --force, branch -D) without asking.
