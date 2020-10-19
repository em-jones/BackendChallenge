# Task Manager

## Environment Setup
- `PlantUML` dependencies
  - [`graphviz`](https://graphviz.org/e)
  - [`java`](https://sdkman.io/)
- `Makefile` dependencies
  - [`build-essential`](https://packages.ubuntu.com/xenial/build-essential) or other dev utility packages
  - Docker (see below)
- `Dockerfile` dependencies
  - [Docker](https://docs.docker.com/get-docker/)
  - [docker-compose](https://docs.docker.com/compose/install/)

## Application Data Model
- Refer to `ERD.puml` (./ERD.puml)

## Requirements
- RESTful json API
- Task Management application
- Task Features
  - States: `Locked`, `Incomplete`, `Complete`
- Persistence
  - 

## Interact with it!

## Nice to haves -
- Security
  - escaping of values provided to server
- Cache Management
  - mnesia distributed cache
  - when creating task with `prerequisite_task` lock if parent is `incomplete` and add to `locked` list
  - when `incomplete` task is set to `completed`, check children for *unlocking* and set to `incomplete`
    - remove these from the list of locked tasks
  - key would be a user's session
- Logging
  - JSON logging template with:
    - _correlation id_
    - Details
    - Log type (Error, INFO, Debug)
    - Retaining policy (optional - timestamp)
    - Session (optional)
- Monitoring
  - Creating _correlation identities_ should be used to tag requests and associate with relevant system behavior
    - These should be added to each request tot he API 

## Credits
- [Real World Example App](https://github.com/gothinkster/elixir-phoenix-realworld-example-app)
- [A Phoenix+React initial setup that actually works](https://medium.com/@resir014/a-phoenix-react-initial-setup-that-actually-works-c943e48f1e9e)

