# Everse metadata schemas
A repository to describe metadata schemas used in the EVERSE project.

Most of these schemas will reuse existing vocabularies.


This is a solid choice. Using **independent releases** keeps your schemas modular and prevents "version fatigue" where a user has to update their `tools` implementation just because you changed a different schema like `metrics`.

Below is a draft you can add directly to your `README.md` (or a separate `RELEASING.md`). It explains the logic, the directory structure, and the step-by-step process for developers.

## Versioning & Release Policy

This repository uses **Independent Semantic Versioning** for each schema. This means the `tools` schema and the `indicators` schema have their own version numbers and release cycles.

### 1. Versioning logic

We follow [SemVer 2.0.0](https://semver.org/) convention.

### 2. Directory structure

To ensure stable URLs, we maintain the following structure:

```text
/schemas
  /[schema-name]
    /v1.0.0      <-- Immutable snapshot of version 1.0.0
    /v1.1.0      <-- Immutable snapshot of version 1.1.0
    /latest      <-- A copy of the most recent stable version
```

> **Note on `latest`:** The `latest` directory is what our `w3id.org` persistent identifiers point to. It must always be kept in sync with the highest stable version.


### 3. Developing and releasing a new schema version
(for maintainers)


Changes to the schemas are made in the `dev` directories. **NEVER** modify a previous version (e.g. `schemas/tools/v0.1.0`) directory.

Follow these steps to release a a new version (e.g., updating the `tools` schema from `v1.1.0` to `v1.2.0`).

1. Copy the contents of `dev` into the `latest` folder and into `v1.2.0` folder:
```bash
cp -r schemas/tools/dev schemas/tools/latest
cp -r schemas/tools/dev schemas/tools/v1.2.0
```

> Note: the `latest` directory ensures that anyone pointing to `https://w3id.org/everse/rs` immediately gets the new (latest) version of the schema.


2. Commit your changes:
```bash
git add schemas/tools/latest
git add schemas/tools/v1.2.0
git commit -m "tools release v1.2.0"`
```

3. Create a **prefixed git tag**. This is crucial for independent releases:
```bash
git tag -a tools/v1.2.0 -m "Release Tools schema v1.2.0"
git push origin tools/v1.2.0
```


4. Create the GitHub Release

    - Go to the **Releases** section of the repository.
    - Draft a new release and select the tag `tools/v1.2.0`.
    - Title the release: `Tools Schema v1.2.0`.
    - Include a brief changelog of what was added or changed.

