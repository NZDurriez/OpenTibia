-- Run as a MySQL/MariaDB administrator (root) if you are not using Docker.
CREATE DATABASE IF NOT EXISTS `forgottenserver` CHARACTER SET utf8 COLLATE utf8_general_ci;
CREATE USER IF NOT EXISTS 'forgottenserver'@'localhost' IDENTIFIED BY 'tfs';
CREATE USER IF NOT EXISTS 'forgottenserver'@'127.0.0.1' IDENTIFIED BY 'tfs';
GRANT ALL PRIVILEGES ON `forgottenserver`.* TO 'forgottenserver'@'localhost';
GRANT ALL PRIVILEGES ON `forgottenserver`.* TO 'forgottenserver'@'127.0.0.1';
FLUSH PRIVILEGES;
