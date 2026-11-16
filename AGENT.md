# AGENT.md — Project Guidelines for AI Assistants

This document defines the architecture, conventions, and rules for AI agents working in this repository.

## 1. Project Overview

- **Owner:** Filipe Soares
- **Purpose:** Personal technical blog hosted on GitHub Pages at `https://filipecsoares.github.io/`.
- **Target Deployment Repository:** `https://github.com/filipecsoares/filipecsoares.github.io`
- **Language:** Strictly **English (`en-us`)** for all public content, configuration, UI labels, documentation, and commit messages.
- **Generator & Theme:** Hugo + `typo` theme (`themes/typo` submodule from `https://github.com/tomfran/typo.git`).

## 2. Repository Structure & Rules

- `hugo.toml`: Central configuration for Hugo and the `typo` theme.
  - Keep `languageCode = 'en-us'` and `baseURL` pointing to `https://filipecsoares.github.io/`.
- `content/`: All site Markdown content.
  - `content/about.md`: Bio and background page.
  - `content/posts/`: Technical blog posts.
- `archetypes/default.md`: Template used when creating new content via `hugo new`.
- `themes/typo/`: External Git submodule. **Do not** manually edit files inside `themes/typo/` or try to push to upstream. Customizations to theme templates/styles must be done via Hugo's override mechanism in root `layouts/` or `assets/` if needed.
- `docs/`: Internal project documentation and improvement checklists.

## 3. Content & Editorial Standards

For writing or reviewing blog posts, always load and follow the workspace skill [write-blog-post](.agents/skills/write-blog-post/SKILL.md).

1. **Language & Tone:** Clear, simple, direct, and practical technical English. Proofread for grammar and typos.
2. **Post Structure:** Every post must cover: **Why It Exists**, **The Problem It Solves**, **How It Is Used**, **Practical Examples**, and **Best Practices** (plus **References**).
3. **Frontmatter Consistency:** Use **TOML `+++`** across all content files (`title`, `date`, `description`, `summary`, `tags`, `autonumber`, `draft`). Always set a plain-text `summary`.
4. **No Duplicate `<h1>`:** Do not repeat the post `title` as a `# Heading` at the top of the Markdown body; the theme renders `title` as `<h1>`. Start article sections at `##`.
5. **Post Naming:** Use descriptive, URL-friendly kebab-case filenames in `content/posts/` (e.g., `001-vacuum-analyze.md` or `slug-name.md`).
6. **Citations & Code:** Include accurate, runnable code snippets with language tags on fenced code blocks and cite official documentation at the end.

## 4. Git & Build Hygiene

- **Never commit build artifacts or lock files** once CI/CD is active (`public/`, `.hugo_build.lock`, `resources/_gen/` should remain in `.gitignore`).
- **Submodules:** Always ensure `themes/typo` is initialized before running Hugo commands. Do not commit broken or nested `.git` directories inside `public/`.
- **Commits:** Use Conventional Commits (`feat:`, `fix:`, `docs:`, `chore:`, `refactor:`, `ci:`).

## 5. Verification

Before considering any structural, configuration, or content change complete:
1. Run `hugo --minify` (when Hugo is available) to verify the site builds cleanly without template or config errors.
2. Verify Markdown formatting, links, and frontmatter syntax.
3. Keep `docs/checklist.md` updated as tasks are completed.

