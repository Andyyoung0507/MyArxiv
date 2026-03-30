# ArxivFeed User-Agent Fix Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Make GitHub Actions build and run a patched ArxivFeed so arXiv API requests include a descriptive `User-Agent` and handle rate-limit responses safely.

**Architecture:** Stop downloading the prebuilt `v0.1.4` binary directly. Instead, the workflow will download the upstream source tarball, apply a repository-owned patch, compile a release binary with Cargo, and run that binary. The patch will set a configurable `User-Agent`, avoid feeding non-XML 429 responses into the XML parser, and pause briefly between category requests.

**Tech Stack:** GitHub Actions, Bash, Rust, Cargo, patch, reqwest, tokio

---

### Task 1: Add a reusable upstream patch

**Files:**
- Create: `patches/arxivfeed-rate-limit.patch`

- [ ] **Step 1: Write the failing tests inside the upstream patch**

Add unit tests for:
- `arxiv_user_agent()` fallback and environment override behavior
- non-success arXiv responses being rejected before XML parsing

- [ ] **Step 2: Verify the tests fail against the unpatched upstream source**

Run after extracting upstream source:
`cargo test --manifest-path arxivfeed-src/Cargo.toml`

Expected: the new tests do not exist yet, and the current code still builds a client without a custom `User-Agent` and still feeds 429 text into XML parsing.

- [ ] **Step 3: Write the minimal upstream patch**

Patch upstream `src/main.rs` and `src/core/fetch.rs` to:
- build the client with `ARXIVFEED_USER_AGENT` fallback support
- sleep briefly between source requests
- retry on HTTP 429 and surface a clear error on non-XML responses

- [ ] **Step 4: Verify the patched upstream tests pass**

Run:
`cargo test --manifest-path arxivfeed-src/Cargo.toml`

Expected: PASS

- [ ] **Step 5: Commit**

```bash
git add patches/arxivfeed-rate-limit.patch
git commit -m "fix: patch arxivfeed api requests"
```

### Task 2: Update the workflow to build the patched source

**Files:**
- Modify: `.github/workflows/update-feed.yml`

- [ ] **Step 1: Write the failing workflow expectation**

Define the intended behavior:
- workflow no longer downloads the binary asset
- workflow downloads the upstream source tarball
- workflow applies `patches/arxivfeed-rate-limit.patch`
- workflow builds `arxivfeed` with Cargo
- workflow runs it with `ARXIVFEED_USER_AGENT`

- [ ] **Step 2: Replace the binary-download path with source-build steps**

Use:
- `dtolnay/rust-toolchain@stable`
- GitHub API source tarball download
- `patch -p1`
- `cargo build --release`

- [ ] **Step 3: Verify the workflow syntax locally**

Run:
`git diff --check`

Expected: no whitespace or merge-marker issues

- [ ] **Step 4: Commit**

```bash
git add .github/workflows/update-feed.yml
git commit -m "ci: build patched arxivfeed from source"
```

### Task 3: Verify the repository-owned integration path

**Files:**
- Modify: `.github/workflows/update-feed.yml`
- Create: `docs/superpowers/plans/2026-03-30-arxivfeed-user-agent-fix.md`
- Create: `patches/arxivfeed-rate-limit.patch`

- [ ] **Step 1: Extract the upstream source locally**

Run:
`curl.exe -sL https://api.github.com/repos/NotCraft/ArxivFeed/tarball/v0.1.4 -o arxivfeed-src.tar.gz`

- [ ] **Step 2: Apply the patch locally**

Run:
`tar -xzf arxivfeed-src.tar.gz --strip-components=1 -C arxivfeed-src`

Then:
`patch -p1 -d arxivfeed-src < patches/arxivfeed-rate-limit.patch`

Expected: patch applies cleanly

- [ ] **Step 3: Build and test the patched upstream locally**

Run:
`cargo test --manifest-path arxivfeed-src/Cargo.toml`

Expected: PASS

- [ ] **Step 4: Record any environment limits honestly**

If local Cargo dependency download is blocked, record that the patch application was verified but full build/test requires GitHub Actions or escalated network access.

