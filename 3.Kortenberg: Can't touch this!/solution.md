# Basically just change permission for profiles

1. `sudo vim /etc/.profile`
2. change `umask 777` --> `umask 022` (or other permissive ones)
3. Save and exit