# Project Improvement Checklist

Roadmap to bring the personal blog up to a professional, automated, and maintainable standard.

## 1. Git & Repository Hygiene
- [ ] Initialize `themes/typo` submodule (`git submodule update --init --recursive`) and update it to the latest compatible version.
- [ ] Fix the `public` submodule inconsistency: remove `public` entry from `.gitmodules` and remove `public/` and `.hugo_build.lock` from Git tracking (`git rm -r --cached public .hugo_build.lock`).
- [ ] Update `.gitignore` to ignore `public/`, `resources/_gen/`, `.hugo_build.lock`, OS files (`.DS_Store`, `Thumbs.db`), and editor temp files.
- [ ] Pin the Hugo Extended version (e.g., `.hugo-version` or in CI workflow) and ensure Hugo is installed locally for previewing.

## 2. CI/CD & Automated Deployment
- [ ] Create `.github/workflows/deploy.yml` to build the site with `hugo --minify` on push to `main`.
- [ ] Configure the workflow to deploy the generated `public/` output to `filipecsoares/filipecsoares.github.io` (using a deploy key or GitHub token secret).
- [ ] Verify the live deployment on `https://filipecsoares.github.io/` after pushing.
- [ ] Clean up `makefile`: remove broken/legacy targets (`push_public`, `push_theme`, `all`) and keep useful local targets (`run`, `build`, `new-post`).

## 3. Hugo Configuration & SEO (`hugo.toml`)
- [ ] Add trailing slash to `baseURL = 'https://filipecsoares.github.io/'`.
- [ ] Enable `enableRobotsTXT = true`.
- [ ] Configure Open Graph (`og:*`) and Twitter Cards metadata (and check `themes/typo` support for `params` like `description`, social images, etc.).
- [ ] Review and update `hugo.toml` parameters for compatibility with the latest Hugo and `typo` theme versions (e.g., pagination, syntax highlighting, favicon/assets).
- [ ] Verify RSS feed (`/index.xml`) and `sitemap.xml` generation.

## 4. Content & Editorial Standards
- [ ] Fix typo in `content/about.md` (`"eading"` -> `"reading"`) and update bio to reflect current experience, role, and focus areas.
- [ ] Standardize frontmatter format across `archetypes/default.md`, `content/about.md`, and `content/posts/*` (TOML `+++` or YAML `---`).
- [ ] Enrich `archetypes/default.md` with `description`, `tags`, and `autonumber` fields.
- [ ] Remove the duplicate `# H1` heading in `content/posts/001-vacuum-analyze.md` and add a `description` field to its frontmatter.
- [ ] Add a custom favicon / social preview image if not already configured cleanly.

