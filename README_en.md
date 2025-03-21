# XInference Singularity

[中文版本](README_zh.md)

XInference Singularity is a repository containing a set of scripts designed to manage inference workflows using Singularity containers. The repository allows you to start and stop the inference server, download models or datasets from Hugging Face, and update the inference container.

## Files

- start-xinference.sh  
  Launches the inference container using Singularity with a default version (v1.2.2) and configured local directory.

- stop-xinference.sh  
  Stops the inference server by terminating the process listening on port 9997.

- hfd.sh  
  Downloads models or datasets from Hugging Face using aria2c or wget with support for authentication and resuming downloads.

- start-xinference-instance.sh  
  Starts a Singularity instance and runs the xinference-local command within the instance, logging output to a designated log file.

- update-xinference.sh  
  Updates the inference container by pulling a Docker image (default version v1.2.0) and converting it for use with Singularity.

## Usage

### Starting the Inference Server

Run:

```bash
./start-xinference.sh
```

Or, to run within an instance:

```bash
./start-xinference-instance.sh
```

### Stopping the Inference Server

Run:

```bash
./stop-xinference.sh
```

### Downloading Models/Datasets

Run:

```bash
./hfd.sh <repo_id> [options]
```

For detailed options, run:

```bash
./hfd.sh -h
```

### Updating the Inference Container

Run:

```bash
./update-xinference.sh
```

_Note: The update script uses a default version of v1.2.0 for updating the container image. Adjust the LATEST_VERSION environment variable as needed._

## Prerequisites

Ensure that Singularity is installed. Additionally, the following dependencies must be available on your system:

- aria2c or wget
- curl
- git and git-lfs

Environment variables can be used to customize paths, instance names, version numbers, and other configurations.
