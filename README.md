# import_ bengaluru website

The site content is intentionally separated from its design.

## What to edit

- `index.md` — event introduction, written in Markdown
- `_data/event.yml` — date, time, venue, RSVP, CFP, contact email and hero image
- `_data/partners.yml` — community partners
- `_data/agenda.yml` — schedule and sessions
- `_data/jobs.yml` — company job openings
- `_data/sponsors.yml` — sponsor message and contact email
- `Assets/` — event and partner images

Each partner entry can include `name`, `role`, `description`, `image` and `url`.
The website turns those entries into the rotating partner panel automatically.

Add a job to `_data/jobs.yml` with this shape. `poster` is optional:

```yml
- company: Example Company
  position: Python Engineer
  description: A short description of the role.
  link: https://example.com/jobs/python-engineer
  poster: /Assets/jobs/example-company.png
```

You do not need to edit `_layouts/default.html`; it contains the website design.

## Preview locally

```sh
bundle config set --local path vendor/bundle
bundle install
bundle exec jekyll serve --baseurl ""
```

Then open <http://localhost:4000>.

## Publish

Pushing `main` deploys the site to
<https://bangpypers.github.io/import_bengaluru/> through GitHub Actions.
