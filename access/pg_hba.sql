CREATE OR REPLACE PROCEDURE get_hba() 
LANGUAGE plpgsql 
AS $$
DECLARE pghba "pg_settings"."setting"%type;
BEGIN
  drop table IF EXISTS hba;
  create table hba ( lines text ); 
  select 'copy hba from ''' || setting || ''';' INTO pghba from pg_settings where name like '%hba%';
  EXECUTE pghba;
END $$;

call get_hba();
insert into hba (lines) values ('$host    $database             $user        $ip          $type');

CREATE OR REPLACE PROCEDURE post_hba() 
LANGUAGE plpgsql 
AS $$
DECLARE pghba "pg_settings"."setting"%type;
BEGIN
  select 'copy hba to ''' || setting || ''';' INTO pghba from pg_settings where name like '%hba%';
  EXECUTE pghba;
  drop table IF EXISTS hba;
END $$;

call post_hba();
select pg_reload_conf();
