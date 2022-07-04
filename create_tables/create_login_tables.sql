DROP TABLE IF EXISTS user_role; 

DROP TABLE IF EXISTS login_user; 

DROP TABLE IF EXISTS roles; 

CREATE TABLE roles( 
    id INTEGER PRIMARY KEY
    , name VARCHAR (32) NOT NULL
    , created_by INT
    , created_at DATETIME DEFAULT CURRENT_TIMESTAMP
    , updated_by INT
    , updated_at DATETIME DEFAULT CURRENT_TIMESTAMP 
        ON UPDATE CURRENT_TIMESTAMP
); 

CREATE TABLE login_user( 
    id INTEGER AUTO_INCREMENT PRIMARY KEY
    , email VARCHAR (256) NOT NULL
    , name VARCHAR (128) NOT NULL
    , password VARCHAR (128) NOT NULL
    , created_by INT
    , created_at DATETIME DEFAULT CURRENT_TIMESTAMP
    , updated_by INT
    , updated_at DATETIME DEFAULT CURRENT_TIMESTAMP 
        ON UPDATE CURRENT_TIMESTAMP
); 

CREATE TABLE user_role( 
    user_id INTEGER
    , role_id INTEGER
    , CONSTRAINT pk_user_role PRIMARY KEY (user_id, role_id)
    , CONSTRAINT fk_user_role_user_id FOREIGN KEY (user_id) REFERENCES login_user(id)
    , CONSTRAINT fk_user_role_role_id FOREIGN KEY (role_id) REFERENCES roles(id)
    , created_by INT
    , created_at DATETIME DEFAULT CURRENT_TIMESTAMP
    , updated_by INT
    , updated_at DATETIME DEFAULT CURRENT_TIMESTAMP 
        ON UPDATE CURRENT_TIMESTAMP
); 

INSERT 
INTO roles(id, name) 
VALUES (1, 'GENERAL')
, (2, 'ADMIN')
, (3, 'HEAD')
, (4, 'MASTER'); 

-- password = "general"
-- password = "admin"
INSERT 
INTO login_user(name, email, password) 
VALUES ( 
    '一般太郎2'
    , 'general@example.com'
    , '$2a$10$6fPXYK.C9rCWUBifuqBIB.GRNU.nQtBpdzkkKis8ETaKVKxNo/ltO'
) 
, ( 
    '管理太郎2'
    , 'admin@example.com'
    , '$2a$10$SJTWvNl16fCU7DaXtWC0DeN/A8IOakpCkWWNZ/FKRV2CHvWElQwMS'
); 

INSERT 
INTO user_role(user_id, role_id) 
VALUES (1, 1); 

INSERT 
INTO user_role(user_id, role_id) 
VALUES (2, 1); 

INSERT 
INTO user_role(user_id, role_id) 
VALUES (2, 2);

