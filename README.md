# Filipe Soares — Personal Blog

Source repository for [filipecsoares.github.io](https://filipecsoares.github.io/), a tech-oriented personal blog by Filipe Soares covering Software Architecture, Microservices, Docker, Kubernetes, Databases, Clean Code, and Web Security.

## Tech Stack

- **Static Site Generator:** [Hugo](https://gohugo.io/)
- **Theme:** [Typo](https://github.com/tomfran/typo) (Git submodule in `themes/typo`)
- **Hosting:** GitHub Pages (`filipecsoares/filipecsoares.github.io`)
- **Language:** English (`en-us`)

## Project Structure

```text
.
├── archetypes/       # Templates for new Hugo content
├── content/          # Markdown pages and blog posts
│   ├── about.md      # About page
│   └── posts/        # Published and draft articles
├── docs/             # Project planning and maintenance checklists
├── themes/typo/      # Typo theme (Git submodule)
├── hugo.toml         # Main Hugo and theme configuration
└── makefile          # Local development shortcuts
```

## Getting Started

### Prerequisites

- [Git](https://git-scm.com/)
- [Hugo (Extended)](https://gohugo.io/installation/)

### Clone with Submodules

```bash
git clone --recurse-submodules https://github.com/filipecsoares/personal-blog.git
cd personal-blog
```

If you already cloned without submodules:

```bash
git submodule update --init --recursive
```

### Run Locally

Start the local Hugo development server (including drafts):

```bash
hugo server --disableFastRender -D
```

Or using the Makefile:

```bash
make run
```

### Create a New Post

```bash
hugo new content/posts/my-new-post.md
```

### Build

```bash
hugo --minify
```

