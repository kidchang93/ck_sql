create user 'mytwo'@'%' identified by '321';

use mysql;
select host, user, password from user;

GRANT ALL privileges ON book_db3.* TO mytwo;



REVOKE ALL PRIVILEGES ON book_db3.* FROM 'mytwo';

show grants for mytwo@'%';
