* Installieren für parallel ausführunge
```sh
sudo apt-get -y install python-pip; \
     pip install pssh

```

** now you can execute multi comms at once on diffrent systems
pssh -h host-file -l me -i -A "git clone https://github.com/big-data-europe/app-bde-pipeline.git;\
cd app-bde-pipeline; \
docker-compose up -d"


git clone https://github.com/big-data-europe/app-bde-pipeline.git
cd app-bde-pipeline
**docker-compose up -d**
**
ping 