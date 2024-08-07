# workflow


## Printing variables to psql
You can print variables to the `psql` shell using `elog()`. Simply grep for `elog` and refer to an example. A note, the log level needs to be `NOTICE`!


## Cold start
This is when you freshly fork the codebase and want to start hacking.

```shell
./configure

# with enabled debug flags
./configure --enable-depend --enable-debug --enable-cassert
```

```shell
sudo make 
```

```shell
sudo make install
```

Within my codebase repository, I create a `/data` folder.
```shell
mkdir data
```

We'll be slightly different from [`the postgres short installation guide`](https://www.postgresql.org/docs/15/install-short.html)


```shell
/usr/local/pgsql/bin/initdb -D data
```

If everything goes well, the terminal should respond with a cli command to start the logfile:
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
You made some changes, added some logs, now you want to rerun a SQL statement in the shell.

Make sure to stop any background processes. 
```shell
/usr/local/pgsql/bin/pg_ctl -D data -l logfile stop 
```

Rerun `make install`

```shell
sudo make install
```

Start your process!
```shell
/usr/local/pgsql/bin/pg_ctl -D data -l logfile start
```

Access the shell
```shell
/usr/local/pgsql/bin/psql test
```


