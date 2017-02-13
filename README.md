# monitoring-qstack-scripts
Boilerplate scripts to query qstack monitoring

Each of these boilerplate scripts query the Qstack-monitoring API like so:
http://$MANAGEMENT_NODE:6089/health?check=$CHECK

To get a full list of checks available you can do the following:
curl http://$MANAGEMENT_NODE:6089/health?check=list