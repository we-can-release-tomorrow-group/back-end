# check
if [ $# != 1 ]
then
	echo "Please input the mysql password!"
	exit 1
fi

# update system
apt-get update
apt-get -y upgrade

# install git docker and docker-compose
apt-get -y install git docker.io docker-compose

# clone dnmp from github
git clone https://github.com/yeszao/dnmp.git

# cd to dnmp
cd dnmp

# copy the env.sample
cp env.sample .env

# change mysql default password
sed -i "s/MYSQL_ROOT_PASSWORD=123456/MYSQL_ROOT_PASSWORD=${1}/g" .env

# start docker
docker-compose up -d