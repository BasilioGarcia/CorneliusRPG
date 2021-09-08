CREATE DATABASE IF NOT EXISTS cornelius_rpg;
USE cornelius_rpg;

CREATE TABLE users(
id              int(255) auto_increment NOT NULL,
name            varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
email           varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
password        varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
avatar          varchar(20) DEFAULT NULL,
created_at      timestamp DEFAULT CURRENT_TIMESTAMP,
CONSTRAINT pk_users PRIMARY KEY(id)
)ENGINE=InnoDb DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE campaigns(
id              int(255) auto_increment NOT NULL,
system_id       int(255) NOT NULL DEFAULT 0,
name            varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
description     text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
status          tinyint(4) NOT NULL DEFAULT 0,
updated_at      timestamp DEFAULT CURRENT_TIMESTAMP,
created_at      timestamp DEFAULT CURRENT_TIMESTAMP,
CONSTRAINT pk_campaigns PRIMARY KEY(id),
CONSTRAINT fk_system FOREIGN KEY(system_id) REFERENCES systems(id),
)ENGINE=InnoDb DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE campaigns_users(
id              int(255) auto_increment NOT NULL,
campaign_id     int(255) NOT NULL,
user_id         int(255) NOT NULL,
role            tinyint(4) NOT NULL DEFAULT 0,
created_at      timestamp DEFAULT CURRENT_TIMESTAMP,
CONSTRAINT pk_campaigns_users PRIMARY KEY(id),
CONSTRAINT fk_cu_campaign FOREIGN KEY(campaign_id) REFERENCES campaigns(id),
CONSTRAINT fk_cu_user FOREIGN KEY(user_id) REFERENCES users(id)
)ENGINE=InnoDb DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE systems(
id              int(255) auto_increment NOT NULL,
name            varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
CONSTRAINT pk_systems PRIMARY KEY(id)
)ENGINE=InnoDb DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE characters(
id              int(255) auto_increment NOT NULL,
campaign_id     int(255) NOT NULL,
system_id       int(255) NOT NULL DEFAULT 0,
user_id         int(255) DEFAULT NULL,
name            varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
status          tinyint(4) NOT NULL DEFAULT 0,
created_at      timestamp DEFAULT CURRENT_TIMESTAMP,
CONSTRAINT pk_characters PRIMARY KEY(id)
)ENGINE=InnoDb DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;