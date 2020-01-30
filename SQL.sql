use dataia_Nancy;
-- nico P
alter table projetA add id int not null PRIMARY KEY NOT NULL AUTO_INCREMENT;
alter table projetB add id int not null PRIMARY KEY NOT NULL AUTO_INCREMENT;

create table projetC as
(
    select * from projetA
    natural join projetB
)



create table projetC
as select * FROM projetA natural join ProjetB;



