# Start database server
```plaintext
start -> services -> mysql -> start
OR
ctrl+R = run -> services.msc- mysql ->start
```

# Architecture
```plaintext
Laptop - cmd
    Mysql database server
        Database - name
        Entry
            Table
                Row/Tuple
                    Column 
                        Attribute/Field
                            Data
```

# Create connection/Get entry into mysql database server
- Open cmd
```cmd
-- verify if mysql is available
mysql --version;

mysql --host localhost --port 3306 -u root -proot

mysql -u root -proot

```

# After entry into database server
### show list of databases
```sql
show databases;
```
### create database
```sql
create database college;
```
### delete database
```sql
drop database tutorial;
```
### enter into database
```sql
use college;
```
### Check in which database we are
```sql
select database();
```
### List all available tables
```sql
show tables;
```

### Create table
```sql
create table students(
    roll int,
    name varchar(30),
    email varchar(30),
    subject varchar(30),
    age int
);

show tables;
desc students;
```

