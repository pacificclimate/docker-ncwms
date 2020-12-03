# News / Release Notes

Note: Release numbering combines the ncWMS semver with a single-letter extension
to indicate local changes to the Docker image or to supporting infrastructure
such as the `docker-compose.yaml` or other configuration files. 
Example: `2.2.5-a` = ncWMS 2.2.5, local release "a".

## 2.5.1-b

This release triggers a correctly tagged Docker image. No changes.

## 2.5.1-a

This release:

- Runs ncWMS 2.5.1. (The ncWMS release is actually numbered `1.5.1-snapshot`, 
  where `1.5.1` is a mistake on ncWMS's part and `-snapshot` indicates a 
  pre-release candidate. ncWMS have stated that
  they do not intend to make a full release any time soon.)
- Contains a full EPSG geodetic dataset, enabling us to use projections such
  as EPSG:3005 (BC Albers).
- Contains palette definitions needed to support PDP (see `.ncWMS2/.palettes`).
- Contains a template `docker-compose.yaml` and associated files for 
  creating test and production deployments, as documented in README.

## 2.2.5-a

This release runs ncWMS 2.2.5.