# Test High Availability Proxy with Keepalived: 

# Send request to the virutal IP and see if it returns the content retrieved from web servers
curl -XGET http://192.168.0.60:8080/healthz


# if ssl enabled 
curl --insecure --cert /etc/ssl/certs/my.crt --key /etc/ssl/private/my.key -XGET https://192.168.0.60:8443/healthz




########## Test haproxy

# Stop container 
docker stop serverone

# Check stats 
http://localhost:28090/haproxy/stats


########## Test LoadBalancer
# Stop master or backup LoadBalancer
service haproxy stop

# If it works correctly, the virtual IP address appeared in the output in container backup instead of container master.
ip addr show eth0

# Start master again
service haproxy start

# the virtual IP address appeared in the output in container master instead of container backup
ip addr show eth0
