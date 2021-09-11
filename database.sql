CREATE DATABASE IF NOT EXISTS cornelius_rpg;
USE cornelius_rpg;

CREATE TABLE `user`(
id              int(255) unsigned auto_increment NOT NULL,
name            varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
email           varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
password        varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
avatar          varchar(20) DEFAULT NULL,
language        tinyint(4) unsigned NOT NULL DEFAULT 1,
created_at      timestamp DEFAULT CURRENT_TIMESTAMP,
CONSTRAINT pk_user PRIMARY KEY(id)
)ENGINE=InnoDb DEFAULT CHARSET=utf8mb4 COLLATE=UTF8MB4_UNICODE_CI;

INSERT INTO `user` (`id`, `name`, `email`, `password`, `avatar`, `language`, `created_at`) VALUES
    (1, 'Bas', 'soy@basiliogarcia.net', 'hola1234', NULL, 0, '2021-09-11 10:55:01'),
    (2, 'TestUser', 'test@mail.com', 'hola1234', NULL, 0, '2021-09-11 10:56:01');
-- ####################################################################################################

-- TODO - El campo nombre debería de cargarse de un archivo de idiomas
CREATE TABLE `system`(
id              int(255) unsigned auto_increment NOT NULL,
name            varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
CONSTRAINT pk_system PRIMARY KEY(id)
)ENGINE=InnoDb DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `system` (`id`, `name`) VALUES
    (1, 'Sistema propio'),
    (2, 'D&D 5ª edición');
-- ####################################################################################################

CREATE TABLE `campaign`(
id              int(255) unsigned auto_increment NOT NULL,
system_id       int(255) unsigned NOT NULL DEFAULT 1,
name            varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
description     text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
status          tinyint(4) unsigned NOT NULL DEFAULT 1,
updated_at      timestamp DEFAULT CURRENT_TIMESTAMP,
created_at      timestamp DEFAULT CURRENT_TIMESTAMP,
CONSTRAINT pk_campaign PRIMARY KEY(id),
CONSTRAINT fk_system FOREIGN KEY(system_id) REFERENCES `system`(id)
)ENGINE=InnoDb DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `campaign` (`id`, `system_id`, `name`, `description`, `status`, `updated_at`, `created_at`) VALUES
    (1, 1, 'Antiguos males', NULL, 0, '2021-09-11 11:01:08', '2021-09-11 11:01:08'),
    (2, 2, 'TestCampaign', NULL, 0, '2021-09-11 11:02:08', '2021-09-11 11:02:08');
-- ####################################################################################################

CREATE TABLE `character`(
id              int(255) unsigned auto_increment NOT NULL,
campaign_id     int(255) unsigned NOT NULL,
system_id       int(255) unsigned NOT NULL DEFAULT 1,
user_id         int(255) unsigned NOT NULL,
name            varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
status          tinyint(4) unsigned NOT NULL DEFAULT 1,
updated_at      timestamp DEFAULT CURRENT_TIMESTAMP,
created_at      timestamp DEFAULT CURRENT_TIMESTAMP,
CONSTRAINT pk_character PRIMARY KEY(id),
CONSTRAINT fk_character_campaign FOREIGN KEY(campaign_id) REFERENCES `campaign`(id),
CONSTRAINT fk_character_system FOREIGN KEY(system_id) REFERENCES `system`(id),
CONSTRAINT fk_character_user FOREIGN KEY(user_id) REFERENCES `user`(id)
)ENGINE=InnoDb DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `character` (`id`, `campaign_id`, `system_id`, `user_id`, `name`, `status`, `updated_at`, `created_at`) VALUES
    (1, 1, 1, 1, 'PJBas1', 1, '2021-09-11 11:01:08', '2021-09-11 11:01:08'),
    (2, 2, 1, 2, 'PJTest1', 1, '2021-09-11 11:02:08', '2021-09-11 11:02:08'),
    (3, 1, 2, 1, 'PJBas2', 1, '2021-09-11 11:02:08', '2021-09-11 11:02:08');
-- ####################################################################################################

CREATE TABLE `campaign_user`(
id              int(255) unsigned auto_increment NOT NULL,
campaign_id     int(255) unsigned NOT NULL,
user_id         int(255) unsigned NOT NULL,
current_character_id int(255) unsigned DEFAULT NULL,
role            tinyint(4) unsigned NOT NULL DEFAULT 1,
created_at      timestamp DEFAULT CURRENT_TIMESTAMP,
CONSTRAINT pk_campaign_user PRIMARY KEY(id),
CONSTRAINT fk_cu_campaign FOREIGN KEY(campaign_id) REFERENCES `campaign`(id),
CONSTRAINT fk_cu_user FOREIGN KEY(user_id) REFERENCES `user`(id),
CONSTRAINT fk_cu_current_character FOREIGN KEY(current_character_id) REFERENCES `character`(id)
)ENGINE=InnoDb DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `campaign_user` (`id`, `campaign_id`, `user_id`, `current_character_id`, `role`, `created_at`) VALUES
    (1, 1, 1, 3, 1, '2021-09-11 11:01:08'),
    (2, 2, 2, 2, 1, '2021-09-11 11:02:08');
-- ####################################################################################################

-- TODO - Hacer inserts que simulen seeders en este archivo