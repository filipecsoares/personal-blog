# Project Improvement Checklist

Roadmap to bring the personal blog up to a professional, automated, and maintainable standard.

## 1. Git & Repository Hygiene
- [x] Initialize `themes/typo` submodule (`git submodule update --init --recursive`) and update it to the latest compatible version.
- [x] Fix the `public` submodule inconsistency: remove `public` entry from `.gitmodules` and remove `public/` and `.hugo_build.lock` from Git tracking (`git rm -r --cached public .hugo_build.lock`).
- [x] Update `.gitignore` to ignore `public/`, `resources/_gen/`, `.hugo_build.lock`, OS files (`.DS_Store`, `Thumbs.db`), and editor temp files.
- [ ] Pin the Hugo Extended version in CI workflow (`0.145.0` configured) and install Hugo Extended locally for previewing.

## 2. CI/CD & Automated Deployment
- [x] Create `.github/workflows/deploy.yml` to build the site with `hugo --minify` on push to `main`.
- [x] Configure the workflow to deploy the generated `public/` output to `filipecsoares/filipecsoares.github.io` (requires `ACTIONS_DEPLOY_KEY` secret in GitHub repo settings).
- [ ] Add `ACTIONS_DEPLOY_KEY` secret in GitHub and verify the live deployment on `https://filipecsoares.github.io/` after pushing.
- [x] Clean up `makefile`: remove broken/legacy targets (`push_public`, `push_theme`, `all`) and keep useful local targets (`run`, `build`, `clean`, `new-post`, `update-theme`).

## 3. Hugo Configuration & SEO (`hugo.toml`)
- [x] Add trailing slash to `baseURL = 'https://filipecsoares.github.io/'`.
- [x] Enable `enableRobotsTXT = true`.
- [x] Verify Open Graph (`og:*`) and canonical URL support (provided natively by the updated `themes/typo` `head.html` and `opengraph.html` partials).
- [ ] Run `hugo --minify` locally or in CI to verify compatibility of all `hugo.toml` parameters, RSS feed (`/index.xml`), and `sitemap.xml` with Hugo `0.145.0` and updated `typo`.

## 4. Content & Editorial Standards
- [x] Fix typo in `content/about.md` (`"eading"` -> `"reading"`).
- [x] Update `content/about.md` bio to reflect current experience, role, and focus areas.
- [x] Standardize frontmatter format across `archetypes/default.md`, `content/about.md`, and `content/posts/*` (TOML `+++`).
- [x] Enrich `archetypes/default.md` with `description`, `tags`, and `autonumber` fields.
- [x] Remove the duplicate `# H1` heading in `content/posts/001-vacuum-analyze.md` and add a `description` field to its frontmatter.
- [ ] Add a custom favicon / social preview image if not already configured cleanly.
