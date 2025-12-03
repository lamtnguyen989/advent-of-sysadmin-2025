# Basically just change permission for profiles

* vim /etc/.profile
* change `umask 777` --> `umask 022` (or other permissive ones)