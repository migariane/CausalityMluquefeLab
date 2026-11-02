# CausalityMluquefeLab

Website for the causality research group led by Miguel Ángel Luque Fernández
(Department of Statistics and Operations Research, University of Granada),
built to promote the work of its PhD students.

**Status: scaffold.** The site renders, but most content is marked
`TODO` and must be filled in by the people concerned. Nothing here is
invented.

## Build

```bash
cd CausalityMluquefeLab
PATH="/usr/local/bin:$PATH" quarto render
```

Preview locally with live reload:

```bash
PATH="/usr/local/bin:$PATH" quarto preview
```

Output goes to `_site/` (git-ignored).

## Adding a PhD student

Each student gets one directory under `students/`, named
`firstname-lastname`, containing an `index.qmd` and a `photo.jpg`:

```
students/
├── index.qmd                  # listing page, generated from metadata
├── a-student/
│   ├── index.qmd
│   └── photo.jpg
└── another-student/
    ├── index.qmd
    └── photo.jpg
```

Copy `templates/student.qmd.txt` to `students/<name>/index.qmd` to start. The `students/index.qmd` listing and
the nav menu read from these files, so adding a directory is enough — no
other file needs editing.

## Adding a publication

Append a row to `publications/index.qmd`. Group by year, newest first.
Use the student's full name exactly as on their own page so the two agree.

## Conventions

- Spanish is the site language for the course material elsewhere in this
  repo, but **this site is in English** so students' work reaches an
  international audience. Say so if you want Spanish or bilingual.
- Numbers, DOIs, and author lists are copied from the source, never
  retyped from memory.
- Do not commit a student's contact details, thesis draft, or photo
  without their explicit consent.

## Deploying

The `.github/workflows/publish.yml` workflow renders and publishes to
GitHub Pages on every push to `main`. It requires a GitHub repository
with Pages enabled (Settings → Pages → Source: GitHub Actions).

Do **not** reuse the parent repo's remotes. In particular the
`bioestadistica-fisioterapia` remote is deliberately push-blocked, and a
push from here would not merge — it would overwrite that course's history.

Until a repository is created, the site is built locally only.
