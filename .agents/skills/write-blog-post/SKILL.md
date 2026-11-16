---
name: write-blog-post
description: >-
  Use this skill when creating, drafting, or reviewing a blog post in content/posts/
  to ensure it follows the blog's simple, practical 5-pillar structure, Hugo TOML
  frontmatter standards, and build verification rules.
---

# Write Blog Post

Write technical posts that explain hard-earned lessons in a **simple, direct, and practical** way—easy for the author to recall later and fast for readers to learn.

## 1. File & Frontmatter Rules

- **Location:** `content/posts/<slug>.md` (kebab-case; e.g., `002-docker-multi-stage-builds.md` or `slug-name.md`).
- **Language:** Strictly **English (`en-us`)**.
- **Format:** Use **TOML (`+++`)** frontmatter (matching `archetypes/default.md`):

```toml
+++
title = 'Clear, Descriptive Title'
date = 2026-11-16T12:00:00-03:00
description = 'One-sentence factual SEO description of what the post teaches.'
summary = 'One-sentence direct plain-text summary shown on the home and posts list.'
tags = ['tag1', 'tag2']
autonumber = false
draft = false
+++
```

- **Important:** Always fill `summary` with plain text (no Markdown headings, and avoid meta phrasing like *"Learn why X exists and what problems it solves"*—state the practical takeaway directly). Keep `autonumber = false` for a cleaner, simpler layout.
- **No duplicate `<h1>`:** Never add `# Title` at the top of the Markdown body; the `typo` theme renders `title` as `<h1>`. Start sections at `##`.

## 2. Mandatory Post Structure

Open with a 1–2 sentence hook explaining what the tool/technique is, then cover these **5 sections** in order:

1. **`## Why It Exists`** — The core reason the tool, pattern, or technique was created.
2. **`## The Problem It Solves`** — Concrete pain points, bottlenecks, or failure modes it prevents.
3. **`## How It Is Used`** — Minimal syntax, setup, or workflow to get started quickly.
4. **`## Practical Examples`** — Real, copy-pasteable commands or code snippets with language tags on fenced blocks.
5. **`## Best Practices`** — Actionable rules of thumb, gotchas, and when *not* to use it.

End with **`## References`** linking to official documentation or primary sources.

## 3. Writing Style

- Keep paragraphs short (2–4 lines) and prefer bullet lists for scannability.
- Explain *why* something matters before showing *how* to configure it.
- Verify every command, flag, and permission/version detail—do not guess.
- Cut filler phrases; optimize for clarity and speed of learning.

## 4. Verification

1. Run `make build` (`hugo --minify`) and confirm zero errors or warnings.
2. Check the generated entry in `public/index.html` and the post page to confirm clean formatting and summary rendering.

