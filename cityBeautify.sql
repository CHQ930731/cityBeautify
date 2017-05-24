/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2017/5/24 ÐÇÆÚÈý 16:54:58                       */
/*==============================================================*/


drop table if exists collection;

drop table if exists comment;

drop table if exists focus;

drop table if exists good;

drop table if exists letter;

drop table if exists news;

drop table if exists status;

drop table if exists street_class;

drop table if exists street_scence;

drop table if exists street_source;

drop table if exists street_style;

drop table if exists street_type;

drop table if exists task;

drop table if exists task_type;

drop table if exists user;

drop table if exists user_type;

drop table if exists works;

/*==============================================================*/
/* Table: collection                                            */
/*==============================================================*/
create table collection
(
   col_id               int not null auto_increment,
   w_id                 int,
   u_id                 int,
   col_type             int(1),
   primary key (col_id)
);

/*==============================================================*/
/* Table: comment                                               */
/*==============================================================*/
create table comment
(
   c_id                 int not null auto_increment,
   c_ed_id              int,
   u_id                 int,
   c_content            varchar(600),
   c_type               int(1),
   c_time               datetime,
   c_parent             int,
   primary key (c_id)
);

/*==============================================================*/
/* Table: focus                                                 */
/*==============================================================*/
create table focus
(
   f_uId                int not null,
   f_ed_uId             int not null,
   primary key (f_uId, f_ed_uId)
);

/*==============================================================*/
/* Table: good                                                  */
/*==============================================================*/
create table good
(
   u_id                 int not null,
   w_id                 int not null,
   primary key (u_id, w_id)
);

/*==============================================================*/
/* Table: letter                                                */
/*==============================================================*/
create table letter
(
   lt_id                int not null auto_increment,
   lt_uId_send          int,
   lt_uId_receive       int,
   lt_content           varchar(600),
   lt_time              datetime,
   lt_status            varchar(3),
   primary key (lt_id)
);

/*==============================================================*/
/* Table: news                                                  */
/*==============================================================*/
create table news
(
   n_id                 int not null auto_increment,
   n_title              varchar(15),
   n_type               varchar(4),
   n_content            varchar(600),
   n_publishTime        datetime,
   n_source             varchar(6),
   n_pic                varchar(255),
   primary key (n_id)
);

/*==============================================================*/
/* Table: status                                                */
/*==============================================================*/
create table status
(
   s_id                 int not null auto_increment,
   s_name               varchar(4),
   primary key (s_id)
);

/*==============================================================*/
/* Table: street_class                                          */
/*==============================================================*/
create table street_class
(
   s_class_id           int(2) not null auto_increment,
   s_class_name         varchar(5),
   primary key (s_class_id)
);

/*==============================================================*/
/* Table: street_scence                                         */
/*==============================================================*/
create table street_scence
(
   s_scence_id          int(2) not null auto_increment,
   s_scence_name        varchar(5),
   primary key (s_scence_id)
);

/*==============================================================*/
/* Table: street_source                                         */
/*==============================================================*/
create table street_source
(
   s_source_id          int(2) not null auto_increment,
   s_source_name        varchar(5),
   primary key (s_source_id)
);

/*==============================================================*/
/* Table: street_style                                          */
/*==============================================================*/
create table street_style
(
   s_style_id           int(2) not null auto_increment,
   s_style_name         varchar(5),
   primary key (s_style_id)
);

/*==============================================================*/
/* Table: street_type                                           */
/*==============================================================*/
create table street_type
(
   s_type_id            int(2) not null auto_increment,
   s_type_name          varchar(5),
   primary key (s_type_id)
);

/*==============================================================*/
/* Table: task                                                  */
/*==============================================================*/
create table task
(
   t_id                 int not null auto_increment,
   u_id                 int,
   tp_id                int,
   s_id                 int,
   t_title              varchar(20),
   t_publishTime        datetime,
   t_startTime          datetime,
   t_endTime            datetime,
   t_readCount          int,
   t_content            varchar(600),
   t_simpPic            varchar(30),
   t_attachment         varchar(30),
   primary key (t_id)
);

/*==============================================================*/
/* Table: task_type                                             */
/*==============================================================*/
create table task_type
(
   tp_id                int not null auto_increment,
   tp_name              varchar(16),
   primary key (tp_id)
);

/*==============================================================*/
/* Table: user                                                  */
/*==============================================================*/
create table user
(
   u_id                 int not null auto_increment,
   ut_id                int,
   u_idcard             varchar(18),
   u_name               varchar(20),
   u_nickname           varchar(20),
   u_profile            varchar(50),
   u_email              varchar(50) not null,
   u_tel                varchar(11),
   u_qq                 varchar(15),
   u_pwd                varchar(20) not null,
   u_addr               varchar(20),
   u_headPic            varchar(20),
   u_company            varchar(20),
   u_experience         int(11),
   primary key (u_id)
);

/*==============================================================*/
/* Table: user_type                                             */
/*==============================================================*/
create table user_type
(
   ut_id                int not null auto_increment,
   ut_name              varchar(5),
   primary key (ut_id)
);

/*==============================================================*/
/* Table: works                                                 */
/*==============================================================*/
create table works
(
   w_id                 int not null auto_increment,
   u_id                 int,
   s_scence_id          int(2),
   s_type_id            int(2),
   s_source_id          int(2),
   s_style_id           int(2),
   s_class_id           int(2),
   s_id                 int,
   w_uploadTime         datetime,
   w_readCount          int,
   w_title              varchar(20),
   w_simpleContent      varchar(150 ),
   w_content            varchar(600),
   w_pic                varchar(255),
   primary key (w_id)
);

alter table collection add constraint FK_Reference_15 foreign key (w_id)
      references works (w_id) on delete restrict on update restrict;

alter table collection add constraint FK_Reference_16 foreign key (u_id)
      references user (u_id) on delete restrict on update restrict;

alter table comment add constraint FK_Reference_17 foreign key (u_id)
      references user (u_id) on delete restrict on update restrict;

alter table focus add constraint FK_Reference_12 foreign key (f_uId)
      references user (u_id) on delete restrict on update restrict;

alter table focus add constraint FK_Reference_13 foreign key (f_ed_uId)
      references user (u_id) on delete restrict on update restrict;

alter table good add constraint FK_Reference_10 foreign key (u_id)
      references user (u_id) on delete restrict on update restrict;

alter table good add constraint FK_Reference_11 foreign key (w_id)
      references works (w_id) on delete restrict on update restrict;

alter table letter add constraint FK_Reference_8 foreign key (lt_uId_send)
      references user (u_id) on delete restrict on update restrict;

alter table letter add constraint FK_Reference_9 foreign key (lt_uId_receive)
      references user (u_id) on delete restrict on update restrict;

alter table task add constraint FK_Reference_18 foreign key (tp_id)
      references task_type (tp_id) on delete restrict on update restrict;

alter table task add constraint FK_Reference_19 foreign key (s_id)
      references status (s_id) on delete restrict on update restrict;

alter table task add constraint FK_Reference_7 foreign key (u_id)
      references user (u_id) on delete restrict on update restrict;

alter table user add constraint FK_Reference_14 foreign key (ut_id)
      references user_type (ut_id) on delete restrict on update restrict;

alter table works add constraint FK_Reference_1 foreign key (u_id)
      references user (u_id) on delete restrict on update restrict;

alter table works add constraint FK_Reference_2 foreign key (s_scence_id)
      references street_scence (s_scence_id) on delete restrict on update restrict;

alter table works add constraint FK_Reference_20 foreign key (s_id)
      references status (s_id) on delete restrict on update restrict;

alter table works add constraint FK_Reference_3 foreign key (s_type_id)
      references street_type (s_type_id) on delete restrict on update restrict;

alter table works add constraint FK_Reference_4 foreign key (s_source_id)
      references street_source (s_source_id) on delete restrict on update restrict;

alter table works add constraint FK_Reference_5 foreign key (s_style_id)
      references street_style (s_style_id) on delete restrict on update restrict;

alter table works add constraint FK_Reference_6 foreign key (s_class_id)
      references street_class (s_class_id) on delete restrict on update restrict;

