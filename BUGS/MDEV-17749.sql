USE test;
CREATE TEMPORARY TABLE t(c INT) ENGINE=InnoDB;
LOCK TABLES t AS a WRITE;
ALTER TABLE t ADD COLUMN c2 INT;
REPAIR TABLE t USE_FRM;