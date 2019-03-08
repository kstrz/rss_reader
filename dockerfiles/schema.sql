CREATE DATABASE rss;

CREATE TABLE rss.auth_group
(
    id int(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
    name varchar(80) NOT NULL
);
CREATE UNIQUE INDEX name ON rss.auth_group (name);
CREATE TABLE rss.auth_group_permissions
(
    id int(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
    group_id int(11) NOT NULL,
    permission_id int(11) NOT NULL,
    CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES rss.auth_group (id)
#     CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES rss.auth_permission (id)
);
CREATE UNIQUE INDEX auth_group_permissions_group_id_permission_id_0cd325b0_uniq ON rss.auth_group_permissions (group_id, permission_id);
CREATE INDEX auth_group_permissio_permission_id_84c5c92e_fk_auth_perm ON rss.auth_group_permissions (permission_id);
CREATE TABLE rss.auth_permission
(
    id int(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
    name varchar(255) NOT NULL,
    content_type_id int(11) NOT NULL,
    codename varchar(100) NOT NULL
#     CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES rss.django_content_type (id)
);
CREATE UNIQUE INDEX auth_permission_content_type_id_codename_01ab375a_uniq ON rss.auth_permission (content_type_id, codename);
INSERT INTO rss.auth_permission (id, name, content_type_id, codename) VALUES (1, 'Can add log entry', 1, 'add_logentry');
INSERT INTO rss.auth_permission (id, name, content_type_id, codename) VALUES (2, 'Can change log entry', 1, 'change_logentry');
INSERT INTO rss.auth_permission (id, name, content_type_id, codename) VALUES (3, 'Can delete log entry', 1, 'delete_logentry');
INSERT INTO rss.auth_permission (id, name, content_type_id, codename) VALUES (4, 'Can view log entry', 1, 'view_logentry');
INSERT INTO rss.auth_permission (id, name, content_type_id, codename) VALUES (5, 'Can add permission', 2, 'add_permission');
INSERT INTO rss.auth_permission (id, name, content_type_id, codename) VALUES (6, 'Can change permission', 2, 'change_permission');
INSERT INTO rss.auth_permission (id, name, content_type_id, codename) VALUES (7, 'Can delete permission', 2, 'delete_permission');
INSERT INTO rss.auth_permission (id, name, content_type_id, codename) VALUES (8, 'Can view permission', 2, 'view_permission');
INSERT INTO rss.auth_permission (id, name, content_type_id, codename) VALUES (9, 'Can add group', 3, 'add_group');
INSERT INTO rss.auth_permission (id, name, content_type_id, codename) VALUES (10, 'Can change group', 3, 'change_group');
INSERT INTO rss.auth_permission (id, name, content_type_id, codename) VALUES (11, 'Can delete group', 3, 'delete_group');
INSERT INTO rss.auth_permission (id, name, content_type_id, codename) VALUES (12, 'Can view group', 3, 'view_group');
INSERT INTO rss.auth_permission (id, name, content_type_id, codename) VALUES (13, 'Can add user', 4, 'add_user');
INSERT INTO rss.auth_permission (id, name, content_type_id, codename) VALUES (14, 'Can change user', 4, 'change_user');
INSERT INTO rss.auth_permission (id, name, content_type_id, codename) VALUES (15, 'Can delete user', 4, 'delete_user');
INSERT INTO rss.auth_permission (id, name, content_type_id, codename) VALUES (16, 'Can view user', 4, 'view_user');
INSERT INTO rss.auth_permission (id, name, content_type_id, codename) VALUES (17, 'Can add content type', 5, 'add_contenttype');
INSERT INTO rss.auth_permission (id, name, content_type_id, codename) VALUES (18, 'Can change content type', 5, 'change_contenttype');
INSERT INTO rss.auth_permission (id, name, content_type_id, codename) VALUES (19, 'Can delete content type', 5, 'delete_contenttype');
INSERT INTO rss.auth_permission (id, name, content_type_id, codename) VALUES (20, 'Can view content type', 5, 'view_contenttype');
INSERT INTO rss.auth_permission (id, name, content_type_id, codename) VALUES (21, 'Can add session', 6, 'add_session');
INSERT INTO rss.auth_permission (id, name, content_type_id, codename) VALUES (22, 'Can change session', 6, 'change_session');
INSERT INTO rss.auth_permission (id, name, content_type_id, codename) VALUES (23, 'Can delete session', 6, 'delete_session');
INSERT INTO rss.auth_permission (id, name, content_type_id, codename) VALUES (24, 'Can view session', 6, 'view_session');
INSERT INTO rss.auth_permission (id, name, content_type_id, codename) VALUES (25, 'Can add currency', 7, 'add_currency');
INSERT INTO rss.auth_permission (id, name, content_type_id, codename) VALUES (26, 'Can change currency', 7, 'change_currency');
INSERT INTO rss.auth_permission (id, name, content_type_id, codename) VALUES (27, 'Can delete currency', 7, 'delete_currency');
INSERT INTO rss.auth_permission (id, name, content_type_id, codename) VALUES (28, 'Can view currency', 7, 'view_currency');
INSERT INTO rss.auth_permission (id, name, content_type_id, codename) VALUES (29, 'Can add reference rates', 8, 'add_referencerates');
INSERT INTO rss.auth_permission (id, name, content_type_id, codename) VALUES (30, 'Can change reference rates', 8, 'change_referencerates');
INSERT INTO rss.auth_permission (id, name, content_type_id, codename) VALUES (31, 'Can delete reference rates', 8, 'delete_referencerates');
INSERT INTO rss.auth_permission (id, name, content_type_id, codename) VALUES (32, 'Can view reference rates', 8, 'view_referencerates');
CREATE TABLE rss.auth_user
(
    id int(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
    password varchar(128) NOT NULL,
    last_login datetime(6),
    is_superuser tinyint(1) NOT NULL,
    username varchar(150) NOT NULL,
    first_name varchar(30) NOT NULL,
    last_name varchar(150) NOT NULL,
    email varchar(254) NOT NULL,
    is_staff tinyint(1) NOT NULL,
    is_active tinyint(1) NOT NULL,
    date_joined datetime(6) NOT NULL
);
CREATE UNIQUE INDEX username ON rss.auth_user (username);
CREATE TABLE rss.auth_user_groups
(
    id int(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
    user_id int(11) NOT NULL,
    group_id int(11) NOT NULL,
    CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES rss.auth_user (id),
    CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES rss.auth_group (id)
);
CREATE UNIQUE INDEX auth_user_groups_user_id_group_id_94350c0c_uniq ON rss.auth_user_groups (user_id, group_id);
CREATE INDEX auth_user_groups_group_id_97559544_fk_auth_group_id ON rss.auth_user_groups (group_id);
CREATE TABLE rss.auth_user_user_permissions
(
    id int(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
    user_id int(11) NOT NULL,
    permission_id int(11) NOT NULL,
    CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES rss.auth_user (id),
    CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES rss.auth_permission (id)
);
CREATE UNIQUE INDEX auth_user_user_permissions_user_id_permission_id_14a6b632_uniq ON rss.auth_user_user_permissions (user_id, permission_id);
CREATE INDEX auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm ON rss.auth_user_user_permissions (permission_id);
CREATE TABLE rss.django_admin_log
(
    id int(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
    action_time datetime(6) NOT NULL,
    object_id longtext,
    object_repr varchar(200) NOT NULL,
    action_flag smallint(5) unsigned NOT NULL,
    change_message longtext NOT NULL,
    content_type_id int(11),
    user_id int(11) NOT NULL
#     CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES rss.django_content_type (id),
#     CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES rss.auth_user (id)
);
CREATE INDEX django_admin_log_content_type_id_c4bce8eb_fk_django_co ON rss.django_admin_log (content_type_id);
CREATE INDEX django_admin_log_user_id_c564eba6_fk_auth_user_id ON rss.django_admin_log (user_id);
CREATE TABLE rss.django_content_type
(
    id int(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
    app_label varchar(100) NOT NULL,
    model varchar(100) NOT NULL
);
CREATE UNIQUE INDEX django_content_type_app_label_model_76bd3d3b_uniq ON rss.django_content_type (app_label, model);
INSERT INTO rss.django_content_type (id, app_label, model) VALUES (1, 'admin', 'logentry');
INSERT INTO rss.django_content_type (id, app_label, model) VALUES (3, 'auth', 'group');
INSERT INTO rss.django_content_type (id, app_label, model) VALUES (2, 'auth', 'permission');
INSERT INTO rss.django_content_type (id, app_label, model) VALUES (4, 'auth', 'user');
INSERT INTO rss.django_content_type (id, app_label, model) VALUES (5, 'contenttypes', 'contenttype');
INSERT INTO rss.django_content_type (id, app_label, model) VALUES (7, 'reader_app', 'currency');
INSERT INTO rss.django_content_type (id, app_label, model) VALUES (8, 'reader_app', 'referencerates');
INSERT INTO rss.django_content_type (id, app_label, model) VALUES (6, 'sessions', 'session');
CREATE TABLE rss.django_migrations
(
    id int(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
    app varchar(255) NOT NULL,
    name varchar(255) NOT NULL,
    applied datetime(6) NOT NULL
);
INSERT INTO rss.django_migrations (id, app, name, applied) VALUES (1, 'contenttypes', '0001_initial', '2019-03-07 19:02:06.140859');
INSERT INTO rss.django_migrations (id, app, name, applied) VALUES (2, 'auth', '0001_initial', '2019-03-07 19:02:06.400494');
INSERT INTO rss.django_migrations (id, app, name, applied) VALUES (3, 'admin', '0001_initial', '2019-03-07 19:02:06.464719');
INSERT INTO rss.django_migrations (id, app, name, applied) VALUES (4, 'admin', '0002_logentry_remove_auto_add', '2019-03-07 19:02:06.475632');
INSERT INTO rss.django_migrations (id, app, name, applied) VALUES (5, 'admin', '0003_logentry_add_action_flag_choices', '2019-03-07 19:02:06.489280');
INSERT INTO rss.django_migrations (id, app, name, applied) VALUES (6, 'contenttypes', '0002_remove_content_type_name', '2019-03-07 19:02:06.542018');
INSERT INTO rss.django_migrations (id, app, name, applied) VALUES (7, 'auth', '0002_alter_permission_name_max_length', '2019-03-07 19:02:06.553050');
INSERT INTO rss.django_migrations (id, app, name, applied) VALUES (8, 'auth', '0003_alter_user_email_max_length', '2019-03-07 19:02:06.567319');
INSERT INTO rss.django_migrations (id, app, name, applied) VALUES (9, 'auth', '0004_alter_user_username_opts', '2019-03-07 19:02:06.578981');
INSERT INTO rss.django_migrations (id, app, name, applied) VALUES (10, 'auth', '0005_alter_user_last_login_null', '2019-03-07 19:02:06.605826');
INSERT INTO rss.django_migrations (id, app, name, applied) VALUES (11, 'auth', '0006_require_contenttypes_0002', '2019-03-07 19:02:06.610596');
INSERT INTO rss.django_migrations (id, app, name, applied) VALUES (12, 'auth', '0007_alter_validators_add_error_messages', '2019-03-07 19:02:06.623881');
INSERT INTO rss.django_migrations (id, app, name, applied) VALUES (13, 'auth', '0008_alter_user_username_max_length', '2019-03-07 19:02:06.641198');
INSERT INTO rss.django_migrations (id, app, name, applied) VALUES (14, 'auth', '0009_alter_user_last_name_max_length', '2019-03-07 19:02:06.657012');
INSERT INTO rss.django_migrations (id, app, name, applied) VALUES (15, 'reader_app', '0001_initial', '2019-03-07 19:02:06.722755');
INSERT INTO rss.django_migrations (id, app, name, applied) VALUES (16, 'sessions', '0001_initial', '2019-03-07 19:02:06.744879');
CREATE TABLE rss.django_session
(
    session_key varchar(40) PRIMARY KEY NOT NULL,
    session_data longtext NOT NULL,
    expire_date datetime(6) NOT NULL
);
CREATE INDEX django_session_expire_date_a5c62663 ON rss.django_session (expire_date);
CREATE TABLE rss.reader_app_currency
(
    id int(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
    code varchar(3) NOT NULL,
    etag varchar(20)
);
CREATE TABLE rss.reader_app_referencerates
(
    id int(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
    updated datetime(6) NOT NULL,
    exchange_rate double NOT NULL,
    currency_id int(11) NOT NULL,
    CONSTRAINT reader_app_reference_currency_id_4f57ddef_fk_reader_ap FOREIGN KEY (currency_id) REFERENCES rss.reader_app_currency (id)
);
CREATE UNIQUE INDEX reader_app_referencerates_currency_id_updated_369aa963_uniq ON rss.reader_app_referencerates (currency_id, updated);
