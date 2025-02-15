# A Trustworthy IoT-Based Supply Chain Traceability System with Semantic Multi-Chain and Pre-Blockchain Data Verification
## Authors
Lulu Li, Member, IEEE, Huan Qu, Wei Wang, Xiaolin Zhou, Senior Member, IEEE, Wei Ni, Fellow, IEEE, and Abbas Jamalipour, Fellow, IEEE
{21110240076@m.fudan.edu.cn, Weiwang1@fudan.edu.cn, e-mail:qhquhuan@foxmail.com, xiaolinzhou@fudan.edu.cn, wei.ni@ieee.org, a.jamalipour@ieee.org}
## Abstract
  The Internet of Things (IoT) plays a vital role in supply chain product traceability. However, traditional centralized traceability systems face challenges such as data tampering, lack of trust, and single points of failure. Blockchain technology offers a decentralized and tamper-resistant alternative, yet it still encounters issues related to low query efficiency, unbalanced storage demands, and unreliable data sources. To address these challenges, this paper proposes a new semantic multichain framework that dynamically allocates data to different semantic subchains. We also introduce an optimized query integrity verification strategy based on semantic aggregation, reducing the number of accessed blocks. We further refine the node allocation mechanism for subchains and establish a pre-blockchain data verification method to enhance data reliability. Experiments show that our solution reduces on-chain storage costs by 50%, improves query verification efficiency by 92% for 400,000 data records, and achieves an anomaly detection accuracy rate exceeding 90%, compared to its alternatives. This approach enables efficient, scalable, and trustworthy traceability with reduced storage overhead and enhanced data reliability.
## Dependencies
- Java SDK 1.8+
- IntelliJ IDEA 2021.1.2
- Maven 4+
- Apache Maven 3+
- Mysql 5.7
- Npm 12.22
- Redis 6.2.6
- Springblade 2.8.1
- FISCO BCOS 2.8.2

## Docker
  In this work, we recommend running the code with a Docker setup as shown in: docker_setup.md. Otherwise, you can set up and run the code as shown in the following sections.
### Install the dependencies above as needed
Configure Mysql and load datasets
Install MySQL 5.7 using Docker
### Create MySQL docker container
```docker run -d -p 3306:3306 --name mysql -e MYSQL_ROOT_PASSWORD=123456 mysql:5.7```
This will set up a MySQL server with the root password 123456.

### Setup Database in MySQL
Log in to the MySQL server and create a database named bladex_boot:
```CREATE DATABASE bladex_boot;```
### Import the SQL File
Import the bladex_boot.sql file into the bladex_boot database to set up the required schema and data.
### Start Blockchain Nodes
Run the start_all.sh script to start the blockchain nodes:
```bash start_all.sh```
### Install Node.js and npm 12
### Install Redis using Docker
```docker run -d -p 6379:6379 --name redis redis:latest```

## Frontend Setup
- Install Java SDK 1.8
- Download and install Java SDK 1.8, as it is required for running the backend and other tools.
- Install IntelliJ IDEA and Maven
- Install IntelliJ IDEA (a popular IDE for Java development) and Maven (a build automation tool for Java projects).
- Configure Maven in IntelliJ IDEA
- Follow the detailed guide to configure Maven in IntelliJ IDEA.
- Change npm Registry to Taobao Mirror
```npm install -g yarn --registry=https://registry.npm.taobao.org```
- Set Yarn Registry
```yarn config set registry https://registry.npm.taobao.org -g```
- Navigate to the Saber Directory
```cd Saber```
- Install Dependencies
```yarn install```
###Run the Frontend Server
```yarn run serve```

## Datasets
- DataCo, "Dataco smart supply chain for big data analysis," 2023.
```https://www.kaggle.com/datasets/shashwatwork/dataco-smart-supplychain-for-big-data-analysis```
- H. Mavrodiev, "Sofia air quality dataset," 2017.
```https://www.kaggle.com/datasets/hmavrodiev/sofia-air-quality-dataset```

## Repositories
Traceability-System-Prototype Repository
This repository contains the prototype implementation of a traceability system. The system is designed to track and manage data throughout the supply chain, ensuring transparency and integrity.
```https://github.com/Supply-Chain-Traceability-System/Traceability-System-Prototype```

## Anomaly-Detection-Toolkit Repository
This repository includes tools and algorithms for anomaly detection in sensor data before it is uploaded to the blockchain. ```https://github.com/Supply-Chain-Traceability-System/Anomaly-Detection-Toolkit```

## Acknowledgement
This work was supported by the National Key Research and Development Program of China under Grant No. SQ2023YFB2700083, the Research and Development in Key Areas of Guangdong Province under Grant No. 2020B0101090001, and the Science & Technology Commission of Shanghai Municipality under Grant No. 21511102200.
