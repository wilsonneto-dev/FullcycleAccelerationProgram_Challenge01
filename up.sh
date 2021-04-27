db_password=bb91313065a0eba5f3ed1ea9d4ff74f6
db_hostname=databasecontainer
db_name=pfa
db_user=root
api_port=3000
network_name=backend_network

# creating the network
docker network create $network_name

# running the database
docker run --network=$network_name --name $db_hostname -e MYSQL_ROOT_PASSWORD=$db_password -d mysql:latest

# loop just for wait mysql be ready to receive connections
until docker exec -i databasecontainer mysql -uroot -pbb91313065a0eba5f3ed1ea9d4ff74f6 -e "show databases"
do
  echo "this loop will try again until mysql container be ready... It can take 1 or 2 minutes"
  echo "waiting 20 seconds to try again..."
  sleep 20
done

echo "seeding the database"
docker exec -i $db_hostname mysql -uroot -p$db_password < ./mysql/data.sql

echo "runnnig the api container"
docker run --network=$network_name -d --name api -e SERVER_PORT=$api_port -e DB_HOST=$db_hostname -e DB_USER=$db_user -e DB_NAME=$db_name -e DB_SECRET=$db_password wilsonnetodev/pfa01apimodules

echo "runnnig the spa container"
docker run --network=$network_name -d --name spa wilsonnetodev/pfa01spamodules

echo "runnnig the reverse proxy (nginx container)"
docker run --network=$network_name -d --name proxy -p 8080:80 nginxtest

echo "everything is up, nginx is listenning on port 8080"