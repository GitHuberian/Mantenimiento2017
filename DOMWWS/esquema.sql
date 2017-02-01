alter table UsuarioRol drop constraint FK4CA33E15F65AB4;
alter table UsuarioRol drop constraint FK4CA33E1BF549993;
drop table Roles if exists;
drop table Usuarios if exists;
drop table UsuarioRol if exists;
create table Roles (
   idRol bigint not null,
   nombre varchar(255) not null,
   descripcion varchar(255),
   primary key (idRol),
   unique (nombre)
);
create table Usuarios (
   idUsuario bigint not null,
   nombrePrefijo varchar(255),
   nombreNombre varchar(255),
   nombreApellidoPaterno varchar(255),
   nombreApellidoMaterno varchar(255),
   nombrePosfijo varchar(255),
   nombreIniciales varchar(255),
   nombreUsuario varchar(255) not null,
   claveAcceso varchar(255) not null,
   primary key (idUsuario),
   unique (nombreUsuario)
);
create table UsuarioRol (
   idUsuario bigint not null,
   idRol bigint not null
);
alter table UsuarioRol add constraint FK4CA33E15F65AB4 foreign key (idRol) references Roles;
alter table UsuarioRol add constraint FK4CA33E1BF549993 foreign key (idUsuario) references Usuarios;
