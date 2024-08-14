# Workflow 


## Printing variables to psql
You can print variables to the `psql` shell using `elog()`. Simply grep for `elog` and refer to an example. A note, the log level needs to be `NOTICE`!

```c++
// example
elog(NOTICE, "howdy %d", 3);
```

## Cold start
This is when you freshly fork the codebase and want to start hacking.

```shell
./configure

# with enabled debug flags
./configure --enable-depend --enable-debug --enable-cassert --without-icu
```

```shell
# try to run this commands without sudo first.
sudo make 
```

```shell
# try to run this commands without sudo first.
sudo make install
```

Within my codebase repository, I create a `/data` folder. We'll be slightly different from [`the postgres short installation guide`](https://www.postgresql.org/docs/15/install-short.html)
```shell
mkdir data
```

```shell
/usr/local/pgsql/bin/initdb -D data
```

If everything goes well, the terminal should respond with a command to start the logfile:
```shell
/usr/local/pgsql/bin/pg_ctl -D data -l logfile start
```

To access the shell, we'll need to create a database. Call it `test`.
```shell
/usr/local/pgsql/bin/createdb test
```

```shell
/usr/local/pgsql/bin/psql test
```


## Hot refresh
You edited some files, added some logs, and want to test your changes in the shell. 

Make sure to stop any background processes. 
```shell
/usr/local/pgsql/bin/pg_ctl -D data -l logfile stop 
```

Rerun `make install` and restart your logfile.

```shell
# try to run this without sudo first.
sudo make install
```
```shell
/usr/local/pgsql/bin/pg_ctl -D data -l logfile start
```

Access the shell!
```shell
/usr/local/pgsql/bin/psql test
```


