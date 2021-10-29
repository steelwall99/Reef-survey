drop database if exists `reef_survey`;

create database if not exists `reef_survey`;

use `reef_survey`;

create table if not exists fish
     (fish_id smallint auto_increment,
     family varchar(20),
     scientific_name varchar(20),
     common_name varchar(50),
     primary key (`fish_id`)
     );

create table if not exists location
     (location_id smallint auto_increment,
     region varchar(40),
     sub_region varchar(40),
     study_area varchar(20),
     latitude varchar(20),
     longitude varchar(20),
     structure_type varchar(20),
     management varchar(20),
     constraint pk_location primary key (location_id)
     );
create table if not exists survey
     (survey_id smallint auto_increment,
     survey_year char(4),
     survey_index char(4),
     survey_date varchar(20),
     batch_code varchar(40),
     constraint pk_survey primary key (survey_id)
     );
create table if not exists fish_info
     (fish_info_id smallint auto_increment,
     length varchar(10),
     count varchar(10),
     trophic varchar(10),
     fish_id smallint,
     survey_id smallint,
     location_id smallint,
     primary key (`fish_info_id`)
     );
alter table `fish_info` add constraint 
`fk_fish_info_fish_id` foreign key(`fish_id`) references `fish` (`fish_id`);
alter table `fish_info` add constraint
`fk_fish_info_location_id` foreign key(`location_id`) references `location` (`location_id`);
alter table `fish_info` add constraint
`fk_fish_info_survey_id` foreign key(`survey_id`) references `survey` (`survey_id`);





