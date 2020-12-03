# ncWMS Docker Container

This project defines a Docker container containing an instance of ncWMS
configured appropriately for PCIC usage 
(e.g., including the EPSG geodetic dataset in versions >= 2.5.1-a).

Note: `docker-ncwms` version numbers are a compound of the ncWMS version 
(e.g., 2.5.1) and a single-letter code for our release of `docker-ncwms`. 

## Usage

To deploy an instance of `docker-ncwms`:

1. Create a deployment directory and
   copy the following files and directories into it:
   - `tomcat/config.xml`
   - `.env`
   - `docker-compose.yaml`
   - `.ncWMS2/`
   - Thus:
     ```
     mkdir -p deploy/tomcat
     cp tomcat/tomcat-users.xml deploy/tomcat/
     cp .env docker-compose.yaml deploy/
     cp -r .ncWMS2/ deploy/  
     ```
1. Edit your copy of `tomcat/config.xml` as follows:
   - Replace the username and password placeholders with the desired values 
     for this instance.
1. Edit your copy of `.env` as follows:
   - Change the value of `DEPLOY_DIR` to the deployment directory you created.
   - Change the value of `VERSION` to the version of `docker-ncwms` you wish to 
     deploy (e.g., `VERSION=2.5.1-a`).
   - Change the value of `PORT` to the port you wish the service to be
     exposed on.
1. Edit your copy of `docker-compose.yaml` as follows:
   - Modify the data volume mounts as necessary. 
     If these are enduring changes, please update `docker-compose.yaml`
     in this project.
1. Edit your copy of `.ncWMS2/config.xml` as desired.
   - The configuration file in this repo configures
     a single dynamic dataset with prefix `x`, and no static datasets.
     This is correct for intended usage at the present time. 
1. *From the deployment directory* (necessary to get the environment variables),
   use `docker-compose` to start, stop, and restart the container as necessary.

Notes:

- The container managed by this deployment is named `ncwms-${VERSION}`. 
  This can be changed by modifying `docker-compose.yaml`.
- Because the ncWMS configuration file 
  (`.ncWMS/config.xml`) is externally mounted, configuration changes made
  using the ncWMS Admin interface persist between restarts of the container.
- The palettes defined in `.ncWMS2/.palettes` are custom ones used by PDP.
  If any further palettes are needed for any apps, please add them to this
  repo.

## Releasing

To create a versioned release:

1. Summarize the changes from the last version in `NEWS.md`
1. Commit these changes, then tag the release.
1. Push to the repo.

  ```bash
git add NEWS.md
git commit -m"Bump to version x.x.x"
git tag -a -m"x.x.x" x.x.x
git push --follow-tags
  ```
