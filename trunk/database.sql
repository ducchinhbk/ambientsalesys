#
# TABLE STRUCTURE FOR: article_has_attachments
#

DROP TABLE IF EXISTS article_has_attachments;

CREATE TABLE `article_has_attachments` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `article_id` bigint(20) DEFAULT '0',
  `filename` varchar(250) DEFAULT '0',
  `savename` varchar(250) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;

#
# TABLE STRUCTURE FOR: clients
#

DROP TABLE IF EXISTS clients;

CREATE TABLE `clients` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` int(140) DEFAULT NULL,
  `firstname` varchar(100) DEFAULT NULL,
  `lastname` varchar(100) DEFAULT NULL,
  `email` varchar(180) DEFAULT NULL,
  `phone` varchar(25) DEFAULT NULL,
  `mobile` varchar(25) DEFAULT NULL,
  `address` varchar(150) DEFAULT NULL,
  `zipcode` varchar(30) NOT NULL,
  `userpic` varchar(150) NOT NULL DEFAULT 'no-pic.png',
  `city` varchar(45) DEFAULT NULL,
  `password` varchar(128) DEFAULT NULL,
  `inactive` tinyint(4) DEFAULT '0',
  `access` varchar(150) DEFAULT '0',
  `last_active` varchar(50) DEFAULT NULL,
  `last_login` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

#
# TABLE STRUCTURE FOR: companies
#

DROP TABLE IF EXISTS companies;

CREATE TABLE `companies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `reference` int(11) NOT NULL,
  `name` varchar(140) DEFAULT NULL,
  `client_id` varchar(140) DEFAULT NULL,
  `phone` varchar(25) DEFAULT NULL,
  `mobile` varchar(25) DEFAULT NULL,
  `address` varchar(150) DEFAULT NULL,
  `zipcode` varchar(30) NOT NULL,
  `city` varchar(45) DEFAULT NULL,
  `inactive` tinyint(4) DEFAULT '0',
  `website` varchar(250) DEFAULT NULL,
  `country` varchar(250) DEFAULT NULL,
  `vat` varchar(250) DEFAULT NULL,
  `note` longtext,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

INSERT INTO companies (`id`, `reference`, `name`, `client_id`, `phone`, `mobile`, `address`, `zipcode`, `city`, `inactive`, `website`, `country`, `vat`, `note`) VALUES (25, 41001, 'HCoffee', NULL, '', '', '', '', '', 1, '\\', '', NULL, NULL);
INSERT INTO companies (`id`, `reference`, `name`, `client_id`, `phone`, `mobile`, `address`, `zipcode`, `city`, `inactive`, `website`, `country`, `vat`, `note`) VALUES (26, 41001, 'HCoffee', NULL, '', '', '', '', '', 0, 'www.hcoffee.vn', '', NULL, NULL);
INSERT INTO companies (`id`, `reference`, `name`, `client_id`, `phone`, `mobile`, `address`, `zipcode`, `city`, `inactive`, `website`, `country`, `vat`, `note`) VALUES (27, 41002, 'Dầu nhớt Motun', NULL, '', '', '', '', '', 0, 'www.daunhotcn.com', '', NULL, NULL);


#
# TABLE STRUCTURE FOR: core
#

DROP TABLE IF EXISTS core;

CREATE TABLE `core` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `version` char(10) NOT NULL DEFAULT '0',
  `domain` varchar(65) DEFAULT NULL,
  `email` varchar(80) DEFAULT NULL,
  `company` varchar(100) DEFAULT NULL,
  `tax` varchar(5) DEFAULT NULL,
  `currency` varchar(20) DEFAULT NULL,
  `autobackup` int(11) DEFAULT NULL,
  `cronjob` int(11) DEFAULT NULL,
  `last_cronjob` int(11) DEFAULT NULL,
  `last_autobackup` int(11) DEFAULT NULL,
  `invoice_terms` mediumtext,
  `company_reference` int(6) DEFAULT NULL,
  `project_reference` int(6) DEFAULT NULL,
  `invoice_reference` int(6) DEFAULT NULL,
  `subscription_reference` int(6) DEFAULT NULL,
  `ticket_reference` int(10) DEFAULT NULL,
  `date_format` varchar(20) DEFAULT NULL,
  `date_time_format` varchar(20) DEFAULT NULL,
  `invoice_mail_subject` varchar(150) DEFAULT NULL,
  `pw_reset_mail_subject` varchar(150) DEFAULT NULL,
  `pw_reset_link_mail_subject` varchar(150) DEFAULT NULL,
  `credentials_mail_subject` varchar(150) DEFAULT NULL,
  `notification_mail_subject` varchar(150) DEFAULT NULL,
  `language` varchar(150) DEFAULT NULL,
  `invoice_address` varchar(200) DEFAULT NULL,
  `invoice_city` varchar(200) DEFAULT NULL,
  `invoice_contact` varchar(200) DEFAULT NULL,
  `invoice_tel` varchar(50) DEFAULT NULL,
  `subscription_mail_subject` varchar(250) DEFAULT NULL,
  `logo` varchar(150) DEFAULT NULL,
  `template` varchar(200) DEFAULT 'default',
  `paypal` varchar(5) DEFAULT NULL,
  `paypal_currency` varchar(200) DEFAULT 'EUR',
  `paypal_account` varchar(200) DEFAULT NULL,
  `invoice_logo` varchar(150) DEFAULT 'assets/blackline/img/invoice_logo.png',
  `pc` varchar(150) DEFAULT NULL,
  `vat` varchar(150) DEFAULT NULL,
  `ticket_email` varchar(250) DEFAULT NULL,
  `ticket_default_owner` int(10) DEFAULT '1',
  `ticket_default_queue` int(10) DEFAULT '1',
  `ticket_default_type` int(10) DEFAULT '1',
  `ticket_default_status` varchar(200) DEFAULT 'new',
  `ticket_config_host` varchar(250) DEFAULT NULL,
  `ticket_config_login` varchar(250) DEFAULT NULL,
  `ticket_config_pass` varchar(250) DEFAULT NULL,
  `ticket_config_port` varchar(250) DEFAULT NULL,
  `ticket_config_ssl` varchar(250) DEFAULT NULL,
  `ticket_config_email` varchar(250) DEFAULT NULL,
  `ticket_config_flags` varchar(250) DEFAULT '/notls',
  `ticket_config_search` varchar(250) DEFAULT 'UNSEEN',
  `ticket_config_timestamp` int(11) DEFAULT '0',
  `ticket_config_mailbox` varchar(250) DEFAULT NULL,
  `ticket_config_delete` int(11) DEFAULT '0',
  `ticket_config_active` int(11) DEFAULT '0',
  `ticket_config_imap` int(11) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

INSERT INTO core (`id`, `version`, `domain`, `email`, `company`, `tax`, `currency`, `autobackup`, `cronjob`, `last_cronjob`, `last_autobackup`, `invoice_terms`, `company_reference`, `project_reference`, `invoice_reference`, `subscription_reference`, `ticket_reference`, `date_format`, `date_time_format`, `invoice_mail_subject`, `pw_reset_mail_subject`, `pw_reset_link_mail_subject`, `credentials_mail_subject`, `notification_mail_subject`, `language`, `invoice_address`, `invoice_city`, `invoice_contact`, `invoice_tel`, `subscription_mail_subject`, `logo`, `template`, `paypal`, `paypal_currency`, `paypal_account`, `invoice_logo`, `pc`, `vat`, `ticket_email`, `ticket_default_owner`, `ticket_default_queue`, `ticket_default_type`, `ticket_default_status`, `ticket_config_host`, `ticket_config_login`, `ticket_config_pass`, `ticket_config_port`, `ticket_config_ssl`, `ticket_config_email`, `ticket_config_flags`, `ticket_config_search`, `ticket_config_timestamp`, `ticket_config_mailbox`, `ticket_config_delete`, `ticket_config_active`, `ticket_config_imap`) VALUES (1, '2.1.1', 'http://localhost/project/', 'thinkdigitalvn@gmail.com', 'Think Digital', '0', '$', 1, 1, 0, 0, 'Thank you for your business. We do expect payment within {due_date}, so please process this invoice within that time.', 41003, 51002, 31001, 61001, 10000, 'Y/m/d', 'g:i A', 'New Invoice', 'Password Reset', 'Password Reset', 'Login Details', 'Notification', 'english', 'D27 - 2204, Bellaza Department', 'Ho Chi Minh', 'Think Digital', '0985404122', 'New Subscription', 'assets/blackline/img/logo.png', 'blackline', '0', 'USD', '', 'assets/blackline/img/invoice_logo.png', '', NULL, NULL, 1, 1, 1, 'new', NULL, NULL, NULL, NULL, NULL, NULL, '/notls', 'UNSEEN', 0, NULL, 0, 0, 1);


#
# TABLE STRUCTURE FOR: invoice_has_items
#

DROP TABLE IF EXISTS invoice_has_items;

CREATE TABLE `invoice_has_items` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `invoice_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `amount` char(11) DEFAULT NULL,
  `description` mediumtext,
  `value` float DEFAULT NULL,
  `name` varchar(250) DEFAULT NULL,
  `type` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=44 DEFAULT CHARSET=utf8;

#
# TABLE STRUCTURE FOR: invoices
#

DROP TABLE IF EXISTS invoices;

CREATE TABLE `invoices` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `reference` int(11) DEFAULT NULL,
  `company_id` int(11) NOT NULL,
  `status` varchar(50) DEFAULT NULL,
  `currency` varchar(20) DEFAULT NULL,
  `issue_date` varchar(20) DEFAULT NULL,
  `due_date` varchar(20) DEFAULT NULL,
  `sent_date` varchar(20) DEFAULT NULL,
  `paid_date` varchar(20) DEFAULT NULL,
  `terms` mediumtext,
  `discount` varchar(50) DEFAULT '0',
  `subscription_id` varchar(50) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

#
# TABLE STRUCTURE FOR: items
#

DROP TABLE IF EXISTS items;

CREATE TABLE `items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `value` float DEFAULT NULL,
  `type` varchar(45) DEFAULT NULL,
  `inactive` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

#
# TABLE STRUCTURE FOR: messages
#

DROP TABLE IF EXISTS messages;

CREATE TABLE `messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) DEFAULT '0',
  `media_id` int(11) DEFAULT '0',
  `from` varchar(120) DEFAULT NULL,
  `text` text,
  `datetime` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

#
# TABLE STRUCTURE FOR: migrations
#

DROP TABLE IF EXISTS migrations;

CREATE TABLE `migrations` (
  `version` int(3) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# TABLE STRUCTURE FOR: modules
#

DROP TABLE IF EXISTS modules;

CREATE TABLE `modules` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(250) DEFAULT '0',
  `link` varchar(250) DEFAULT '0',
  `type` varchar(250) DEFAULT '0',
  `icon` varchar(150) DEFAULT NULL,
  `sort` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=105 DEFAULT CHARSET=utf8;

INSERT INTO modules (`id`, `name`, `link`, `type`, `icon`, `sort`) VALUES (1, 'Dashboard', 'dashboard', 'main', 'icon-th', 1);
INSERT INTO modules (`id`, `name`, `link`, `type`, `icon`, `sort`) VALUES (2, 'Messages', 'messages', 'main', 'icon-inbox', 2);
INSERT INTO modules (`id`, `name`, `link`, `type`, `icon`, `sort`) VALUES (3, 'Projects', 'projects', 'main', 'icon-briefcase', 3);
INSERT INTO modules (`id`, `name`, `link`, `type`, `icon`, `sort`) VALUES (4, 'Clients', 'clients', 'main', 'icon-user', 4);
INSERT INTO modules (`id`, `name`, `link`, `type`, `icon`, `sort`) VALUES (5, 'Invoices', 'invoices', 'main', 'icon-list-alt', 5);
INSERT INTO modules (`id`, `name`, `link`, `type`, `icon`, `sort`) VALUES (6, 'Items', 'items', 'main', 'icon-file', 7);
INSERT INTO modules (`id`, `name`, `link`, `type`, `icon`, `sort`) VALUES (7, 'Quotations', 'quotations', 'main', 'icon-list-alt', 8);
INSERT INTO modules (`id`, `name`, `link`, `type`, `icon`, `sort`) VALUES (8, 'Subscriptions', 'subscriptions', 'main', 'icon-calendar', 6);
INSERT INTO modules (`id`, `name`, `link`, `type`, `icon`, `sort`) VALUES (9, 'Settings', 'settings', 'main', 'icon-cog', 20);
INSERT INTO modules (`id`, `name`, `link`, `type`, `icon`, `sort`) VALUES (10, 'QuickAccess', 'quickaccess', 'widget', NULL, 50);
INSERT INTO modules (`id`, `name`, `link`, `type`, `icon`, `sort`) VALUES (11, 'User Online', 'useronline', 'widget', NULL, 51);
INSERT INTO modules (`id`, `name`, `link`, `type`, `icon`, `sort`) VALUES (12, 'Projects', 'cprojects', 'client', 'icon-briefcase', 2);
INSERT INTO modules (`id`, `name`, `link`, `type`, `icon`, `sort`) VALUES (13, 'Invoices', 'cinvoices', 'client', 'icon-list-alt', 3);
INSERT INTO modules (`id`, `name`, `link`, `type`, `icon`, `sort`) VALUES (14, 'Messages', 'cmessages', 'client', 'icon-inbox', 1);
INSERT INTO modules (`id`, `name`, `link`, `type`, `icon`, `sort`) VALUES (15, 'Subscriptions', 'csubscriptions', 'client', 'icon-calendar', 4);
INSERT INTO modules (`id`, `name`, `link`, `type`, `icon`, `sort`) VALUES (16, 'Tickets', 'tickets', 'main', 'icon-tag', 8);
INSERT INTO modules (`id`, `name`, `link`, `type`, `icon`, `sort`) VALUES (17, 'Tickets', 'ctickets', 'client', 'icon-tag', 4);


#
# TABLE STRUCTURE FOR: privatemessages
#

DROP TABLE IF EXISTS privatemessages;

CREATE TABLE `privatemessages` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `status` varchar(150) NOT NULL,
  `sender` varchar(250) NOT NULL,
  `recipient` varchar(250) NOT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `message` text,
  `time` varchar(100) NOT NULL,
  `conversation` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=125 DEFAULT CHARSET=utf8;

#
# TABLE STRUCTURE FOR: project_has_files
#

DROP TABLE IF EXISTS project_has_files;

CREATE TABLE `project_has_files` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `project_id` int(10) DEFAULT '0',
  `user_id` int(10) DEFAULT '0',
  `client_id` int(10) DEFAULT '0',
  `type` varchar(80) DEFAULT '0',
  `name` varchar(120) DEFAULT '0',
  `filename` varchar(150) DEFAULT '0',
  `description` text,
  `savename` varchar(200) DEFAULT '0',
  `phase` varchar(100) DEFAULT '0',
  `date` varchar(50) DEFAULT '0',
  `download_counter` int(10) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;

#
# TABLE STRUCTURE FOR: project_has_tasks
#

DROP TABLE IF EXISTS project_has_tasks;

CREATE TABLE `project_has_tasks` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `project_id` int(10) DEFAULT '0',
  `name` varchar(250) DEFAULT '0',
  `user_id` int(10) DEFAULT '0',
  `status` varchar(50) DEFAULT '0',
  `public` int(10) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;

INSERT INTO project_has_tasks (`id`, `project_id`, `name`, `user_id`, `status`, `public`) VALUES (38, 11, 'Thu Ho', 10, 'open', 0);


#
# TABLE STRUCTURE FOR: project_has_workers
#

DROP TABLE IF EXISTS project_has_workers;

CREATE TABLE `project_has_workers` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `project_id` int(10) DEFAULT NULL,
  `user_id` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;

INSERT INTO project_has_workers (`id`, `project_id`, `user_id`) VALUES (41, 11, 10);


#
# TABLE STRUCTURE FOR: projects
#

DROP TABLE IF EXISTS projects;

CREATE TABLE `projects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `reference` int(11) DEFAULT NULL,
  `name` varchar(65) DEFAULT NULL,
  `description` text,
  `start` varchar(20) DEFAULT NULL,
  `end` varchar(20) DEFAULT NULL,
  `progress` decimal(3,0) DEFAULT NULL,
  `phases` varchar(150) DEFAULT NULL,
  `tracking` int(11) DEFAULT NULL,
  `time_spent` int(11) DEFAULT NULL,
  `datetime` int(11) DEFAULT NULL,
  `sticky` enum('1','0') DEFAULT '0',
  `category` varchar(150) DEFAULT NULL,
  `company_id` int(11) NOT NULL,
  `note` longtext NOT NULL,
  `progress_calc` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_projects_clients1` (`company_id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

INSERT INTO projects (`id`, `reference`, `name`, `description`, `start`, `end`, `progress`, `phases`, `tracking`, `time_spent`, `datetime`, `sticky`, `category`, `company_id`, `note`, `progress_calc`) VALUES (11, 51001, 'HCoffee-Máy Rang', 'Project KPI: 1200 view', '2014-10-01', '2014-11-01', '0', 'Brief, Plan, Design, Coding, Media', NULL, NULL, 1412482006, '0', 'Digital Marketing', 26, '', 1);


#
# TABLE STRUCTURE FOR: pw_reset
#

DROP TABLE IF EXISTS pw_reset;

CREATE TABLE `pw_reset` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `email` varchar(250) DEFAULT '0',
  `timestamp` varchar(250) DEFAULT '0',
  `token` varchar(250) DEFAULT '0',
  `user` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# TABLE STRUCTURE FOR: queues
#

DROP TABLE IF EXISTS queues;

CREATE TABLE `queues` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(250) DEFAULT '0',
  `description` varchar(250) DEFAULT '0',
  `inactive` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

#
# TABLE STRUCTURE FOR: quotations
#

DROP TABLE IF EXISTS quotations;

CREATE TABLE `quotations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `q1` varchar(50) DEFAULT NULL,
  `q2` varchar(50) DEFAULT NULL,
  `q3` varchar(50) DEFAULT NULL,
  `q4` varchar(150) DEFAULT NULL,
  `q5` text,
  `q6` varchar(50) DEFAULT NULL,
  `company` varchar(150) DEFAULT '-',
  `fullname` varchar(150) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `phone` varchar(150) DEFAULT NULL,
  `address` varchar(150) DEFAULT NULL,
  `city` varchar(150) DEFAULT NULL,
  `zip` varchar(150) DEFAULT NULL,
  `country` varchar(150) DEFAULT NULL,
  `comment` text,
  `date` varchar(50) DEFAULT NULL,
  `status` varchar(150) DEFAULT '0',
  `user_id` int(50) DEFAULT '0',
  `replied` varchar(50) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

#
# TABLE STRUCTURE FOR: subscription_has_items
#

DROP TABLE IF EXISTS subscription_has_items;

CREATE TABLE `subscription_has_items` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `subscription_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `amount` char(11) DEFAULT NULL,
  `description` mediumtext,
  `value` float DEFAULT NULL,
  `name` varchar(250) DEFAULT NULL,
  `type` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=36 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

#
# TABLE STRUCTURE FOR: subscriptions
#

DROP TABLE IF EXISTS subscriptions;

CREATE TABLE `subscriptions` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `reference` varchar(50) DEFAULT NULL,
  `company_id` int(10) DEFAULT '0',
  `status` varchar(50) DEFAULT NULL,
  `currency` varchar(20) DEFAULT NULL,
  `issue_date` varchar(20) DEFAULT NULL,
  `end_date` varchar(20) DEFAULT NULL,
  `frequency` varchar(20) DEFAULT NULL,
  `next_payment` varchar(20) DEFAULT NULL,
  `terms` mediumtext,
  `discount` varchar(50) DEFAULT '0',
  `subscribed` varchar(50) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

#
# TABLE STRUCTURE FOR: ticket_has_articles
#

DROP TABLE IF EXISTS ticket_has_articles;

CREATE TABLE `ticket_has_articles` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ticket_id` int(11) DEFAULT NULL,
  `from` varchar(250) NOT NULL DEFAULT '0',
  `reply_to` varchar(250) DEFAULT '0',
  `to` varchar(250) DEFAULT '0',
  `cc` varchar(250) DEFAULT '0',
  `subject` varchar(250) DEFAULT '0',
  `message` text,
  `datetime` varchar(250) DEFAULT NULL,
  `internal` int(10) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=120 DEFAULT CHARSET=utf8;

#
# TABLE STRUCTURE FOR: ticket_has_attachments
#

DROP TABLE IF EXISTS ticket_has_attachments;

CREATE TABLE `ticket_has_attachments` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ticket_id` bigint(20) DEFAULT '0',
  `filename` varchar(250) DEFAULT '0',
  `savename` varchar(250) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=41 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

#
# TABLE STRUCTURE FOR: tickets
#

DROP TABLE IF EXISTS tickets;

CREATE TABLE `tickets` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `from` varchar(250) DEFAULT '0',
  `reference` varchar(250) DEFAULT '0',
  `type_id` smallint(6) DEFAULT '1',
  `lock` smallint(6) DEFAULT '0',
  `subject` varchar(250) DEFAULT '0',
  `text` text,
  `status` varchar(50) DEFAULT '0',
  `client_id` int(11) DEFAULT '0',
  `company_id` int(11) DEFAULT '0',
  `user_id` int(11) DEFAULT '0',
  `escalation_time` int(11) DEFAULT '0',
  `priority` varchar(50) DEFAULT '0',
  `created` int(11) DEFAULT '0',
  `queue_id` int(11) DEFAULT '0',
  `updated` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=52 DEFAULT CHARSET=utf8;

#
# TABLE STRUCTURE FOR: types
#

DROP TABLE IF EXISTS types;

CREATE TABLE `types` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(250) DEFAULT '0',
  `description` varchar(250) DEFAULT '0',
  `inactive` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

#
# TABLE STRUCTURE FOR: users
#

DROP TABLE IF EXISTS users;

CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(45) DEFAULT NULL,
  `firstname` varchar(120) DEFAULT NULL,
  `lastname` varchar(120) DEFAULT NULL,
  `hashed_password` varchar(128) DEFAULT NULL,
  `email` varchar(60) DEFAULT NULL,
  `status` enum('active','inactive','deleted') DEFAULT NULL,
  `admin` enum('0','1') DEFAULT NULL,
  `created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `userpic` varchar(250) DEFAULT 'no-pic.png',
  `title` varchar(150) NOT NULL,
  `access` varchar(150) NOT NULL DEFAULT '1,2',
  `last_active` varchar(50) DEFAULT NULL,
  `last_login` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

INSERT INTO users (`id`, `username`, `firstname`, `lastname`, `hashed_password`, `email`, `status`, `admin`, `created`, `userpic`, `title`, `access`, `last_active`, `last_login`) VALUES (10, 'Admin', 'John', 'Doe', '785ea3511702420413df674029fe58d69692b3a0a571c0ba30177c7808db69ea22a8596b1cc5777403d4374dafaa708445a9926d6ead9a262e37cb0d78db1fe5', 'local@localhost', 'active', '1', '2013-01-01 00:00:00', 'no-pic.png', 'Administrator', '1,2,3,4,5,8,6,7,9,10,11,16', '1412482173', '1412482131');


