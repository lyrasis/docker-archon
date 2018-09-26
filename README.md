# Docker Archon

```bash
docker-compose build
docker-compose up

# for migrations use: (wait 1-2 minutes for archivesspace to start)
docker-compose -f migration.yml up
```

- Archon: http://localhost:8888/ (username: admin, password: admin)
- ArchivesSpace: http://localhost:8089/ (username: admin, password: admin)

FYI: for ArchivesSpace only the backend is enabled.

## Migrations

If upgrading from an earlier (3.x) version:

```sql
DROP DATABASE archon;
CREATE DATABASE archon;
```

Restore the Archon database. Next, run these:

```sql
UPDATE archon.tblCore_Configuration
SET Value = 'default' WHERE Directive = 'Default Theme';

UPDATE archon.tblCore_Configuration
SET Value = '$1$Gr2LN2uT$Fx3pLTiWW/psVf/WkUajV.' WHERE Directive = 'SA Password';
```

To run the migration tool:

```bash
wget https://github.com/archivesspace/archon-migration/releases/download/v2.3.x/archon-migration.jar
java -jar archon-migration.jar
```

## Custom builds

```bash
VERSION=3.21.3
URL=https://github.com/archonproject/archon.git
docker-compose build --build-arg ARCHON_VERSION=$BRANCH ARCHON_URL=$URL app
docker-compose up
```

## Docker hub

To push this to docker hub follow the standard [docs](https://docs.docker.com/docker-cloud/builds/push-images/):

```bash
VERSION=3.21.3
DOCKER_ID_USER=lyrasis
docker tag archon:latest $DOCKER_ID_USER/archon:$VERSION
docker push $DOCKER_ID_USER/archon:$VERSION
```

---
