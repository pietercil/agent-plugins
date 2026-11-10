# Documentation Set lives as Markdown in the project repo, read on GitHub

Every Living Doc is Markdown in the project's own repository and is read directly on GitHub, by business and end users too. There is no Confluence publication and no generated documentation site. Claude can only keep docs current reliably when they sit in the same diff and the same PR as the code they describe. A second copy elsewhere would drift with nobody noticing, and a generated site adds build infrastructure without changing who can edit the docs.

## Considered Options

- **Confluence as source**: rejected. Docs live outside the PR, so code and docs get reviewed separately and drift apart.
- **Markdown source + publish to Confluence**: rejected. It keeps two copies, and people would edit the Confluence one.
- **Markdown source + generated static site (MkDocs)**: rejected for now. Revisit if non-Git readers find GitHub's rendering insufficient.
