# 🏰 Fossil SCM Docker Image

This repository provides a **Dockerized version of Fossil SCM** that runs seamlessly on any system without requiring manual installation.

---

## 🚀 Features

✅ **Fully automated setup** – No need to install Fossil manually.\
✅ **Runs on port ****`9090`** – Just pull & run the image.\
✅ **Persistent storage support** – Option to mount local volumes.\
✅ **Web Interface Ready** – Fossil is accessible via browser.\
✅ **Customizable** – Modify `Dockerfile` and `entrypoint.sh` for custom builds.

---

## 👥 **Get Started in Seconds!**

### **1️⃣ Pull the Docker Image**

```sh
docker pull devprincekumar/fossil:latest
```

### **2️⃣ Run the Fossil Server**

```sh
docker run -d -p 9090:9090 --name fossil-server devprincekumar/fossil
```

🚀 Fossil SCM is now running at **[http://localhost:9090](http://localhost:9090)**

---

## 💾 **Persist Your Repositories (Optional)**

To store Fossil repositories **permanently** on your host machine, run:

```sh
docker run -d -p 9090:9090 --name fossil-server -v ~/fossil-data:/opt/fossil-repositories devprincekumar/fossil
```

This ensures that your **repositories persist even after restarting the container**.

---

## 🔄 **Manage Your Fossil Container**

| Command                            | Description                |
| ---------------------------------- | -------------------------- |
| `docker stop fossil-server`        | Stop the Fossil container  |
| `docker start fossil-server`       | Restart the container      |
| `docker logs fossil-server`        | View logs                  |
| `docker exec -it fossil-server sh` | Access the container shell |

---

## 🛠 **Build the Docker Image Manually**

If you want to **modify or rebuild** the Docker image, follow these steps:

### **1️⃣ Install Docker**

You can install Docker manually by following the [official Docker installation guide](https://docs.docker.com/get-docker/),\
OR use my **automated setup script**:

```sh
wget https://raw.githubusercontent.com/855princekumar/edge-IoT-server/main/3.%20Stream-sync/just-docker.py
python3 just-docker.py
```

This script will **automatically install Docker** on your system.

### **2️⃣ Clone This Repository**

```sh
git clone https://github.com/devprincekumar/fossil-docker.git
cd fossil-docker
```

### **3️⃣ Build the Docker Image**

```sh
docker build -t devprincekumar/fossil:latest .
```

### **4️⃣ Run Your Custom-Built Fossil Image**

```sh
docker run -d -p 9090:9090 --name fossil-server devprincekumar/fossil
```

Now, Fossil will be running on **[http://localhost:9090](http://localhost:9090)** 🚀

---

## 🔧 **Customizing the Build**

If you want to make changes to how Fossil runs inside the container, you can **edit these files**:

- **`Dockerfile`** → Defines the base image and Fossil installation.
- **`entrypoint.sh`** → Controls how Fossil starts and initializes repositories.

After making changes, **rebuild the image**:

```sh
docker build -t devprincekumar/fossil:latest .
```

---

## 🌍 **Credits & Acknowledgments**

This Docker image is made possible thanks to:

🔹 **Fossil SCM** – A lightweight, high-performance version control system ([fossil-scm.org](https://fossil-scm.org/home/doc/trunk/www/index.wiki))\
🔹 **Alpine Linux** – A minimal Linux distribution for containers ([alpinelinux.org](https://alpinelinux.org/))\
🔹 **KeyOpt's Fossil Dockerfile** – A valuable reference for setting up Fossil in Docker ([GitHub Repo](https://github.com/KeyOpt/fossil-scm-docker))

**A huge thanks to the Fossil SCM developers and the open-source community for their contributions!**





