USE test;
CREATE TABLE t (a INT) ENGINE=INNODB;
ALTER TABLE t DISCARD TABLESPACE;
RENAME TABLE t TO t2;
