zabbix-chatwork (prototype)
===============

**IMPORTANT: This script is prototype. It's not well tested and have a lack of error-solving-code.**

Zabbix's alertscript send alert message to ChatWork. This script works under Ruby 1.8.7.

## Works on
- CentOS 5.5
- Ruby 1.8.7

## How To Use

Just install it.

```bash:Installation
$ cd /etc/zabbix/alertscripts/       # This path depends on zabbix_server.conf
$ git clone https://github.com/tamano/zabbix-chatwork.git
```

Then, configure Zabbix's alertscripts as it should be.
The `Send To` of media, should be like this `ChatWorkAPIToken:RoomId`(Seperated with `:`).
And it's all done!

### tips
For testing purposed, this script can be executed on bash like this.

```bash:usage
$ ruby /etc/zabbix/alertscripts/zabbix-chatwork/zabbix-chatwork.rb TOKEN:ROOMID TITLE MESSAGE
```
