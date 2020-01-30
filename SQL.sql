# test
use dataia_Nancy;

alter table projetA add id int not null PRIMARY KEY NOT NULL AUTO_INCREMENT;
alter table projetB add id int not null PRIMARY KEY NOT NULL AUTO_INCREMENT;

create table projetC as
(
    select * from projetA
    natural join projetB
)