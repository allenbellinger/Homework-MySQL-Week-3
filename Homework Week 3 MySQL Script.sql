CREATE DATABASE IF NOT EXISTS social_media_db;
USE social_media_db;

CREATE TABLE IF NOT EXISTS users (
  user_id INT PRIMARY KEY AUTO_INCREMENT,
  first_name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  username VARCHAR(50) NOT NULL,
  email VARCHAR(50) NOT NULL,
  password VARCHAR(255) NOT NULL);

CREATE TABLE IF NOT EXISTS posts (
  post_id INT PRIMARY KEY AUTO_INCREMENT,
  post_content VARCHAR(255) NOT NULL,
  post_time DATETIME NOT NULL,
  user_id INT NOT NULL,
  FOREIGN KEY fk_posts_users (user_id)
    REFERENCES users (user_id)
    ON UPDATE CASCADE
    ON DELETE NO ACTION);

CREATE TABLE IF NOT EXISTS comments (
  comment_id INT PRIMARY KEY AUTO_INCREMENT,
  comment_content VARCHAR(255) NOT NULL,
  comment_time DATETIME NOT NULL,
  user_id INT NOT NULL,
  post_id INT NOT NULL,
  FOREIGN KEY fk_comments_users (user_id)
    REFERENCES users (user_id)
    ON UPDATE CASCADE
    ON DELETE NO ACTION,
  FOREIGN KEY fk_comments_posts (post_id)
    REFERENCES posts (post_id)
    ON UPDATE CASCADE
    ON DELETE NO ACTION);