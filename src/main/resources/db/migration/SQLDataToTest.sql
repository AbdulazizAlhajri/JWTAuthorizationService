INSERT INTO permission (id, NAME) VALUES (1,'create_profile');
INSERT INTO permission (id, NAME) VALUES (2,'read_profile');
INSERT INTO permission (id, NAME) VALUES (3,'update_profile');
INSERT INTO permission (id, NAME) VALUES (4,'delete_profile');

INSERT INTO role (id, NAME) VALUES (1,'ROLE_admin');
INSERT INTO role (id, NAME) VALUES (2,'ROLE_editor');
INSERT INTO role (id, NAME) VALUES (3,'ROLE_operator');

INSERT INTO permission_role (PERMISSION_ID, ROLE_ID) VALUES (1,1); /*create-> admin */
INSERT INTO permission_role (PERMISSION_ID, ROLE_ID) VALUES (2,1); /* read admin */
INSERT INTO permission_role (PERMISSION_ID, ROLE_ID) VALUES (3,1); /* update admin */
INSERT INTO permission_role (PERMISSION_ID, ROLE_ID) VALUES (4,1); /* delete admin */
INSERT INTO permission_role (PERMISSION_ID, ROLE_ID) VALUES (2,2);  /* read Editor */
INSERT INTO permission_role (PERMISSION_ID, ROLE_ID) VALUES (3,2);  /* update Editor */
INSERT INTO permission_role (PERMISSION_ID, ROLE_ID) VALUES (2,3);   /* read operator */


insert INTO users (id, username,password, email, enabled, accountNonExpired, credentialsNonExpired, accountNonLocked)
    VALUES ('1', 'admin','{bcrypt}$2a$12$xVEzhL3RTFP1WCYhS4cv5ecNZIf89EnOW4XQczWHNB/Zi4zQAnkuS', 'habibsumoncse2@gmail.com', '1', '1', '1', '1');
insert INTO  users (id, username,password, email, enabled, accountNonExpired, credentialsNonExpired, accountNonLocked)
    VALUES ('2', '80088462', '{bcrypt}$2a$12$DGs/1IptlFg0szj.3PttmeC8swHZs/pZ6YEKng4Cl1l2woMtkNhvi','habibsumoncse2@gmail.com', '1', '1', '1', '1');
insert INTO  users (id, username,password, email, enabled, accountNonExpired, credentialsNonExpired, accountNonLocked)
    VALUES ('3', 'user', '{bcrypt}$2a$12$udISUXbLy9ng5wuFsrCMPeQIYzaKtAEXNJqzeprSuaty86N4m6emW','habibsumoncse2@gmail.com', '1', '1', '1', '1');
 /*
 passowrds:
 admin - admin
 user - user
 */


INSERT INTO ROLE_USER (ROLE_ID, USER_ID) VALUES (1, 1); /* admin-admin */
INSERT INTO ROLE_USER (ROLE_ID, USER_ID) VALUES (2, 2);