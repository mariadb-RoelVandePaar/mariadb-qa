USE test;
CREATE TABLE t1(a INT);
CREATE TABLE t2(b INT);
LOCK TABLES t2 AS a2 WRITE;
BACKUP LOCK t1;
UNLOCK TABLES;
INSERT INTO t1 VALUES(0);

USE test;
CREATE TABLE t1(a INT);
CREATE TABLE t2(b INT);
LOCK TABLES t2 AS a2 WRITE;
BACKUP LOCK t1;
UNLOCK TABLES;
INSERT INTO t1 VALUES(0);

# MDEV-20945
CREATE TABLE t1(a INT);
BACKUP LOCK t1;
FLUSH TABLE t1 WITH READ LOCK; # FOR EXPORT crashes as well
UNLOCK TABLES;
BACKUP UNLOCK;
DROP TABLE t1;

# MDEV-20945
USE test;
CREATE TABLE t (c INT);
BACKUP LOCK not_existing.t;
LOCK TABLES t WRITE;
UNLOCK TABLES;
# Shutdown server; crash happens on shutdown
