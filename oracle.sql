-- run script
-- @ Physical path of sql file
@ ora_script.sql

-- system global area
-- penggunaan memeory
show sga;

startup;
shutdown imidiate;


-- proses inisiasi database
-- opsi 1
startup -- alokasi memory -> mounting storage -> open file

-- opsi 2
startup nomount; -- hanya alokasi memory
alter database mount; -- mounting storage
alter database open; -- open file