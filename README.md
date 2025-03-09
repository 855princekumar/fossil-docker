# 🏗️ Fossil SCM Docker Image

This repository provides a **Dockerized version of Fossil SCM** that runs seamlessly on any system without requiring manual installation.

## 🚀 Features
✅ **Fully automated setup** – No need to install Fossil manually.  
✅ **Runs on port `9090`** – Just pull & run the image.  
✅ **Persistent storage support** – Option to mount local volumes.  
✅ **Web Interface Ready** – Fossil is accessible via browser.

---

## 📥 **Get Started in Seconds!**

### **1️⃣ Pull the Docker Image**
```sh
docker pull devprincekumar/fossil:latest
```

### **2️⃣ Run the Fossil Server**
```sh
docker run -d -p 9090:9090 --name fossil-server devprincekumar/fossil
```
🚀 Fossil SCM is now running at http://localhost:9090

## 💾 **Persist Your Repositories (Optional)**
To store Fossil repositories permanently on your host machine, run:
```sh
docker run -d -p 9090:9090 --name fossil-server -v ~/fossil-data:/opt/fossil-repositories devprincekumar/fossil
```
This keeps your repositories even after restarting the container.

## 🔄 **Manage Your Fossil Container**
Command	Description"
1. docker stop fossil-server	Stop the Fossil container
2. docker start fossil-server	Restart the container
3. docker logs fossil-server	View logs
4. docker exec -it fossil-server sh	Access the container shell

## 🎯 **Why Use This?**
- Quickest way to set up Fossil SCM
- Works on any system with Docker
- No dependencies or package conflicts
- Easily upgrade or remove without affecting your system

## 📜 **Credits & Acknowledgments**
This Docker image is made possible thanks to:

- Fossil SCM – A lightweight, high-performance version control system [fossil-scm.org](https://fossil-scm.org/home/doc/trunk/www/index.wiki)
- Alpine Linux – A minimal Linux distribution for containers [alpinelinux.org](https://alpinelinux.org/)
- KeyOpt's Fossil Dockerfile – A valuable reference for setting up Fossil in Docker [GitHub Repo](https://github.com/KeyOpt/fossil-scm-docker)

🙏 A huge thanks to the Fossil SCM developers and the open-source community for their contributions!
