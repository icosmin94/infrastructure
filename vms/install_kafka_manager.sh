mkdir /root/kafka-manager
cd /root/kafka-manager
wget https://github.com/yahoo/kafka-manager/archive/3.0.0.0.zip
unzip /root/kafka-manager/3.0.0.0.zip -d /root/kafka-manager/
rm /root/kafka-manager/3.0.0.0.zip
cd /root/kafka-manager/CMAK-3.0.0.0/
./sbt clean dist
unzip /root/kafka-manager/CMAK-3.0.0.0/target/universal/cmak-3.0.0.0.zip -d /root/kafka-manager/
rm -rf /root/kafka-manager/CMAK-3.0.0.0
cp /vagrant_data/kafka_manager.conf /root/kafka-manager/cmak-3.0.0.0/conf/application.conf
cp /vagrant_data/kafka_manager.service /etc/systemd/system/kafka_manager.service
systemctl start kafka_manager
systemctl enable kafka_manager