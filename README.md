# ncWMS Docker Container

Edit config.xml then run.

External data must be linked in by mouting volumes at runtime or by using data containers:

    docker build -t ncwms .
    docker run --name ncwms -d [-v <data_dir>:data] -p <port>:8080 ncwms

Or to run a temporary instance

    docker run --name ncwms -it --rm [-v <data_dir>:data] -p <port>:8080 ncwms