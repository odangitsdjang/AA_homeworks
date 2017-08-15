ORM is Object relational mapping
-----

1. The goal is to be able to write a Ruby class that will dynamically add/update/create/etc with our database easily without constantly typing "SELECT BLEH FROM BLAH " etc.

2. I guess we are doing sqlite3... Commands like below
```terminal
cat import_db.sql | sqlite3 plays.db
```
will shove in commands from import_db file into plays.db using sqlite3. Then it will open the plays.db
