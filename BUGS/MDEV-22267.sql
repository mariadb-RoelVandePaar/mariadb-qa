USE test;
SET @@SESSION.max_sort_length=5;
CREATE TABLE t(c TIME(6));
INSERT INTO t VALUES ('00:00:00');
UPDATE t SET c='00:00:00' ORDER BY c;
