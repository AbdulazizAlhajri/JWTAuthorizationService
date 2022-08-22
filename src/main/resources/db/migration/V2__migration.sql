
create table  oauth_client_details (
    client_id varchar2(255) not null,  client_secret varchar2(255) not null,
    web_server_redirect_uri varchar2(2048) default null,  scope varchar2(255) default null,
    access_token_validity number(10) default null,  refresh_token_validity number(10) default null,
    resource_ids varchar2(1024) default null,  authorized_grant_types varchar2(1024) default null,
    authorities varchar2(1024) default null,  additional_information clob default null,
    autoapprove varchar2(255) default null,  primary key (client_id)
);

create table permission (
  id number(11) not null,
  name varchar(512) default null unique,
  primary key (id)
);

create table role (
  id number(11) not null,
  name varchar(255) default null unique,
  primary key (id)
);

create table users (
  id number(11) not null,
  username varchar(100) not null unique,
  password varchar(1024) not null,
  email varchar(1024) not null,
  enabled number(4) not null,
  accountNonExpired number(4) not null,
  credentialsNonExpired number(4) not null,
  accountNonLocked number(4) not null,
  primary key (id)
);

create table  permission_role (
  permission_id number(11) default null,
  role_id number(11) default null,
  CONSTRAINT permission_foreign_key
   FOREIGN KEY (permission_id)
   REFERENCES permission(id),
  CONSTRAINT role_permission_foreign_key
   FOREIGN KEY (role_id)
   REFERENCES role(id)
);

create table role_user (
  role_id number(11) default null,
  user_id number(11) default null,
  CONSTRAINT role_user_foreign_key
     FOREIGN KEY (role_id)
     REFERENCES role(id),
    CONSTRAINT user_foreign_key
     FOREIGN KEY (user_id)
     REFERENCES users(id)
);

create table oauth_client_token (
  token_id VARCHAR(256),
  token BLOB,
  authentication_id VARCHAR(256) PRIMARY KEY,
  user_name VARCHAR(256),
  client_id VARCHAR(256)
);

create table oauth_access_token (
  token_id VARCHAR(256),
  token BLOB,
  authentication_id VARCHAR(256) PRIMARY KEY,
  user_name VARCHAR(256),
  client_id VARCHAR(256),
  authentication BLOB,
  refresh_token VARCHAR(256)
);

create table oauth_refresh_token (
  token_id VARCHAR(256),
  token BLOB,
  authentication BLOB
);

create table oauth_code (
  code VARCHAR(256), authentication BLOB
);

create table oauth_approvals (
	userId VARCHAR(256),
	clientId VARCHAR(256),
	scope VARCHAR(256),
	status VARCHAR(10),
	expiresAt TIMESTAMP
);

INSERT INTO oauth_client_details (client_id, client_secret, web_server_redirect_uri, scope,
    access_token_validity, refresh_token_validity, resource_ids, authorized_grant_types,
    additional_information)
    VALUES ('Az', '{bcrypt}$2a$04$mwDuHIKLF2xkU/5czdgb8ecoIP.29aB90kIKvYLYr2KJvHy6j/Msu',
    'http://localhost:8080/code', 'READ,WRITE', '3600', '10000', 'microservice',
    'authorization_code,password,refresh_token,implicit', '{}');

