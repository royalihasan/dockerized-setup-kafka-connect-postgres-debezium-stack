-- Check the wal_level in postgresql.conf file , it should be set to logical
select * from pg_settings where name='wal_level';
-- Check the max_replication_slots in postgresql.conf file , it should be set to 10
select * from pg_settings where name='max_replication_slots';
