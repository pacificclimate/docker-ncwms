# ncWMS Docker Container

## Quickstart

Edit config.xml then link it in to run. Link in host data you want to serve.

    docker run --name ncwms -d -p <docker_host_port>:8080 [-v <local_data_dir>:<docker_data_dir>] -v $(pwd)/config.xml:/root/.ncWMS2/config.xml pcic/docker-ncwms

## Details

Simply running as above will create the ncWMS config within the container, but it will also be destroyed if the contianer is removed. If you want to make the config portable between instances, you'll need to pull it out of the container. A good option would be to use a data volume container:

    docker create -v /root/.ncWMS2 --name ncwms-config ncwms /bin/true
    docker run --name ncwms -d -p <docker_host_port>:8080 [-v <local_data_dir>:<docker_data_dir>] --volumes-from ncwms-config pcic/docker-ncwms

Then edit config as necessary from within the container. Changes will be stored in the data container.

    docker exec -it ncwms bash
