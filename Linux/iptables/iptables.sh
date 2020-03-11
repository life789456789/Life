$IPT -A INPUT -i lo -j ACCEPT
$IPT -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
$IPT -A INPUT -m state --state NEW -s 10.0.0.0/8 -j ACCEPT
# ssh 端口开放
$IPT -A INPUT -m state --state NEW -p tcp --dport 36581 -m comment --comment "ssh 端口" -j ACCEPT
$IPT -A INPUT -m state --state NEW -p tcp --dport 55587 -m comment --comment "ssh 端口" -j ACCEPT
# 根据需求填写相应的端口
$IPT -A INPUT -p tcp -m multiport --dports 80,443 -m comment --comment "网页ssl端口 " -j ACCEPT
# zabbix监控地址
$IPT -A INPUT -p tcp -m state --state NEW -m tcp --dport 10050 -m comment --comment "zabbix监控" -j ACCEPT
# 58138
$IPT -A INPUT -p tcp -m state --state NEW -m tcp --dport 58138 -m comment --comment "消息抄送接口" -j ACCEPT
# mysql 端口
#$IPT -A INPUT -p tcp -m state --state NEW -m tcp --dport 3306 -m comment --comment "mysql 端口" -j ACCEPT
# mongod 端口
#$IPT -A INPUT -p tcp -m state --state NEW -m tcp --dport 27017 -m comment --comment "mongod 端口" -j ACCEPT
# redis 端口
#$IPT -A INPUT -p tcp -m state --state NEW -m tcp --dport 6379 -m comment --comment "redis 端口" -j ACCEPT
# 游戏端口
#$IPT -A INPUT -p tcp -m state --state NEW -m tcp --dport 36581 -m comment --comment "游戏 端口" -j ACCEPT
# lottery-im-core
#$IPT -A INPUT -p tcp -m state --state NEW -m tcp --dport 8080 -m comment --comment "lottery-im-core 端口" -j ACCEPT
# lottery-im-timetask
#$IPT -A INPUT -p tcp -m state --state NEW -m tcp --dport 8090 -m comment --comment "lottery-im-timetask 端口" -j ACCEPT
# ICMP 规则控制
$IPT -A INPUT -p icmp -m limit --limit 100/sec --limit-burst 100 -j ACCEPT
$IPT -A INPUT -p icmp -m limit --limit 1/s --limit-burst 10 -j ACCEPT
# DOS防护
$IPT -A INPUT -p tcp -m tcp --tcp-flags FIN,SYN,RST,ACK SYN -j syn-flood
$IPT -A INPUT -j REJECT --reject-with icmp-host-prohibited
$IPT -A syn-flood -p tcp -m limit --limit 3/sec --limit-burst 6 -j RETURN
$IPT -A syn-flood -j REJECT --reject-with icmp-port-unreachable
$IPT -L
service iptables save
"fwiptables.sh" 44L, 2185C                                                                         44,1         底端
