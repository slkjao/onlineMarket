/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     30/09/2021 20:28:54                          */
/*==============================================================*/


/*==============================================================*/
/* Table: ContaCliente                                          */
/*==============================================================*/
create table ContaCliente
(
   id_cli               bigint not null,
   cpf_pes              bigint,
   end_ent              char(50)
);

alter table ContaCliente
   add primary key (id_cli);

/*==============================================================*/
/* Table: ContaEntregador                                       */
/*==============================================================*/
create table ContaEntregador
(
   id_ent               bigint not null,
   id_vei               bigint,
   num_cnh              char(50),
   rg_ent               char(50)
);

alter table ContaEntregador
   add primary key (id_ent);

/*==============================================================*/
/* Table: ContaEstabelecimento                                  */
/*==============================================================*/
create table ContaEstabelecimento
(
   id_est               bigint not null,
   id_prod              bigint,
   cpf_pes              bigint,
   cnpj_est             char(50),
   tel_est              bigint,
   nome_est             char(50),
   end_est              char(50)
);

alter table ContaEstabelecimento
   add primary key (id_est);

/*==============================================================*/
/* Table: Entrega                                               */
/*==============================================================*/
create table Entrega
(
   id_entga             bigint not null,
   id_pedido            bigint,
   end_est              char(50),
   id_vei               bigint,
   id_ent               bigint
);

alter table Entrega
   add primary key (id_entga);

/*==============================================================*/
/* Table: Estoque                                               */
/*==============================================================*/
create table Estoque
(
   id_prod              bigint not null,
   nome_prod            char(50),
   quant_prod           int
);

alter table Estoque
   add primary key (id_prod);

/*==============================================================*/
/* Table: Pedido                                                */
/*==============================================================*/
create table Pedido
(
   id_pedido            bigint not null,
   id_prod              bigint,
   quant_prod           int,
   id_est               bigint,
   id_cli               bigint,
   data_ped             date
);

alter table Pedido
   add primary key (id_pedido);

/*==============================================================*/
/* Table: Pessoa                                                */
/*==============================================================*/
create table Pessoa
(
   cpf_pes              bigint not null,
   id_ent               bigint,
   nome_pes             char(50),
   end_pes              char(50),
   tel_pes              bigint,
   email_pes            char(50),
   senha_pes            char(50)
);

alter table Pessoa
   add primary key (cpf_pes);

/*==============================================================*/
/* Table: Veiculo                                               */
/*==============================================================*/
create table Veiculo
(
   id_vei               bigint not null,
   placa_vei            char(7) not null,
   marca_vei            char(50),
   model_vei            char(50),
   ano_vei              int
);

alter table Veiculo
   add primary key (id_vei);

alter table ContaCliente add constraint FK_Cadastra foreign key (cpf_pes)
      references Pessoa (cpf_pes) on delete restrict on update restrict;

alter table ContaEntregador add constraint FK_Cadastra foreign key (id_vei)
      references Veiculo (id_vei) on delete restrict on update restrict;

alter table ContaEstabelecimento add constraint FK_Atualiza foreign key (id_prod)
      references Estoque (id_prod) on delete restrict on update restrict;

alter table ContaEstabelecimento add constraint FK_Cadastra foreign key (cpf_pes)
      references Pessoa (cpf_pes) on delete restrict on update restrict;

alter table Entrega add constraint FK_Invoca foreign key (id_pedido)
      references Pedido (id_pedido) on delete restrict on update restrict;

alter table Pedido add constraint FK_Realiza foreign key (id_cli)
      references ContaCliente (id_cli) on delete restrict on update restrict;

alter table Pedido add constraint FK_Recebe foreign key (id_est)
      references ContaEstabelecimento (id_est) on delete restrict on update restrict;

alter table Pessoa add constraint FK_Cadastra foreign key (id_ent)
      references ContaEntregador (id_ent) on delete restrict on update restrict;

