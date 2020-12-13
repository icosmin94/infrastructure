mkdir /root/kafka
cd /root/kafka
curl -k https://archive.apache.org/dist/kafka/2.5.0/kafka_2.12-2.5.0.tgz > kafka_2.12-2.5.0.tgz
tar -xzf kafka_2.12-2.5.0.tgz
rm kafka_2.12-2.5.0.tgz
mkdir -p /root/kafka/data/zookeeper
cp /vagrant_data/zookeeper.properties /root/kafka/kafka_2.12-2.5.0/config
cp /vagrant_data/myid /root/kafka/data/zookeeper/
cp /vagrant_data/zookeeper.service /etc/systemd/system/zookeeper.service
systemctl start zookeeper
systemctl enable zookeeper
cp /vagrant_data/server.properties /root/kafka/kafka_2.12-2.5.0/config
cp /vagrant_data/kafka.service /etc/systemd/system/kafka.service
systemctl start kafka
systemctl enable kafka