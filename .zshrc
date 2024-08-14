# Shortcuts I use within my `/postgres` directory

pg_init_log() {
   /usr/local/pgsql/bin/pg_ctl -D data -l logfile start
}

pg_kill_log() {
   /usr/local/pgsql/bin/pg_ctl -D data -l logfile stop
}

pg_init() {
	rm -rf data &&
	./configure --enable-depend --enable-debug --enable-cassert --without-icu &&
	sudo make &&
	sudo make install &&
	mkdir data &&
	/usr/local/pgsql/bin/initdb -D data &&
	/usr/local/pgsql/bin/pg_ctl -D data -l logfile start &&
	/usr/local/pgsql/bin/createdb test &&
	/usr/local/pgsql/bin/psql test
}

pg_refresh() {
  /usr/local/pgsql/bin/pg_ctl -D data -l logfile stop &&
  sudo make install &&
  /usr/local/pgsql/bin/pg_ctl -D data -l logfile start &&
  /usr/local/pgsql/bin/psql test
}
