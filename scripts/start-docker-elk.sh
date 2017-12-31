#!/bin/bash

## CURRENTLY DOESN'T RUN ** Using this to store commands for now

set -eux

`docker run -p 9200:9200 -e http.host=0.0.0.0 -e transport.host=127.0.0.1 --net elastic --name elastic docker.elastic.co/elasticsearch/elasticsearch:5.5.1`

`docker run -e ELASTIC_USER=elastic -e ELASTIC_PASSWORD=changeme -e ELASTICSEARCH_URL=http://elastic:9200 -p 5601:5601 --name kibana --net elastic docker.elastic.co/kibana/kibana:5.5.1`

`docker run --rm -it --net elastic --name logstash -v /Users/supatel/Downloads/logstash/config:/usr/share/logstash/config -v /Users/supatel/Downloads/logstash/pipeline:/usr/share/logstash/pipeline -v /Users/supatel/Downloads/logstash/data:/usr/share/logstash/data docker.elastic.co/logstash/logstash:5.5.2`
