# formatting

To format your work, first install `pg_bsd_indent`. 

 
```bash
cd src/tools/pg_bsd_indent
```

```bash
sudo make install prefix=/usr/local
```

Now you should have `pg_bsd_indent`. Go back to the root directory `postgres/`. 

Run `src/tools/pgindent/pgindent  <list of files>`