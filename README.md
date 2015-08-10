# ncWMS Docker Container

## Quickstart

Edit config.xml then link it in to run. Link in host data you want to serve.

    docker run --name ncwms -d -p <port>:8080 [-v <data_dir>:data] -v $(pwd)/config.xml:/root/.ncWMS/config.xml pcic/ncwms

## Details

Simply running as above will create the ncWMS config within the container, but it will also be destroyed if the contianer is removed. If you want to make the config portable between instances, you'll need to pull it out of the container. A good option would be to use a data volume container:

    docker create -v /root/.ncWMS --name ncwms-config ncwms /bin/true
    docker run --name ncwms -d -p <port>:8080 [-v <data_dir>:data] --volumes-from ncwms-config pcic/ncwms

Then edit config as necessary from within the container. Changes will be stored in the data container.

    docker exec -it ncwms bash
