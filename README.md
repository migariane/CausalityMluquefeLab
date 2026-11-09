# CausalityMluquefeLab

Website for the causality research group led by Miguel Ángel Luque Fernández
(Department of Statistics and Operations Research, University of Granada),
built to promote the work of its PhD students.

**Status: scaffold.** The site renders, but most content is marked
`TODO` and must be filled in by the people concerned. Nothing here is
invented.

## Build

The site is **bilingual**: English at `/`, Spanish at `/es/`. Build both
with the script, which renders each language and assembles them into one
`_site/` tree:

```bash
./build.sh
```

Preview locally with live reload (English only; run it again inside
`es/` for the Spanish version):

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

The repository is **public** and GitHub Pages is **enabled** (Source: GitHub
Actions). The URL is https://migariane.github.io/CausalityMluquefeLab/.

**Current blocker:** the deploy workflow fails immediately with
`The job was not started because your account is locked due to a billing
issue.` This is account-level, not repo-level — the site will publish as soon
as the GitHub billing issue is resolved, with no further repo change.

To publish:

1. Resolve the billing lock on the `migariane` account.
2. Push to `main` (or re-run the workflow). `.github/workflows/publish.yml`
   renders both languages and deploys.

The workflow runs `./build.sh`, which also produces the Spanish version and
validates that both entry points exist and link to each other.

Note that GitHub Pages for a private repository requires GitHub Pro; on a
free plan the repository must be public to publish.

Do **not** reuse the parent repo's remotes. In particular the
`bioestadistica-fisioterapia` remote is deliberately push-blocked, and a
push from here would not merge — it would overwrite that course's history.
