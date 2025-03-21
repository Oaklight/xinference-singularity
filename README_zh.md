# XInference Singularity

[English Version](README_en.md)

XInference Singularity 是一个包含一组脚本的仓库，用于使用 Singularity 容器管理推理工作流。该仓库允许你启动和停止推理服务器，从 Hugging Face 下载模型或数据集，并更新推理容器。

## 文件

- start-xinference.sh  
  使用 Singularity 启动推理容器，使用默认版本（v1.2.2）并配置本地目录。

- stop-xinference.sh  
  通过终止监听 9997 端口的进程来停止推理服务器。

- hfd.sh  
  使用 aria2c 或 wget 下载 Hugging Face 上的模型或数据集，支持认证和断点续传。

- start-xinference-instance.sh  
  启动一个 Singularity 实例，并在实例内运行 xinference-local 命令，将输出记录到指定的日志文件中。

- update-xinference.sh  
  通过拉取 Docker 镜像（默认版本 v1.2.0）并转换为 Singularity 可用的格式，更新推理容器。

## 用法

### 启动推理服务器

运行：

```bash
./start-xinference.sh
```

或者，要在实例中运行：

```bash
./start-xinference-instance.sh
```

### 停止推理服务器

运行：

```bash
./stop-xinference.sh
```

### 下载模型/数据集

运行：

```bash
./hfd.sh <repo_id> [options]
```

查看详细选项，运行：

```bash
./hfd.sh -h
```

### 更新推理容器

运行：

```bash
./update-xinference.sh
```

_注意：更新脚本使用默认版本 v1.2.0 来更新容器镜像。可根据需要调整 LATEST_VERSION 环境变量。_

## 前提条件

确保已安装 Singularity。此外，系统上必须具备以下依赖项：

- aria2c 或 wget
- curl
- git 及 git-lfs

可以使用环境变量来自定义路径、实例名称、版本号及其他配置。
