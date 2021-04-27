db_password=bb91313065a0eba5f3ed1ea9d4ff74f6
db_hostname=dabasehost

docker run --name $db_hostname -e MYSQL_ROOT_PASSWORD=$db_password -p 3306:3306 -d mysql:latest
docker exec -i $db_hostname mysql -uroot -p$db_password < data.sql
