#Things to run for a classic server of my own
CentOS Preferred

assumes you logged in as centos user.
`sudo su`
`$yum install git vim tree zsh`

https://serverfault.com/questions/298146/yum-equivalent-to-apt-get-upgrade-vs-apt-get-dist-upgrade/298158#298158

`$yum update --obsoletes`

https://www.codelitt.com/blog/my-first-10-minutes-on-a-server-primer-for-securing-ubuntu/

`$useradd deploy`
`$mkdir /home/deploy/.ssh -p`
`chmod 700 /home/deploy/.ssh`

`usermod -s /bin/zsh deploy`

`vim /home/deploy/.ssh/authorized_keys`

```
chmod 400 /home/deploy/.ssh/authorized_keys
chown deploy:deploy /home/deploy -R
passwd deploy
```


`visudo`
add `%sudo` group
add deploy user to sudo (or wheel! may already be setup) group
`usermod -aG wheel deploy`
reloign
`exec su -l deploy`

enforce ssh key logins
`vim /etc/ssh/sshd_config`

```
PermitRootLogin no
PasswordAuthentication no
AllowUsers deploy@(your-VPN-or-static-IP)
```

change default ssh port
```
Port <randomnumber> 222 maybe
```

kill users not doing anything
```
ClientAliveInterval 600
ClientAliveCountMax 0
```

`$service ssh restart`

from man pages
   AllowUsers
	     This keyword can be followed by a list of user name patterns,
	     separated by spaces.  If specified, login is allowed only for
	     user names	that match one of the patterns.	 Only user names are
	     valid; a numerical	user ID	is not recognized.  By default,	login
	     is	allowed	for all	users.	If the pattern takes the form
	     USER@HOST then USER and HOST are separately checked, restricting
	     logins to particular users	from particular	hosts.	The allow/deny
	     directives	are processed in the following order: DenyUsers,
	     AllowUsers, DenyGroups, and finally AllowGroups.

destroy old centos user

```
userdel -r centos #destroys home directory as well
```

if logging in as centos user from EC2, may have to transfer public key over


