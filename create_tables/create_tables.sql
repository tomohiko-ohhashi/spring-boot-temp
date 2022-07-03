DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS roles; 

CREATE TABLE users( 
    id INT AUTO_INCREMENT PRIMARY KEY
    , username VARCHAR (32)
    , password VARCHAR (128)
    , role_id INT DEFAULT 1
    , created_by INT
    , created_at DATETIME DEFAULT CURRENT_TIMESTAMP
    , updated_by INT
    , updated_at DATETIME DEFAULT CURRENT_TIMESTAMP 
        ON UPDATE CURRENT_TIMESTAMP
); 

CREATE TABLE roles( 
    id INT PRIMARY KEY
    , role_name_jp VARCHAR (8)
    , role_name_en VARCHAR (16)
    , created_by INT
    , created_at DATETIME DEFAULT CURRENT_TIMESTAMP
    , updated_by INT
    , updated_at DATETIME DEFAULT CURRENT_TIMESTAMP 
        ON UPDATE CURRENT_TIMESTAMP
);

