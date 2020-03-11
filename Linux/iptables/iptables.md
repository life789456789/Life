# 使用iptables 流程

### 查看firewall服务状态

systemctl status firewalld

### 关闭开机自启
systemctl disable firewalld 

### 开启开机自启
systemctl enable firewalld 


### 再次查看firewalld服务的状态，已经是“disabled”，表明已经不是开机自启了
systemctl list-unit-files | grep firewalld



### #开启 #重启 #关闭

service firewalld start

service firewalld restart

service firewalld stop
