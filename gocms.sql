/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : gocms

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2016-12-16 11:21:05
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for activity_log_event
-- ----------------------------
DROP TABLE IF EXISTS `activity_log_event`;
CREATE TABLE `activity_log_event` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime NOT NULL,
  `content` text COLLATE utf8_unicode_ci,
  `target_id` int(11) DEFAULT NULL,
  `template_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_activity_log_event_user` (`user_id`),
  KEY `fk_activity_log_event_template` (`template_id`),
  CONSTRAINT `fk_activity_log_event_template` FOREIGN KEY (`template_id`) REFERENCES `activity_log_template` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_activity_log_event_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of activity_log_event
-- ----------------------------

-- ----------------------------
-- Table structure for activity_log_template
-- ----------------------------
DROP TABLE IF EXISTS `activity_log_template`;
CREATE TABLE `activity_log_template` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `event_identifier` varchar(255) NOT NULL,
  `event_name` varchar(255) NOT NULL,
  `template` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of activity_log_template
-- ----------------------------
INSERT INTO `activity_log_template` VALUES ('1', 'Gc\\User\\Model', 'after.save', '<?= $this->escapeHtml($this->event->getParam(\'user\')) ?> has saved the user model <a href=\"<?= $this->url(\'config/user/edit\', array(\'id\' => $this->event->getTarget()->getId())) ?>\"><?= $this->event->getTarget()->getName(); ?></a>');
INSERT INTO `activity_log_template` VALUES ('2', 'Gc\\Datatype\\Model', 'after.save', '<?= $this->escapeHtml($this->event->getParam(\'user\')) ?> has saved the datatype model <a href=\"<?= $this->url(\'development/datatype/edit\', array(\'id\' => $this->event->getTarget()->getId())) ?>\"><?= $this->event->getTarget()->getName(); ?></a>');
INSERT INTO `activity_log_template` VALUES ('3', 'Gc\\Datatype\\Model', 'after.delete', '<?= $this->escapeHtml($this->event->getParam(\'user\')) ?> has deleted the datatype model <strong>\"<?= $this->escapeHtml($this->event->getTarget()->getName()); ?>\"</strong>');
INSERT INTO `activity_log_template` VALUES ('4', 'Gc\\Document\\Model', 'after.delete', '<?= $this->escapeHtml($this->event->getParam(\'user\')) ?> has deleted the document model <strong>\"\"<?= $this->escapeHtml($this->event->getTarget()->getName()); ?>\"</strong>');
INSERT INTO `activity_log_template` VALUES ('5', 'Gc\\Document\\Model', 'after.save', '<?= $this->escapeHtml($this->event->getParam(\'user\')) ?> has saved the document model <a href=\"<?= $this->url(\'content/document/edit\', array(\'id\' => $this->event->getTarget()->getId())) ?>\"><?= $this->event->getTarget()->getName(); ?></a>');
INSERT INTO `activity_log_template` VALUES ('6', 'Gc\\DocumentType\\Model', 'after.save', '<?= $this->escapeHtml($this->event->getParam(\'user\')) ?> has saved the document type model <a href=\"<?= $this->url(\'development/document-type/edit\', array(\'id\' => $this->event->getTarget()->getId())) ?>\"><?= $this->event->getTarget()->getName(); ?></a>');
INSERT INTO `activity_log_template` VALUES ('7', 'Gc\\DocumentType\\Model', 'after.delete', '<?= $this->escapeHtml($this->event->getParam(\'user\')) ?> has deleted the document type model <strong>\"<?= $this->escapeHtml($this->event->getTarget()->getName()); ?>\"</strong>');
INSERT INTO `activity_log_template` VALUES ('8', 'Gc\\Layout\\Model', 'after.delete', '<?= $this->escapeHtml($this->event->getParam(\'user\')) ?> has deleted the layout model <strong>\"<?= $this->escapeHtml($this->event->getTarget()->getName()); ?>\"</strong>');
INSERT INTO `activity_log_template` VALUES ('9', 'Gc\\View\\Model', 'after.delete', '<?= $this->escapeHtml($this->event->getParam(\'user\')) ?> has deleted the view model <strong>\"<?= $this->escapeHtml($this->event->getTarget()->getName()); ?>\"</strong>');
INSERT INTO `activity_log_template` VALUES ('10', 'Gc\\Script\\Model', 'after.delete', '<?= $this->escapeHtml($this->event->getParam(\'user\')) ?> has deleted the script model <strong>\"<?= $this->escapeHtml($this->event->getTarget()->getName()); ?>\"</strong>');
INSERT INTO `activity_log_template` VALUES ('11', 'Gc\\View\\Model', 'after.save', '<?= $this->escapeHtml($this->event->getParam(\'user\')) ?> has saved the view model <a href=\"<?= $this->url(\'development/view/edit\', array(\'id\' => $this->event->getTarget()->getId())) ?>\"><?= $this->event->getTarget()->getName(); ?></a>');
INSERT INTO `activity_log_template` VALUES ('12', 'Gc\\Script\\Model', 'after.save', '<?= $this->escapeHtml($this->event->getParam(\'user\')) ?> has saved the script model <a href=\"<?= $this->url(\'development/script/edit\', array(\'id\' => $this->event->getTarget()->getId())) ?>\"><?= $this->event->getTarget()->getName(); ?></a>');
INSERT INTO `activity_log_template` VALUES ('13', 'Gc\\Layout\\Model', 'after.save', '<?= $this->escapeHtml($this->event->getParam(\'user\')) ?> has saved the layout model <a href=\"<?= $this->url(\'development/layout/edit\', array(\'id\' => $this->event->getTarget()->getId())) ?>\"><?= $this->event->getTarget()->getName(); ?></a>');
INSERT INTO `activity_log_template` VALUES ('14', 'Gc\\User\\Model', 'after.delete', '<?= $this->escapeHtml($this->event->getParam(\'user\')) ?> has deleted the user model <strong>\"<?= $this->escapeHtml($this->event->getTarget()->getName()); ?>\"</strong>');
INSERT INTO `activity_log_template` VALUES ('15', 'Gc\\User\\Model', 'after.auth', '<?= $this->escapeHtml($this->event->getTarget()->getName()) ?> is now connected with the ip address: <strong><?php $remote = new \\Zend\\Http\\PhpEnvironment\\RemoteAddress; echo $this->escapeHtml($remote->getIpAddress()); ?></strong>');
INSERT INTO `activity_log_template` VALUES ('16', 'Gc\\User\\Model', 'after.auth.failed', '<?php $remote = new \\Zend\\Http\\PhpEnvironment\\RemoteAddress; echo $this->escapeHtml($remote->getIpAddress()); ?> tried to connect with <strong>\"<?= $this->escapeHtml($this->event->getParam(\'login\')); ?>\"</strong>');

-- ----------------------------
-- Table structure for blog_comment
-- ----------------------------
DROP TABLE IF EXISTS `blog_comment`;
CREATE TABLE `blog_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime NOT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `show_email` smallint(6) NOT NULL DEFAULT '0',
  `is_active` smallint(6) NOT NULL DEFAULT '0',
  `message` text COLLATE utf8_unicode_ci,
  `document_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_blog_comment_document` (`document_id`),
  CONSTRAINT `fk_blog_comment_document` FOREIGN KEY (`document_id`) REFERENCES `document` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of blog_comment
-- ----------------------------

-- ----------------------------
-- Table structure for core_config_data
-- ----------------------------
DROP TABLE IF EXISTS `core_config_data`;
CREATE TABLE `core_config_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`identifier`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of core_config_data
-- ----------------------------
INSERT INTO `core_config_data` VALUES ('1', 'site_name', 'CMC OSD2');
INSERT INTO `core_config_data` VALUES ('2', 'site_is_offline', null);
INSERT INTO `core_config_data` VALUES ('3', 'cookie_domain', 'gocms.lc');
INSERT INTO `core_config_data` VALUES ('4', 'session_lifetime', '3600');
INSERT INTO `core_config_data` VALUES ('5', 'locale', 'en_US');
INSERT INTO `core_config_data` VALUES ('6', 'mail_from', 'quan.le350@gmail.com');
INSERT INTO `core_config_data` VALUES ('7', 'mail_from_name', 'Quan  Lee');
INSERT INTO `core_config_data` VALUES ('8', 'dashboard_widgets', '');
INSERT INTO `core_config_data` VALUES ('9', 'debug_is_active', '0');
INSERT INTO `core_config_data` VALUES ('10', 'cache_is_active', '0');
INSERT INTO `core_config_data` VALUES ('11', 'cache_handler', 'filesystem');
INSERT INTO `core_config_data` VALUES ('12', 'cache_lifetime', '600');
INSERT INTO `core_config_data` VALUES ('13', 'session_path', '');
INSERT INTO `core_config_data` VALUES ('14', 'session_handler', '0');
INSERT INTO `core_config_data` VALUES ('15', 'site_offline_document', '0');
INSERT INTO `core_config_data` VALUES ('16', 'site_404_layout', '0');
INSERT INTO `core_config_data` VALUES ('17', 'site_exception_layout', '0');
INSERT INTO `core_config_data` VALUES ('18', 'cookie_path', '/');
INSERT INTO `core_config_data` VALUES ('19', 'unsecure_frontend_base_path', '');
INSERT INTO `core_config_data` VALUES ('20', 'secure_frontend_base_path', '');
INSERT INTO `core_config_data` VALUES ('21', 'unsecure_backend_base_path', '');
INSERT INTO `core_config_data` VALUES ('22', 'secure_backend_base_path', '');
INSERT INTO `core_config_data` VALUES ('23', 'unsecure_cdn_base_path', '');
INSERT INTO `core_config_data` VALUES ('24', 'secure_cdn_base_path', '');
INSERT INTO `core_config_data` VALUES ('25', 'force_backend_ssl', '');
INSERT INTO `core_config_data` VALUES ('26', 'force_frontend_ssl', '');

-- ----------------------------
-- Table structure for core_session
-- ----------------------------
DROP TABLE IF EXISTS `core_session`;
CREATE TABLE `core_session` (
  `id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `updated_at` int(11) NOT NULL,
  `lifetime` int(11) NOT NULL,
  `data` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of core_session
-- ----------------------------

-- ----------------------------
-- Table structure for core_translate
-- ----------------------------
DROP TABLE IF EXISTS `core_translate`;
CREATE TABLE `core_translate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `source` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=405 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of core_translate
-- ----------------------------
INSERT INTO `core_translate` VALUES ('1', 'Add');
INSERT INTO `core_translate` VALUES ('2', '-- Use parent configuration');
INSERT INTO `core_translate` VALUES ('3', 'Add property');
INSERT INTO `core_translate` VALUES ('4', 'Add Tab');
INSERT INTO `core_translate` VALUES ('5', 'Add translation');
INSERT INTO `core_translate` VALUES ('6', 'Add view');
INSERT INTO `core_translate` VALUES ('7', 'Administration Panel');
INSERT INTO `core_translate` VALUES ('8', 'Administrator');
INSERT INTO `core_translate` VALUES ('9', 'Available children');
INSERT INTO `core_translate` VALUES ('10', 'Content');
INSERT INTO `core_translate` VALUES ('11', 'Cookie domain');
INSERT INTO `core_translate` VALUES ('12', 'Cookie path');
INSERT INTO `core_translate` VALUES ('13', 'Copy');
INSERT INTO `core_translate` VALUES ('14', 'Create');
INSERT INTO `core_translate` VALUES ('15', 'Create document');
INSERT INTO `core_translate` VALUES ('16', 'Create, edit, and delete users.');
INSERT INTO `core_translate` VALUES ('17', 'Create, edit, and delete views.');
INSERT INTO `core_translate` VALUES ('18', 'Create your own website');
INSERT INTO `core_translate` VALUES ('19', 'Cut');
INSERT INTO `core_translate` VALUES ('20', 'Dashboard');
INSERT INTO `core_translate` VALUES ('21', 'Data can be stored in. Create your own datatype, edit configuration and insert it in document type.');
INSERT INTO `core_translate` VALUES ('22', 'Datatype');
INSERT INTO `core_translate` VALUES ('23', 'Datatypes');
INSERT INTO `core_translate` VALUES ('24', 'Debug is active');
INSERT INTO `core_translate` VALUES ('25', 'Cache is active');
INSERT INTO `core_translate` VALUES ('26', 'Cache handler');
INSERT INTO `core_translate` VALUES ('27', 'Cache lifetime');
INSERT INTO `core_translate` VALUES ('28', 'Default view');
INSERT INTO `core_translate` VALUES ('29', 'Define the data to be used for the website such as the locale, sessions, name...');
INSERT INTO `core_translate` VALUES ('30', 'Delete');
INSERT INTO `core_translate` VALUES ('31', 'Development');
INSERT INTO `core_translate` VALUES ('32', 'Developper');
INSERT INTO `core_translate` VALUES ('33', 'Disconnect');
INSERT INTO `core_translate` VALUES ('34', 'Document types');
INSERT INTO `core_translate` VALUES ('35', 'Edit');
INSERT INTO `core_translate` VALUES ('36', 'Edit translation for frontend and backend.');
INSERT INTO `core_translate` VALUES ('37', 'elFinder is an open-source file manager for web. And with you can manage your files, folders and others data of this website.');
INSERT INTO `core_translate` VALUES ('38', 'Fast links');
INSERT INTO `core_translate` VALUES ('39', 'File manager');
INSERT INTO `core_translate` VALUES ('40', 'Files');
INSERT INTO `core_translate` VALUES ('41', 'Firstname');
INSERT INTO `core_translate` VALUES ('42', 'Forgot your password?');
INSERT INTO `core_translate` VALUES ('43', 'From E-mail');
INSERT INTO `core_translate` VALUES ('44', 'From name');
INSERT INTO `core_translate` VALUES ('45', 'General');
INSERT INTO `core_translate` VALUES ('46', 'General configuration');
INSERT INTO `core_translate` VALUES ('47', 'He has many options like an window explorer. Be careful when deleting data, it is not reversible.');
INSERT INTO `core_translate` VALUES ('48', 'Identifier');
INSERT INTO `core_translate` VALUES ('49', 'Import tab');
INSERT INTO `core_translate` VALUES ('50', 'Insert in document types, if you want to get and use property write: $this->propertyIdentifier');
INSERT INTO `core_translate` VALUES ('51', 'Is active');
INSERT INTO `core_translate` VALUES ('52', 'Is offline');
INSERT INTO `core_translate` VALUES ('53', 'Lastname');
INSERT INTO `core_translate` VALUES ('54', 'Layouts');
INSERT INTO `core_translate` VALUES ('55', 'Limit users access with roles and permissions');
INSERT INTO `core_translate` VALUES ('56', 'List');
INSERT INTO `core_translate` VALUES ('57', 'Log In');
INSERT INTO `core_translate` VALUES ('58', 'Make the M.V.C be with you');
INSERT INTO `core_translate` VALUES ('59', 'Manage content');
INSERT INTO `core_translate` VALUES ('60', 'Manage documents');
INSERT INTO `core_translate` VALUES ('61', 'Manage modules');
INSERT INTO `core_translate` VALUES ('62', 'Managing configuration');
INSERT INTO `core_translate` VALUES ('63', 'Managing Datatypes');
INSERT INTO `core_translate` VALUES ('64', 'Managing documents');
INSERT INTO `core_translate` VALUES ('65', 'Managing Document types');
INSERT INTO `core_translate` VALUES ('66', 'Managing Layouts');
INSERT INTO `core_translate` VALUES ('67', 'Managing resources');
INSERT INTO `core_translate` VALUES ('68', 'Managing Roles');
INSERT INTO `core_translate` VALUES ('69', 'Managing Scripts');
INSERT INTO `core_translate` VALUES ('70', 'Managing translation');
INSERT INTO `core_translate` VALUES ('71', 'Managing Users');
INSERT INTO `core_translate` VALUES ('72', 'Managing Views');
INSERT INTO `core_translate` VALUES ('73', 'Model');
INSERT INTO `core_translate` VALUES ('74', 'Name');
INSERT INTO `core_translate` VALUES ('75', 'New');
INSERT INTO `core_translate` VALUES ('76', 'Next');
INSERT INTO `core_translate` VALUES ('77', 'Offline document');
INSERT INTO `core_translate` VALUES ('78', 'Online documents');
INSERT INTO `core_translate` VALUES ('79', 'Password');
INSERT INTO `core_translate` VALUES ('80', 'Password Confirm');
INSERT INTO `core_translate` VALUES ('81', 'Paste');
INSERT INTO `core_translate` VALUES ('82', 'Properties');
INSERT INTO `core_translate` VALUES ('83', 'Quit');
INSERT INTO `core_translate` VALUES ('84', 'Required');
INSERT INTO `core_translate` VALUES ('85', 'Role');
INSERT INTO `core_translate` VALUES ('86', 'Save');
INSERT INTO `core_translate` VALUES ('87', 'Save and publish');
INSERT INTO `core_translate` VALUES ('88', 'Server');
INSERT INTO `core_translate` VALUES ('89', 'Server locale');
INSERT INTO `core_translate` VALUES ('90', 'Session handler');
INSERT INTO `core_translate` VALUES ('91', 'Session lifetime');
INSERT INTO `core_translate` VALUES ('92', 'Site name');
INSERT INTO `core_translate` VALUES ('93', 'Staffer');
INSERT INTO `core_translate` VALUES ('94', 'System');
INSERT INTO `core_translate` VALUES ('95', 'System configuration');
INSERT INTO `core_translate` VALUES ('96', 'Tabs');
INSERT INTO `core_translate` VALUES ('97', 'There\'s lot of Helper you can use. Those Zend Framework and GotCms, refer to documentation if you want more information.');
INSERT INTO `core_translate` VALUES ('98', 'These items will be permanently deleted and cannot be recovered. Are you sure?');
INSERT INTO `core_translate` VALUES ('99', 'These items will be permanently updated and cannot be recovered. Are you sure?');
INSERT INTO `core_translate` VALUES ('100', 'This is a document pattern. Sort by tabs, insert datatypes and specify availables views.');
INSERT INTO `core_translate` VALUES ('101', 'Total documents');
INSERT INTO `core_translate` VALUES ('102', 'Translations');
INSERT INTO `core_translate` VALUES ('103', 'User list');
INSERT INTO `core_translate` VALUES ('104', 'Users');
INSERT INTO `core_translate` VALUES ('105', 'Views');
INSERT INTO `core_translate` VALUES ('106', 'Website statistics');
INSERT INTO `core_translate` VALUES ('107', 'Welcome %s');
INSERT INTO `core_translate` VALUES ('108', 'Work like views, you can get properties, use helpers, and if you want to integrate children (view) write: $this->content.');
INSERT INTO `core_translate` VALUES ('109', 'Work like Zend Framework controllers, you can get the request, response and controller plugins.');
INSERT INTO `core_translate` VALUES ('110', 'You can create, edit, copy, cut and paste document by right-clicking on Website or children documents.');
INSERT INTO `core_translate` VALUES ('111', 'You use GotCms %s');
INSERT INTO `core_translate` VALUES ('112', 'Steps:');
INSERT INTO `core_translate` VALUES ('113', 'Language');
INSERT INTO `core_translate` VALUES ('114', 'License');
INSERT INTO `core_translate` VALUES ('115', 'Pre-configuration');
INSERT INTO `core_translate` VALUES ('116', 'Database');
INSERT INTO `core_translate` VALUES ('117', 'You must accept this license for continue to install this software.');
INSERT INTO `core_translate` VALUES ('118', 'Continue');
INSERT INTO `core_translate` VALUES ('119', 'Pre-installation check for GotCms %s');
INSERT INTO `core_translate` VALUES ('120', 'Please make sure all parameters are set to \"Yes\" before continue installation');
INSERT INTO `core_translate` VALUES ('121', 'Yes');
INSERT INTO `core_translate` VALUES ('122', 'On');
INSERT INTO `core_translate` VALUES ('123', 'Off');
INSERT INTO `core_translate` VALUES ('124', 'Recommended');
INSERT INTO `core_translate` VALUES ('125', '%s is writable');
INSERT INTO `core_translate` VALUES ('126', 'Recommended settings:');
INSERT INTO `core_translate` VALUES ('127', 'These settings are recommended for PHP in order to ensure full compatibility.');
INSERT INTO `core_translate` VALUES ('128', 'Actual');
INSERT INTO `core_translate` VALUES ('129', 'All parameters must be set to \"Yes\"');
INSERT INTO `core_translate` VALUES ('130', 'Stats');
INSERT INTO `core_translate` VALUES ('131', 'Total visitors');
INSERT INTO `core_translate` VALUES ('132', 'Total page views');
INSERT INTO `core_translate` VALUES ('133', 'Update');
INSERT INTO `core_translate` VALUES ('134', 'all');
INSERT INTO `core_translate` VALUES ('135', 'user');
INSERT INTO `core_translate` VALUES ('136', 'media');
INSERT INTO `core_translate` VALUES ('137', 'translation');
INSERT INTO `core_translate` VALUES ('138', 'view');
INSERT INTO `core_translate` VALUES ('139', 'layout');
INSERT INTO `core_translate` VALUES ('140', '404 layout');
INSERT INTO `core_translate` VALUES ('141', 'Exception layout');
INSERT INTO `core_translate` VALUES ('142', 'document-type');
INSERT INTO `core_translate` VALUES ('143', 'You already have the latest version');
INSERT INTO `core_translate` VALUES ('144', 'This day');
INSERT INTO `core_translate` VALUES ('145', 'This month');
INSERT INTO `core_translate` VALUES ('146', 'This year');
INSERT INTO `core_translate` VALUES ('147', 'All the time');
INSERT INTO `core_translate` VALUES ('148', 'Pages views');
INSERT INTO `core_translate` VALUES ('149', 'Visitors');
INSERT INTO `core_translate` VALUES ('150', 'Most urls views');
INSERT INTO `core_translate` VALUES ('151', 'Referers');
INSERT INTO `core_translate` VALUES ('152', 'These modules may have problems:');
INSERT INTO `core_translate` VALUES ('153', 'These datatypes may have problems:');
INSERT INTO `core_translate` VALUES ('154', 'Version %s has been released, please upgrade for security issues.');
INSERT INTO `core_translate` VALUES ('155', 'Do you really want to update GotCms?');
INSERT INTO `core_translate` VALUES ('156', 'You can follow this project on github:');
INSERT INTO `core_translate` VALUES ('157', 'Admin panel');
INSERT INTO `core_translate` VALUES ('158', 'Modules');
INSERT INTO `core_translate` VALUES ('159', 'Configuration');
INSERT INTO `core_translate` VALUES ('160', 'Source');
INSERT INTO `core_translate` VALUES ('161', 'Destination');
INSERT INTO `core_translate` VALUES ('162', 'Scripts');
INSERT INTO `core_translate` VALUES ('163', 'Infos');
INSERT INTO `core_translate` VALUES ('164', 'Locale');
INSERT INTO `core_translate` VALUES ('165', 'Description');
INSERT INTO `core_translate` VALUES ('166', 'Icon');
INSERT INTO `core_translate` VALUES ('167', 'About');
INSERT INTO `core_translate` VALUES ('168', 'Statistics');
INSERT INTO `core_translate` VALUES ('169', 'Uninstall');
INSERT INTO `core_translate` VALUES ('170', '-- Select --');
INSERT INTO `core_translate` VALUES ('171', 'Select document');
INSERT INTO `core_translate` VALUES ('172', 'Show / Hide form create datatype');
INSERT INTO `core_translate` VALUES ('173', 'Tab');
INSERT INTO `core_translate` VALUES ('174', 'Download all files');
INSERT INTO `core_translate` VALUES ('175', 'Upload file');
INSERT INTO `core_translate` VALUES ('176', 'Upload files');
INSERT INTO `core_translate` VALUES ('177', 'Update content');
INSERT INTO `core_translate` VALUES ('178', 'Files as: identifier.phtml');
INSERT INTO `core_translate` VALUES ('179', 'Files with locale name and csv or php extensions: fr_FR.php, en_GB.csv, &c...');
INSERT INTO `core_translate` VALUES ('180', 'Upload');
INSERT INTO `core_translate` VALUES ('181', 'Download file');
INSERT INTO `core_translate` VALUES ('182', '%d active comment(s)');
INSERT INTO `core_translate` VALUES ('183', '%d unactive comment(s)');
INSERT INTO `core_translate` VALUES ('184', 'Generate');
INSERT INTO `core_translate` VALUES ('185', 'Data only');
INSERT INTO `core_translate` VALUES ('186', 'Structure only');
INSERT INTO `core_translate` VALUES ('187', 'Structure and data');
INSERT INTO `core_translate` VALUES ('188', 'Download');
INSERT INTO `core_translate` VALUES ('189', 'Care');
INSERT INTO `core_translate` VALUES ('190', 'Logout');
INSERT INTO `core_translate` VALUES ('191', 'Click to logout');
INSERT INTO `core_translate` VALUES ('192', 'This script has been saved');
INSERT INTO `core_translate` VALUES ('193', 'This layout has been saved');
INSERT INTO `core_translate` VALUES ('194', 'This view has been saved');
INSERT INTO `core_translate` VALUES ('195', 'This user has been saved');
INSERT INTO `core_translate` VALUES ('196', 'This datatype has been saved');
INSERT INTO `core_translate` VALUES ('197', 'This document type has been saved');
INSERT INTO `core_translate` VALUES ('198', 'This document has been saved');
INSERT INTO `core_translate` VALUES ('199', 'Configuration saved');
INSERT INTO `core_translate` VALUES ('200', 'User can not be saved');
INSERT INTO `core_translate` VALUES ('201', 'User does not exists');
INSERT INTO `core_translate` VALUES ('202', 'The user has been deleted');
INSERT INTO `core_translate` VALUES ('203', 'This datatype has been deleted');
INSERT INTO `core_translate` VALUES ('204', 'This document type has been deleted');
INSERT INTO `core_translate` VALUES ('205', 'This tab has been deleted');
INSERT INTO `core_translate` VALUES ('206', 'This property has been deleted');
INSERT INTO `core_translate` VALUES ('207', 'This layout has been deleted');
INSERT INTO `core_translate` VALUES ('208', 'This script has been deleted');
INSERT INTO `core_translate` VALUES ('209', 'This view has been deleted');
INSERT INTO `core_translate` VALUES ('210', 'Role has been deleted');
INSERT INTO `core_translate` VALUES ('211', 'Role does not exists');
INSERT INTO `core_translate` VALUES ('212', 'Datatype does not exists');
INSERT INTO `core_translate` VALUES ('213', 'Document type does not exists');
INSERT INTO `core_translate` VALUES ('214', 'View does not exists');
INSERT INTO `core_translate` VALUES ('215', 'Layout does not exists');
INSERT INTO `core_translate` VALUES ('216', 'Script does not exists');
INSERT INTO `core_translate` VALUES ('217', 'Git project has been found, make sure you clone with apache user.');
INSERT INTO `core_translate` VALUES ('218', 'Database configuration');
INSERT INTO `core_translate` VALUES ('219', 'Login');
INSERT INTO `core_translate` VALUES ('220', 'Admin password');
INSERT INTO `core_translate` VALUES ('221', 'Confirm admin password');
INSERT INTO `core_translate` VALUES ('222', 'Default template');
INSERT INTO `core_translate` VALUES ('223', 'The request has been stopped, please refresh the page');
INSERT INTO `core_translate` VALUES ('224', 'Installation complete. Please refresh or go to /admin page to manage your website.');
INSERT INTO `core_translate` VALUES ('225', 'The installation is being completed');
INSERT INTO `core_translate` VALUES ('226', 'Install');
INSERT INTO `core_translate` VALUES ('227', 'Refresh');
INSERT INTO `core_translate` VALUES ('228', 'Select an option');
INSERT INTO `core_translate` VALUES ('229', 'Create database');
INSERT INTO `core_translate` VALUES ('230', 'Insert data');
INSERT INTO `core_translate` VALUES ('231', 'Insert translations');
INSERT INTO `core_translate` VALUES ('232', 'Create users and roles');
INSERT INTO `core_translate` VALUES ('233', 'Install template');
INSERT INTO `core_translate` VALUES ('234', 'Create configuration file');
INSERT INTO `core_translate` VALUES ('235', 'Copy document');
INSERT INTO `core_translate` VALUES ('236', 'All form fields are required');
INSERT INTO `core_translate` VALUES ('237', 'Please fill all fields');
INSERT INTO `core_translate` VALUES ('238', 'Delete element');
INSERT INTO `core_translate` VALUES ('239', 'Cancel');
INSERT INTO `core_translate` VALUES ('240', 'Confirm');
INSERT INTO `core_translate` VALUES ('241', 'Mandatory');
INSERT INTO `core_translate` VALUES ('242', 'Publish');
INSERT INTO `core_translate` VALUES ('243', 'Show in nav');
INSERT INTO `core_translate` VALUES ('244', 'Previewy');
INSERT INTO `core_translate` VALUES ('245', 'Session path');
INSERT INTO `core_translate` VALUES ('246', 'Document information');
INSERT INTO `core_translate` VALUES ('247', 'Force backend SSL');
INSERT INTO `core_translate` VALUES ('248', 'Unsecure backend base path');
INSERT INTO `core_translate` VALUES ('249', 'Unsecure frontend base path');
INSERT INTO `core_translate` VALUES ('250', 'Secure backend base path');
INSERT INTO `core_translate` VALUES ('251', 'Secure frontend base path');
INSERT INTO `core_translate` VALUES ('252', 'Unsecure cdn base path');
INSERT INTO `core_translate` VALUES ('253', 'Secure cdn base path');
INSERT INTO `core_translate` VALUES ('254', 'Can be cached');
INSERT INTO `core_translate` VALUES ('255', 'Toggle navigation');
INSERT INTO `core_translate` VALUES ('256', 'Invalid type given. String, integer or float expected');
INSERT INTO `core_translate` VALUES ('257', 'The input contains characters which are non alphabetic and no digits');
INSERT INTO `core_translate` VALUES ('258', 'The input is an empty string');
INSERT INTO `core_translate` VALUES ('259', 'Invalid type given. String expected');
INSERT INTO `core_translate` VALUES ('260', 'The input contains non alphabetic characters');
INSERT INTO `core_translate` VALUES ('261', 'The input does not appear to be a float');
INSERT INTO `core_translate` VALUES ('262', 'Invalid type given. String or integer expected');
INSERT INTO `core_translate` VALUES ('263', 'The input does not appear to be an integer');
INSERT INTO `core_translate` VALUES ('264', 'The input does not appear to be a postal code');
INSERT INTO `core_translate` VALUES ('265', 'An exception has been raised while validating the input');
INSERT INTO `core_translate` VALUES ('266', 'The input failed checksum validation');
INSERT INTO `core_translate` VALUES ('267', 'The input contains invalid characters');
INSERT INTO `core_translate` VALUES ('268', 'The input should have a length of %length% characters');
INSERT INTO `core_translate` VALUES ('269', 'The input is not between \'%min%\' and \'%max%\', inclusively');
INSERT INTO `core_translate` VALUES ('270', 'The input is not strictly between \'%min%\' and \'%max%\'');
INSERT INTO `core_translate` VALUES ('271', 'The input is not valid');
INSERT INTO `core_translate` VALUES ('272', 'An exception has been raised within the callback');
INSERT INTO `core_translate` VALUES ('273', 'The input seems to contain an invalid checksum');
INSERT INTO `core_translate` VALUES ('274', 'The input must contain only digits');
INSERT INTO `core_translate` VALUES ('275', 'The input contains an invalid amount of digits');
INSERT INTO `core_translate` VALUES ('276', 'The input is not from an allowed institute');
INSERT INTO `core_translate` VALUES ('277', 'The input seems to be an invalid creditcard number');
INSERT INTO `core_translate` VALUES ('278', 'The form submitted did not originate from the expected site');
INSERT INTO `core_translate` VALUES ('279', 'Invalid type given. String, integer, array or DateTime expected');
INSERT INTO `core_translate` VALUES ('280', 'The input does not appear to be a valid date');
INSERT INTO `core_translate` VALUES ('281', 'The input does not fit the date format \'%format%\'');
INSERT INTO `core_translate` VALUES ('282', 'The input is not a valid step');
INSERT INTO `core_translate` VALUES ('283', 'No record matching the input was found');
INSERT INTO `core_translate` VALUES ('284', 'A record matching the input was found');
INSERT INTO `core_translate` VALUES ('285', 'The input is not a valid email address. Use the basic format local-part@hostname');
INSERT INTO `core_translate` VALUES ('286', '\'%hostname%\' is not a valid hostname for the email address');
INSERT INTO `core_translate` VALUES ('287', '\'%hostname%\' does not appear to have any valid MX or A records for the email address');
INSERT INTO `core_translate` VALUES ('288', '\'%hostname%\' is not in a routable network segment. The email address should not be resolved from public network');
INSERT INTO `core_translate` VALUES ('289', '\'%localPart%\' can not be matched against dot-atom format');
INSERT INTO `core_translate` VALUES ('290', '\'%localPart%\' can not be matched against quoted-string format');
INSERT INTO `core_translate` VALUES ('291', '\'%localPart%\' is not a valid local part for the email address');
INSERT INTO `core_translate` VALUES ('292', 'The input exceeds the allowed length');
INSERT INTO `core_translate` VALUES ('293', 'Too many files, maximum \'%max%\' are allowed but \'%count%\' are given');
INSERT INTO `core_translate` VALUES ('294', 'Too few files, minimum \'%min%\' are expected but \'%count%\' are given');
INSERT INTO `core_translate` VALUES ('295', 'File \'%value%\' does not match the given crc32 hashes');
INSERT INTO `core_translate` VALUES ('296', 'A crc32 hash could not be evaluated for the given file');
INSERT INTO `core_translate` VALUES ('297', 'File \'%value%\' is not readable or does not exist');
INSERT INTO `core_translate` VALUES ('298', 'File \'%value%\' has a false extension');
INSERT INTO `core_translate` VALUES ('299', 'File \'%value%\' does not exist');
INSERT INTO `core_translate` VALUES ('300', 'All files in sum should have a maximum size of \'%max%\' but \'%size%\' were detected');
INSERT INTO `core_translate` VALUES ('301', 'All files in sum should have a minimum size of \'%min%\' but \'%size%\' were detected');
INSERT INTO `core_translate` VALUES ('302', 'One or more files can not be read');
INSERT INTO `core_translate` VALUES ('303', 'File \'%value%\' does not match the given hashes');
INSERT INTO `core_translate` VALUES ('304', 'A hash could not be evaluated for the given file');
INSERT INTO `core_translate` VALUES ('305', 'Maximum allowed width for image \'%value%\' should be \'%maxwidth%\' but \'%width%\' detected');
INSERT INTO `core_translate` VALUES ('306', 'Minimum expected width for image \'%value%\' should be \'%minwidth%\' but \'%width%\' detected');
INSERT INTO `core_translate` VALUES ('307', 'Maximum allowed height for image \'%value%\' should be \'%maxheight%\' but \'%height%\' detected');
INSERT INTO `core_translate` VALUES ('308', 'Minimum expected height for image \'%value%\' should be \'%minheight%\' but \'%height%\' detected');
INSERT INTO `core_translate` VALUES ('309', 'The size of image \'%value%\' could not be detected');
INSERT INTO `core_translate` VALUES ('310', 'File \'%value%\' is not compressed, \'%type%\' detected');
INSERT INTO `core_translate` VALUES ('311', 'The mimetype of file \'%value%\' could not be detected');
INSERT INTO `core_translate` VALUES ('312', 'File \'%value%\' is no image, \'%type%\' detected');
INSERT INTO `core_translate` VALUES ('313', 'File \'%value%\' does not match the given md5 hashes');
INSERT INTO `core_translate` VALUES ('314', 'A md5 hash could not be evaluated for the given file');
INSERT INTO `core_translate` VALUES ('315', 'File \'%value%\' has a false mimetype of \'%type%\'');
INSERT INTO `core_translate` VALUES ('316', 'File \'%value%\' exists');
INSERT INTO `core_translate` VALUES ('317', 'File \'%value%\' does not match the given sha1 hashes');
INSERT INTO `core_translate` VALUES ('318', 'A sha1 hash could not be evaluated for the given file');
INSERT INTO `core_translate` VALUES ('319', 'Maximum allowed size for file \'%value%\' is \'%max%\' but \'%size%\' detected');
INSERT INTO `core_translate` VALUES ('320', 'Minimum expected size for file \'%value%\' is \'%min%\' but \'%size%\' detected');
INSERT INTO `core_translate` VALUES ('321', 'File \'%value%\' exceeds the defined ini size');
INSERT INTO `core_translate` VALUES ('322', 'File \'%value%\' exceeds the defined form size');
INSERT INTO `core_translate` VALUES ('323', 'File \'%value%\' was only partially uploaded');
INSERT INTO `core_translate` VALUES ('324', 'File \'%value%\' was not uploaded');
INSERT INTO `core_translate` VALUES ('325', 'No temporary directory was found for file \'%value%\'');
INSERT INTO `core_translate` VALUES ('326', 'File \'%value%\' can\'t be written');
INSERT INTO `core_translate` VALUES ('327', 'A PHP extension returned an error while uploading the file \'%value%\'');
INSERT INTO `core_translate` VALUES ('328', 'File \'%value%\' was illegally uploaded. This could be a possible attack');
INSERT INTO `core_translate` VALUES ('329', 'File \'%value%\' was not found');
INSERT INTO `core_translate` VALUES ('330', 'Unknown error while uploading file \'%value%\'');
INSERT INTO `core_translate` VALUES ('331', 'File exceeds the defined ini size');
INSERT INTO `core_translate` VALUES ('332', 'File exceeds the defined form size');
INSERT INTO `core_translate` VALUES ('333', 'File was only partially uploaded');
INSERT INTO `core_translate` VALUES ('334', 'File was not uploaded');
INSERT INTO `core_translate` VALUES ('335', 'No temporary directory was found for file');
INSERT INTO `core_translate` VALUES ('336', 'File can\'t be written');
INSERT INTO `core_translate` VALUES ('337', 'A PHP extension returned an error while uploading the file');
INSERT INTO `core_translate` VALUES ('338', 'File was illegally uploaded. This could be a possible attack');
INSERT INTO `core_translate` VALUES ('339', 'File was not found');
INSERT INTO `core_translate` VALUES ('340', 'Unknown error while uploading file');
INSERT INTO `core_translate` VALUES ('341', 'Too much words, maximum \'%max%\' are allowed but \'%count%\' were counted');
INSERT INTO `core_translate` VALUES ('342', 'Too few words, minimum \'%min%\' are expected but \'%count%\' were counted');
INSERT INTO `core_translate` VALUES ('343', 'The input is not greater than \'%min%\'');
INSERT INTO `core_translate` VALUES ('344', 'The input is not greater or equal than \'%min%\'');
INSERT INTO `core_translate` VALUES ('345', 'The input contains non-hexadecimal characters');
INSERT INTO `core_translate` VALUES ('346', 'The input appears to be a DNS hostname but the given punycode notation cannot be decoded');
INSERT INTO `core_translate` VALUES ('347', 'The input appears to be a DNS hostname but contains a dash in an invalid position');
INSERT INTO `core_translate` VALUES ('348', 'The input does not match the expected structure for a DNS hostname');
INSERT INTO `core_translate` VALUES ('349', 'The input appears to be a DNS hostname but cannot match against hostname schema for TLD \'%tld%\'');
INSERT INTO `core_translate` VALUES ('350', 'The input does not appear to be a valid local network name');
INSERT INTO `core_translate` VALUES ('351', 'The input does not appear to be a valid URI hostname');
INSERT INTO `core_translate` VALUES ('352', 'The input appears to be an IP address, but IP addresses are not allowed');
INSERT INTO `core_translate` VALUES ('353', 'The input appears to be a local network name but local network names are not allowed');
INSERT INTO `core_translate` VALUES ('354', 'The input appears to be a DNS hostname but cannot extract TLD part');
INSERT INTO `core_translate` VALUES ('355', 'The input appears to be a DNS hostname but cannot match TLD against known list');
INSERT INTO `core_translate` VALUES ('356', 'Unknown country within the IBAN');
INSERT INTO `core_translate` VALUES ('357', 'Countries outside the Single Euro Payments Area (SEPA) are not supported');
INSERT INTO `core_translate` VALUES ('358', 'The input has a false IBAN format');
INSERT INTO `core_translate` VALUES ('359', 'The input has failed the IBAN check');
INSERT INTO `core_translate` VALUES ('360', 'The two given tokens do not match');
INSERT INTO `core_translate` VALUES ('361', 'No token was provided to match against');
INSERT INTO `core_translate` VALUES ('362', 'The input was not found in the haystack');
INSERT INTO `core_translate` VALUES ('363', 'The input does not appear to be a valid IP address');
INSERT INTO `core_translate` VALUES ('364', 'The input is not a valid ISBN number');
INSERT INTO `core_translate` VALUES ('365', 'The input is not less than \'%max%\'');
INSERT INTO `core_translate` VALUES ('366', 'The input is not less or equal than \'%max%\'');
INSERT INTO `core_translate` VALUES ('367', 'Value is required and can\'t be empty');
INSERT INTO `core_translate` VALUES ('368', 'Invalid type given. String, integer, float, boolean or array expected');
INSERT INTO `core_translate` VALUES ('369', 'The input does not match against pattern \'%pattern%\'');
INSERT INTO `core_translate` VALUES ('370', 'There was an internal error while using the pattern \'%pattern%\'');
INSERT INTO `core_translate` VALUES ('371', 'The input is not a valid sitemap changefreq');
INSERT INTO `core_translate` VALUES ('372', 'The input is not a valid sitemap lastmod');
INSERT INTO `core_translate` VALUES ('373', 'The input is not a valid sitemap location');
INSERT INTO `core_translate` VALUES ('374', 'The input is not a valid sitemap priority');
INSERT INTO `core_translate` VALUES ('375', 'Invalid type given. Numeric string, integer or float expected');
INSERT INTO `core_translate` VALUES ('376', 'Invalid value given. Scalar expected');
INSERT INTO `core_translate` VALUES ('377', 'The input is less than %min% characters long');
INSERT INTO `core_translate` VALUES ('378', 'The input is more than %max% characters long');
INSERT INTO `core_translate` VALUES ('379', 'The input does not appear to be a valid Uri');
INSERT INTO `core_translate` VALUES ('380', 'Debug');
INSERT INTO `core_translate` VALUES ('381', 'Cache');
INSERT INTO `core_translate` VALUES ('382', 'Web');
INSERT INTO `core_translate` VALUES ('383', 'Force frontend SSL');
INSERT INTO `core_translate` VALUES ('384', 'Driver');
INSERT INTO `core_translate` VALUES ('385', 'Hostname');
INSERT INTO `core_translate` VALUES ('386', 'Db Name');
INSERT INTO `core_translate` VALUES ('387', 'Configure your website');
INSERT INTO `core_translate` VALUES ('388', 'Roles');
INSERT INTO `core_translate` VALUES ('389', 'Username');
INSERT INTO `core_translate` VALUES ('390', 'Select template');
INSERT INTO `core_translate` VALUES ('391', 'Author');
INSERT INTO `core_translate` VALUES ('392', 'Website url');
INSERT INTO `core_translate` VALUES ('393', 'website');
INSERT INTO `core_translate` VALUES ('394', 'Required modules');
INSERT INTO `core_translate` VALUES ('395', 'Session');
INSERT INTO `core_translate` VALUES ('396', 'Installation');
INSERT INTO `core_translate` VALUES ('397', 'Please select language');
INSERT INTO `core_translate` VALUES ('398', 'No');
INSERT INTO `core_translate` VALUES ('399', 'document');
INSERT INTO `core_translate` VALUES ('400', 'Module');
INSERT INTO `core_translate` VALUES ('401', 'script');
INSERT INTO `core_translate` VALUES ('402', 'Home');
INSERT INTO `core_translate` VALUES ('403', 'Contact');
INSERT INTO `core_translate` VALUES ('404', 'asdad');

-- ----------------------------
-- Table structure for core_translate_locale
-- ----------------------------
DROP TABLE IF EXISTS `core_translate_locale`;
CREATE TABLE `core_translate_locale` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `destination` text COLLATE utf8_unicode_ci NOT NULL,
  `locale` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `core_translate_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_core_translate_locale_core_translate` (`core_translate_id`),
  CONSTRAINT `fk_core_translate_locale_core_translate` FOREIGN KEY (`core_translate_id`) REFERENCES `core_translate` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=760 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of core_translate_locale
-- ----------------------------
INSERT INTO `core_translate_locale` VALUES ('1', 'Ajouter', 'fr_FR', '1');
INSERT INTO `core_translate_locale` VALUES ('2', '-- Utilisation de la configuration du parent', 'fr_FR', '2');
INSERT INTO `core_translate_locale` VALUES ('3', 'Ajouter la propriÃ©tÃ©', 'fr_FR', '3');
INSERT INTO `core_translate_locale` VALUES ('4', 'Ajouter un onglet', 'fr_FR', '4');
INSERT INTO `core_translate_locale` VALUES ('5', 'Ajouter des traductions', 'fr_FR', '5');
INSERT INTO `core_translate_locale` VALUES ('6', 'Ajouter une vue', 'fr_FR', '6');
INSERT INTO `core_translate_locale` VALUES ('7', 'Panneau d\'administration', 'fr_FR', '7');
INSERT INTO `core_translate_locale` VALUES ('8', 'Administrateur', 'fr_FR', '8');
INSERT INTO `core_translate_locale` VALUES ('9', 'Enfants autorisÃ©s', 'fr_FR', '9');
INSERT INTO `core_translate_locale` VALUES ('10', 'Contenu', 'fr_FR', '10');
INSERT INTO `core_translate_locale` VALUES ('11', 'Domaine du cookie', 'fr_FR', '11');
INSERT INTO `core_translate_locale` VALUES ('12', 'Chemin du cookie', 'fr_FR', '12');
INSERT INTO `core_translate_locale` VALUES ('13', 'Copier', 'fr_FR', '13');
INSERT INTO `core_translate_locale` VALUES ('14', 'CrÃ©er', 'fr_FR', '14');
INSERT INTO `core_translate_locale` VALUES ('15', 'CrÃ©er un document', 'fr_FR', '15');
INSERT INTO `core_translate_locale` VALUES ('16', 'CrÃ©ez,  Ã©ditez et supprimez des utilisateurs.', 'fr_FR', '16');
INSERT INTO `core_translate_locale` VALUES ('17', 'CrÃ©er, Ã©diter et supprimer des vues.', 'fr_FR', '17');
INSERT INTO `core_translate_locale` VALUES ('18', 'CrÃ©er votre propre site web', 'fr_FR', '18');
INSERT INTO `core_translate_locale` VALUES ('19', 'Couper', 'fr_FR', '19');
INSERT INTO `core_translate_locale` VALUES ('20', 'Tableau de bord', 'fr_FR', '20');
INSERT INTO `core_translate_locale` VALUES ('21', 'Les donnÃ©es peuvent Ãªtre stockÃ©s dedans. CrÃ©ez votre propre type de donnÃ©es, Ã©ditez la configuration et insÃ©rez le dans un type de document.', 'fr_FR', '21');
INSERT INTO `core_translate_locale` VALUES ('22', 'type de donnÃ©es', 'fr_FR', '22');
INSERT INTO `core_translate_locale` VALUES ('23', 'Types de donnÃ©es', 'fr_FR', '23');
INSERT INTO `core_translate_locale` VALUES ('24', 'DÃ©bogage activÃ©', 'fr_FR', '24');
INSERT INTO `core_translate_locale` VALUES ('25', 'Cache activÃ©', 'fr_FR', '25');
INSERT INTO `core_translate_locale` VALUES ('26', 'Gestionnaire de cache', 'fr_FR', '26');
INSERT INTO `core_translate_locale` VALUES ('27', 'DurÃ©e de vie du cache', 'fr_FR', '27');
INSERT INTO `core_translate_locale` VALUES ('28', 'Vue par dÃ©faut', 'fr_FR', '28');
INSERT INTO `core_translate_locale` VALUES ('29', 'DÃ©finissez les donnÃ©es Ã  utiliser pour le site tels que la localisation, les sessions, le nom ...', 'fr_FR', '29');
INSERT INTO `core_translate_locale` VALUES ('30', 'Supprimer', 'fr_FR', '30');
INSERT INTO `core_translate_locale` VALUES ('31', 'DÃ©veloppement', 'fr_FR', '31');
INSERT INTO `core_translate_locale` VALUES ('32', 'DÃ©veloppeur', 'fr_FR', '32');
INSERT INTO `core_translate_locale` VALUES ('33', 'DÃ©connexion', 'fr_FR', '33');
INSERT INTO `core_translate_locale` VALUES ('34', 'Types de documents', 'fr_FR', '34');
INSERT INTO `core_translate_locale` VALUES ('35', 'Modifier', 'fr_FR', '35');
INSERT INTO `core_translate_locale` VALUES ('36', 'Ã‰diter les traductions du \"frontend\" et du \"backend\".', 'fr_FR', '36');
INSERT INTO `core_translate_locale` VALUES ('37', 'elFinder est un gestionnaire de fichiers open-source pour le web. Et avec vous pourrez gÃ©rer vos fichiers, dossiers et autres donnÃ©es pour le site.', 'fr_FR', '37');
INSERT INTO `core_translate_locale` VALUES ('38', 'Liens rapides', 'fr_FR', '38');
INSERT INTO `core_translate_locale` VALUES ('39', 'Gestionnaire de fichiers', 'fr_FR', '39');
INSERT INTO `core_translate_locale` VALUES ('40', 'Fichiers', 'fr_FR', '40');
INSERT INTO `core_translate_locale` VALUES ('41', 'PrÃ©nom', 'fr_FR', '41');
INSERT INTO `core_translate_locale` VALUES ('42', 'Mot de passe oubliÃ© ?', 'fr_FR', '42');
INSERT INTO `core_translate_locale` VALUES ('43', 'E-mail de', 'fr_FR', '43');
INSERT INTO `core_translate_locale` VALUES ('44', 'De nom', 'fr_FR', '44');
INSERT INTO `core_translate_locale` VALUES ('45', 'GÃ©nÃ©ral', 'fr_FR', '45');
INSERT INTO `core_translate_locale` VALUES ('46', 'Configuration gÃ©nÃ©rale', 'fr_FR', '46');
INSERT INTO `core_translate_locale` VALUES ('47', 'Il a beaucoup identiques au gestionnaiers de fenÃªtres. Faites attention lors de la suppression, ce n\'est pas rÃ©verssible.', 'fr_FR', '47');
INSERT INTO `core_translate_locale` VALUES ('48', 'Identifiant', 'fr_FR', '48');
INSERT INTO `core_translate_locale` VALUES ('49', 'Importer l\'onglet', 'fr_FR', '49');
INSERT INTO `core_translate_locale` VALUES ('50', 'Ã€ insÃ©rer dans les types de documents. Si vous voulez rÃ©cupÃ©rer et utiliser les propriÃ©tÃ©s Ã©crivez : $this->propertyIdentifier', 'fr_FR', '50');
INSERT INTO `core_translate_locale` VALUES ('51', 'Est activÃ©', 'fr_FR', '51');
INSERT INTO `core_translate_locale` VALUES ('52', 'Est dÃ©sactivÃ©', 'fr_FR', '52');
INSERT INTO `core_translate_locale` VALUES ('53', 'Nom', 'fr_FR', '53');
INSERT INTO `core_translate_locale` VALUES ('54', 'Gabarits', 'fr_FR', '54');
INSERT INTO `core_translate_locale` VALUES ('55', 'Limitez les accÃ¨s utilisateurs grÃ¢ce Ã  des rÃ´les et des permissions', 'fr_FR', '55');
INSERT INTO `core_translate_locale` VALUES ('56', 'Liste', 'fr_FR', '56');
INSERT INTO `core_translate_locale` VALUES ('57', 'Connexion', 'fr_FR', '57');
INSERT INTO `core_translate_locale` VALUES ('58', 'Que le M.V.C soit avec vous', 'fr_FR', '58');
INSERT INTO `core_translate_locale` VALUES ('59', 'Gestion du contenu', 'fr_FR', '59');
INSERT INTO `core_translate_locale` VALUES ('60', 'Gestion des documents', 'fr_FR', '60');
INSERT INTO `core_translate_locale` VALUES ('61', 'Gestion des modules', 'fr_FR', '61');
INSERT INTO `core_translate_locale` VALUES ('62', 'Configuration', 'fr_FR', '62');
INSERT INTO `core_translate_locale` VALUES ('63', 'Types de donnÃ©es', 'fr_FR', '63');
INSERT INTO `core_translate_locale` VALUES ('64', 'Gestion des documents', 'fr_FR', '64');
INSERT INTO `core_translate_locale` VALUES ('65', 'Types de documents', 'fr_FR', '65');
INSERT INTO `core_translate_locale` VALUES ('66', 'Gestions des gabarits', 'fr_FR', '66');
INSERT INTO `core_translate_locale` VALUES ('67', 'Gestion des ressources', 'fr_FR', '67');
INSERT INTO `core_translate_locale` VALUES ('68', 'Gestion des rÃ´les', 'fr_FR', '68');
INSERT INTO `core_translate_locale` VALUES ('69', 'Gestion des scripts', 'fr_FR', '69');
INSERT INTO `core_translate_locale` VALUES ('70', 'Gestion des traductions', 'fr_FR', '70');
INSERT INTO `core_translate_locale` VALUES ('71', 'Utilisateurs', 'fr_FR', '71');
INSERT INTO `core_translate_locale` VALUES ('72', 'Gestion des vues', 'fr_FR', '72');
INSERT INTO `core_translate_locale` VALUES ('73', 'ModÃ¨le', 'fr_FR', '73');
INSERT INTO `core_translate_locale` VALUES ('74', 'Nom', 'fr_FR', '74');
INSERT INTO `core_translate_locale` VALUES ('75', 'Nouveau', 'fr_FR', '75');
INSERT INTO `core_translate_locale` VALUES ('76', 'Suivant', 'fr_FR', '76');
INSERT INTO `core_translate_locale` VALUES ('77', 'Document hors ligne', 'fr_FR', '77');
INSERT INTO `core_translate_locale` VALUES ('78', 'Documents en ligne', 'fr_FR', '78');
INSERT INTO `core_translate_locale` VALUES ('79', 'Mot de passe', 'fr_FR', '79');
INSERT INTO `core_translate_locale` VALUES ('80', 'Confirmation du mot de passe', 'fr_FR', '80');
INSERT INTO `core_translate_locale` VALUES ('81', 'Coller', 'fr_FR', '81');
INSERT INTO `core_translate_locale` VALUES ('82', 'PropriÃ©tÃ©s', 'fr_FR', '82');
INSERT INTO `core_translate_locale` VALUES ('83', 'Quitter', 'fr_FR', '83');
INSERT INTO `core_translate_locale` VALUES ('84', 'Requis', 'fr_FR', '84');
INSERT INTO `core_translate_locale` VALUES ('85', 'rÃ´le', 'fr_FR', '85');
INSERT INTO `core_translate_locale` VALUES ('86', 'Sauvegarder', 'fr_FR', '86');
INSERT INTO `core_translate_locale` VALUES ('87', 'Savegarder et publier', 'fr_FR', '87');
INSERT INTO `core_translate_locale` VALUES ('88', 'Serveur', 'fr_FR', '88');
INSERT INTO `core_translate_locale` VALUES ('89', 'Locale serveur', 'fr_FR', '89');
INSERT INTO `core_translate_locale` VALUES ('90', 'Gestionnaire de session', 'fr_FR', '90');
INSERT INTO `core_translate_locale` VALUES ('91', 'DurÃ©e de vie de la session', 'fr_FR', '91');
INSERT INTO `core_translate_locale` VALUES ('92', 'Nom du site', 'fr_FR', '92');
INSERT INTO `core_translate_locale` VALUES ('93', 'RÃ©dacteur', 'fr_FR', '93');
INSERT INTO `core_translate_locale` VALUES ('94', 'systÃ¨me', 'fr_FR', '94');
INSERT INTO `core_translate_locale` VALUES ('95', 'Configuration systÃ¨me', 'fr_FR', '95');
INSERT INTO `core_translate_locale` VALUES ('96', 'Onglets', 'fr_FR', '96');
INSERT INTO `core_translate_locale` VALUES ('97', 'Il y a beaucoup d\'aides de vues que vous pouvez utiliser. Ceux de Zend Framework et ceux de GotCms. RÃ©fÃ©rez vous Ã  la documentation si vous voulez plus d\'informations.', 'fr_FR', '97');
INSERT INTO `core_translate_locale` VALUES ('98', 'Ces Ã©lÃ©ments vont Ãªtre dÃ©finitevement supprimÃ©s et ne pourront pas Ãªtre restaurÃ©s. ÃŠtes-vous sÃ»r ?', 'fr_FR', '98');
INSERT INTO `core_translate_locale` VALUES ('99', 'Ces Ã©lÃ©ments vont Ãªtre dÃ©finitevement mis Ã  jours et ne pourront pas Ãªtre restaurÃ©s. ÃŠtes-vous sÃ»r ?', 'fr_FR', '99');
INSERT INTO `core_translate_locale` VALUES ('100', 'Il s\'agit d\'un modÃ¨le de document. TriÃ© par onglets, insÃ©rer des types de donnÃ©es et spÃ©cifiez les vues disponibles.', 'fr_FR', '100');
INSERT INTO `core_translate_locale` VALUES ('101', 'Documents au total', 'fr_FR', '101');
INSERT INTO `core_translate_locale` VALUES ('102', 'Traductions', 'fr_FR', '102');
INSERT INTO `core_translate_locale` VALUES ('103', 'Liste utilisateurs', 'fr_FR', '103');
INSERT INTO `core_translate_locale` VALUES ('104', 'Utilisateurs', 'fr_FR', '104');
INSERT INTO `core_translate_locale` VALUES ('105', 'Vues', 'fr_FR', '105');
INSERT INTO `core_translate_locale` VALUES ('106', 'Stats du site web', 'fr_FR', '106');
INSERT INTO `core_translate_locale` VALUES ('107', 'Bienvenue %s', 'fr_FR', '107');
INSERT INTO `core_translate_locale` VALUES ('108', 'Fonctionnent comme les vues, vous pouvez rÃ©cupÃ©rer les propriÃ©tÃ©s, use helpers et si vous voulez intÃ©grer l\'enfant (vue) Ã©crivez : $this->content.', 'fr_FR', '108');
INSERT INTO `core_translate_locale` VALUES ('109', 'Fonctionnent comme les contrÃ´leurs Zend Framework, vous pouvez rÃ©cupÃ©rer la requÃªte (Request), la rÃ©ponse (Response) et utiliser les plugins de contrÃ´leurs.', 'fr_FR', '109');
INSERT INTO `core_translate_locale` VALUES ('110', 'Vous pouvez crÃ©er, Ã©diter, copier, couper et coller des documents en faisant un clic droit sur Website ou les documents enfants.', 'fr_FR', '110');
INSERT INTO `core_translate_locale` VALUES ('111', 'Vous utilisez GotCms %s', 'fr_FR', '111');
INSERT INTO `core_translate_locale` VALUES ('112', 'Ã‰tapes :', 'fr_FR', '112');
INSERT INTO `core_translate_locale` VALUES ('113', 'Langage', 'fr_FR', '113');
INSERT INTO `core_translate_locale` VALUES ('114', 'Licence', 'fr_FR', '114');
INSERT INTO `core_translate_locale` VALUES ('115', 'PrÃ©configuration', 'fr_FR', '115');
INSERT INTO `core_translate_locale` VALUES ('116', 'Base de donnÃ©es', 'fr_FR', '116');
INSERT INTO `core_translate_locale` VALUES ('117', 'Vous devez accepter la licence pour continuer l\'installation', 'fr_FR', '117');
INSERT INTO `core_translate_locale` VALUES ('118', 'Continuer', 'fr_FR', '118');
INSERT INTO `core_translate_locale` VALUES ('119', 'VÃ©rification de la configuration pour GotCms %s', 'fr_FR', '119');
INSERT INTO `core_translate_locale` VALUES ('120', 'Merci de vÃ©rifier que tous les paramÃ¨tres soit Ã  \"Oui\" avant de continuer l\'installation', 'fr_FR', '120');
INSERT INTO `core_translate_locale` VALUES ('121', 'Oui', 'fr_FR', '121');
INSERT INTO `core_translate_locale` VALUES ('122', 'ActivÃ©', 'fr_FR', '122');
INSERT INTO `core_translate_locale` VALUES ('123', 'DÃ©sactivÃ©', 'fr_FR', '123');
INSERT INTO `core_translate_locale` VALUES ('124', 'RecommandÃ©', 'fr_FR', '124');
INSERT INTO `core_translate_locale` VALUES ('125', '%s est accessible en Ã©criture', 'fr_FR', '125');
INSERT INTO `core_translate_locale` VALUES ('126', 'ParamÃ¨tres recommandÃ©s', 'fr_FR', '126');
INSERT INTO `core_translate_locale` VALUES ('127', 'Ces paramÃ¨tres sont recommandÃ©s pour PHP afin d\'assurer une compatibilitÃ© totale.', 'fr_FR', '127');
INSERT INTO `core_translate_locale` VALUES ('128', 'Actuel', 'fr_FR', '128');
INSERT INTO `core_translate_locale` VALUES ('129', 'Tous les paramÃ¨tres doivent Ãªtre dÃ©finis Ã  \"Oui\"', 'fr_FR', '129');
INSERT INTO `core_translate_locale` VALUES ('130', 'Statistiques', 'fr_FR', '130');
INSERT INTO `core_translate_locale` VALUES ('131', 'Total de visiteurs', 'fr_FR', '131');
INSERT INTO `core_translate_locale` VALUES ('132', 'Total de page vues', 'fr_FR', '132');
INSERT INTO `core_translate_locale` VALUES ('133', 'Mise Ã  jour', 'fr_FR', '133');
INSERT INTO `core_translate_locale` VALUES ('134', 'tous', 'fr_FR', '134');
INSERT INTO `core_translate_locale` VALUES ('135', 'utilisateur', 'fr_FR', '135');
INSERT INTO `core_translate_locale` VALUES ('136', 'mÃ©dia', 'fr_FR', '136');
INSERT INTO `core_translate_locale` VALUES ('137', 'traduction', 'fr_FR', '137');
INSERT INTO `core_translate_locale` VALUES ('138', 'Vue', 'fr_FR', '138');
INSERT INTO `core_translate_locale` VALUES ('139', 'Gabarit', 'fr_FR', '139');
INSERT INTO `core_translate_locale` VALUES ('140', 'Gabarit de la page 404', 'fr_FR', '140');
INSERT INTO `core_translate_locale` VALUES ('141', 'Gabarit de la page d\'exception', 'fr_FR', '141');
INSERT INTO `core_translate_locale` VALUES ('142', 'type de document', 'fr_FR', '142');
INSERT INTO `core_translate_locale` VALUES ('143', 'Vous avez dÃ©jÃ  la derniÃ¨re version', 'fr_FR', '143');
INSERT INTO `core_translate_locale` VALUES ('144', 'Aujourd\'hui', 'fr_FR', '144');
INSERT INTO `core_translate_locale` VALUES ('145', 'Ce mois-ci', 'fr_FR', '145');
INSERT INTO `core_translate_locale` VALUES ('146', 'Cet annÃ©e', 'fr_FR', '146');
INSERT INTO `core_translate_locale` VALUES ('147', 'Tout le temps', 'fr_FR', '147');
INSERT INTO `core_translate_locale` VALUES ('148', 'Pages vues', 'fr_FR', '148');
INSERT INTO `core_translate_locale` VALUES ('149', 'Visiteurs', 'fr_FR', '149');
INSERT INTO `core_translate_locale` VALUES ('150', 'Les liens les plus visitÃ©s', 'fr_FR', '150');
INSERT INTO `core_translate_locale` VALUES ('151', 'RÃ©fÃ©rants', 'fr_FR', '151');
INSERT INTO `core_translate_locale` VALUES ('152', 'Ces modules peuvent avoir des problÃ¨mes :', 'fr_FR', '152');
INSERT INTO `core_translate_locale` VALUES ('153', 'Ces types de donnÃ©es peuvent avoir des problÃ¨mes :', 'fr_FR', '153');
INSERT INTO `core_translate_locale` VALUES ('154', 'Version %s a Ã©tÃ© publiÃ©e, merci de mettre Ã  jour pour des raisons de sÃ©curitÃ©.', 'fr_FR', '154');
INSERT INTO `core_translate_locale` VALUES ('155', 'Voulez-vous vraiment mettre Ã  jour GotCms ?', 'fr_FR', '155');
INSERT INTO `core_translate_locale` VALUES ('156', 'Vous pouvez suivre ce projet sur github :', 'fr_FR', '156');
INSERT INTO `core_translate_locale` VALUES ('157', 'Panneau d\'administration', 'fr_FR', '157');
INSERT INTO `core_translate_locale` VALUES ('158', 'Modules', 'fr_FR', '158');
INSERT INTO `core_translate_locale` VALUES ('159', 'Configuration', 'fr_FR', '159');
INSERT INTO `core_translate_locale` VALUES ('160', 'Source', 'fr_FR', '160');
INSERT INTO `core_translate_locale` VALUES ('161', 'Destination', 'fr_FR', '161');
INSERT INTO `core_translate_locale` VALUES ('162', 'Scripts', 'fr_FR', '162');
INSERT INTO `core_translate_locale` VALUES ('163', 'Infos', 'fr_FR', '163');
INSERT INTO `core_translate_locale` VALUES ('164', 'Locale', 'fr_FR', '164');
INSERT INTO `core_translate_locale` VALUES ('165', 'Description', 'fr_FR', '165');
INSERT INTO `core_translate_locale` VALUES ('166', 'IcÃ´ne', 'fr_FR', '166');
INSERT INTO `core_translate_locale` VALUES ('167', 'Ã€ propos', 'fr_FR', '167');
INSERT INTO `core_translate_locale` VALUES ('168', 'Statistiques', 'fr_FR', '168');
INSERT INTO `core_translate_locale` VALUES ('169', 'DÃ©sinstaller', 'fr_FR', '169');
INSERT INTO `core_translate_locale` VALUES ('170', '-- SÃ©lectionner --', 'fr_FR', '170');
INSERT INTO `core_translate_locale` VALUES ('171', 'SÃ©lectionner un document', 'fr_FR', '171');
INSERT INTO `core_translate_locale` VALUES ('172', 'Afficher / Cacher le formulaire', 'fr_FR', '172');
INSERT INTO `core_translate_locale` VALUES ('173', 'Onglets', 'fr_FR', '173');
INSERT INTO `core_translate_locale` VALUES ('174', 'TÃ©lÃ©charger tous les fichiers', 'fr_FR', '174');
INSERT INTO `core_translate_locale` VALUES ('175', 'Envoyer un fichier', 'fr_FR', '175');
INSERT INTO `core_translate_locale` VALUES ('176', 'Envoyer des fichiers', 'fr_FR', '176');
INSERT INTO `core_translate_locale` VALUES ('177', 'Mettre Ã  jour le contenu', 'fr_FR', '177');
INSERT INTO `core_translate_locale` VALUES ('178', 'Fichier au format : identifiant.phtml', 'fr_FR', '178');
INSERT INTO `core_translate_locale` VALUES ('179', 'Fichiers avec la locale comme nom et l\'extension csv ou php : fr_FR.php, en_GB.php, etc...', 'fr_FR', '179');
INSERT INTO `core_translate_locale` VALUES ('180', 'Envoyer', 'fr_FR', '180');
INSERT INTO `core_translate_locale` VALUES ('181', 'TÃ©lÃ©charger le fichier', 'fr_FR', '181');
INSERT INTO `core_translate_locale` VALUES ('182', '%d commentaire(s) actif(s)', 'fr_FR', '182');
INSERT INTO `core_translate_locale` VALUES ('183', '%d commentaire(s) inactif(s)', 'fr_FR', '183');
INSERT INTO `core_translate_locale` VALUES ('184', 'GÃ©nÃ©rer', 'fr_FR', '184');
INSERT INTO `core_translate_locale` VALUES ('185', 'DonnÃ©es seulement', 'fr_FR', '185');
INSERT INTO `core_translate_locale` VALUES ('186', 'Structure seulement', 'fr_FR', '186');
INSERT INTO `core_translate_locale` VALUES ('187', 'Structure et donnÃ©es', 'fr_FR', '187');
INSERT INTO `core_translate_locale` VALUES ('188', 'TÃ©lÃ©charger', 'fr_FR', '188');
INSERT INTO `core_translate_locale` VALUES ('189', 'Attention', 'fr_FR', '189');
INSERT INTO `core_translate_locale` VALUES ('190', 'DÃ©connexion', 'fr_FR', '190');
INSERT INTO `core_translate_locale` VALUES ('191', 'Cliquez pour vous dÃ©connecter', 'fr_FR', '191');
INSERT INTO `core_translate_locale` VALUES ('192', 'Le script a Ã©tÃ© sauvegardÃ©', 'fr_FR', '192');
INSERT INTO `core_translate_locale` VALUES ('193', 'Le gabarit a Ã©tÃ© sauvegardÃ©', 'fr_FR', '193');
INSERT INTO `core_translate_locale` VALUES ('194', 'La vue a Ã©tÃ© sauvegardÃ©e', 'fr_FR', '194');
INSERT INTO `core_translate_locale` VALUES ('195', 'L\'utilisateur a Ã©tÃ© sauvegardÃ©', 'fr_FR', '195');
INSERT INTO `core_translate_locale` VALUES ('196', 'Le type de donnÃ©e a Ã©tÃ© sauvegardÃ©', 'fr_FR', '196');
INSERT INTO `core_translate_locale` VALUES ('197', 'Le type de document a Ã©tÃ© sauvegardÃ©', 'fr_FR', '197');
INSERT INTO `core_translate_locale` VALUES ('198', 'Le document a Ã©tÃ© sauvegardÃ©', 'fr_FR', '198');
INSERT INTO `core_translate_locale` VALUES ('199', 'Configuration sauvegardÃ©e', 'fr_FR', '199');
INSERT INTO `core_translate_locale` VALUES ('200', 'L\'utilisateur ne peut Ãªtre sauvegardÃ©', 'fr_FR', '200');
INSERT INTO `core_translate_locale` VALUES ('201', 'L\'utilisateur n\'existe pas', 'fr_FR', '201');
INSERT INTO `core_translate_locale` VALUES ('202', 'L\'utilisatuer a Ã©tÃ© supprimÃ©', 'fr_FR', '202');
INSERT INTO `core_translate_locale` VALUES ('203', 'Le type de donnÃ©es a Ã©tÃ© supprimÃ©', 'fr_FR', '203');
INSERT INTO `core_translate_locale` VALUES ('204', 'Le type de document a Ã©tÃ© supprimÃ©', 'fr_FR', '204');
INSERT INTO `core_translate_locale` VALUES ('205', 'L\'onglet a Ã©tÃ© supprimÃ©', 'fr_FR', '205');
INSERT INTO `core_translate_locale` VALUES ('206', 'La propriÃ©tÃ© a Ã©tÃ© supprimÃ©e', 'fr_FR', '206');
INSERT INTO `core_translate_locale` VALUES ('207', 'Le gabarit a Ã©tÃ© supprimÃ©', 'fr_FR', '207');
INSERT INTO `core_translate_locale` VALUES ('208', 'Le script a Ã©tÃ© supprimÃ©', 'fr_FR', '208');
INSERT INTO `core_translate_locale` VALUES ('209', 'La vue a Ã©tÃ© supprimÃ©e', 'fr_FR', '209');
INSERT INTO `core_translate_locale` VALUES ('210', 'Le rÃ´le a Ã©tÃ© supprimÃ©', 'fr_FR', '210');
INSERT INTO `core_translate_locale` VALUES ('211', 'Le rÃ´le n\\existe pas', 'fr_FR', '211');
INSERT INTO `core_translate_locale` VALUES ('212', 'Le type de donnÃ©es n\'existe pas', 'fr_FR', '212');
INSERT INTO `core_translate_locale` VALUES ('213', 'Le type de document n\'existe pas', 'fr_FR', '213');
INSERT INTO `core_translate_locale` VALUES ('214', 'La vue n\'existe pas', 'fr_FR', '214');
INSERT INTO `core_translate_locale` VALUES ('215', 'Le gabarit n\'existe pas', 'fr_FR', '215');
INSERT INTO `core_translate_locale` VALUES ('216', 'Le script n\'existe pas', 'fr_FR', '216');
INSERT INTO `core_translate_locale` VALUES ('217', 'Un projet Git a Ã©tÃ© trouvÃ©, attention Ã  bien le cloner avec l\'utilisateur apache.', 'fr_FR', '217');
INSERT INTO `core_translate_locale` VALUES ('218', 'Configuration de la base de donnÃ©es', 'fr_FR', '218');
INSERT INTO `core_translate_locale` VALUES ('219', 'Identifiant de connexion', 'fr_FR', '219');
INSERT INTO `core_translate_locale` VALUES ('220', 'Mot de passe administrateur', 'fr_FR', '220');
INSERT INTO `core_translate_locale` VALUES ('221', 'Confirmation du mot de passe', 'fr_FR', '221');
INSERT INTO `core_translate_locale` VALUES ('222', 'Design par dÃ©faut', 'fr_FR', '222');
INSERT INTO `core_translate_locale` VALUES ('223', 'La requÃªte a Ã©tÃ© stoppÃ©e, merci de rafraÃ®chir la page', 'fr_FR', '223');
INSERT INTO `core_translate_locale` VALUES ('224', 'Installation terminÃ©e. Merci de rafraÃ®chir la page ou d\'aller sur la page /admin afin de gÃ©rer votre site internet.', 'fr_FR', '224');
INSERT INTO `core_translate_locale` VALUES ('225', 'L\'installation est en train de se terminer', 'fr_FR', '225');
INSERT INTO `core_translate_locale` VALUES ('226', 'Installation', 'fr_FR', '226');
INSERT INTO `core_translate_locale` VALUES ('227', 'RafraÃ®chir', 'fr_FR', '227');
INSERT INTO `core_translate_locale` VALUES ('228', 'SÃ©lectionner une option', 'fr_FR', '228');
INSERT INTO `core_translate_locale` VALUES ('229', 'CrÃ©ation de la base de donnÃ©es', 'fr_FR', '229');
INSERT INTO `core_translate_locale` VALUES ('230', 'Insertion des donnÃ©es', 'fr_FR', '230');
INSERT INTO `core_translate_locale` VALUES ('231', 'Insertion des traductions', 'fr_FR', '231');
INSERT INTO `core_translate_locale` VALUES ('232', 'CrÃ©ation des utilisateurs et des rÃ´les', 'fr_FR', '232');
INSERT INTO `core_translate_locale` VALUES ('233', 'Installation du template', 'fr_FR', '233');
INSERT INTO `core_translate_locale` VALUES ('234', 'CrÃ©ation du fichier de configuration', 'fr_FR', '234');
INSERT INTO `core_translate_locale` VALUES ('235', 'Copier le document', 'fr_FR', '235');
INSERT INTO `core_translate_locale` VALUES ('236', 'Tous les champs sont obligatoires', 'fr_FR', '236');
INSERT INTO `core_translate_locale` VALUES ('237', 'Merci de remplir tous les champs', 'fr_FR', '237');
INSERT INTO `core_translate_locale` VALUES ('238', 'Supprimer l\'Ã©lÃ©ment', 'fr_FR', '238');
INSERT INTO `core_translate_locale` VALUES ('239', 'Annuler', 'fr_FR', '239');
INSERT INTO `core_translate_locale` VALUES ('240', 'Confirmer', 'fr_FR', '240');
INSERT INTO `core_translate_locale` VALUES ('241', 'Obligatoire', 'fr_FR', '241');
INSERT INTO `core_translate_locale` VALUES ('242', 'Publier', 'fr_FR', '242');
INSERT INTO `core_translate_locale` VALUES ('243', 'Afficher dans la navigation', 'fr_FR', '243');
INSERT INTO `core_translate_locale` VALUES ('244', 'PrÃ©visualiser', 'fr_FR', '244');
INSERT INTO `core_translate_locale` VALUES ('245', 'Chemin de session', 'fr_FR', '245');
INSERT INTO `core_translate_locale` VALUES ('246', 'Information sur le document', 'fr_FR', '246');
INSERT INTO `core_translate_locale` VALUES ('247', 'Forcer le ssl sur le site', 'fr_FR', '247');
INSERT INTO `core_translate_locale` VALUES ('248', 'Chemin non sÃ©curisÃ© pour l\'admin', 'fr_FR', '248');
INSERT INTO `core_translate_locale` VALUES ('249', 'Chemin non sÃ©curisÃ© le site', 'fr_FR', '249');
INSERT INTO `core_translate_locale` VALUES ('250', 'Chemin sÃ©curisÃ© pour l\'admin', 'fr_FR', '250');
INSERT INTO `core_translate_locale` VALUES ('251', 'Chemin sÃ©cursiÃ© pour le site', 'fr_FR', '251');
INSERT INTO `core_translate_locale` VALUES ('252', 'Chemin sÃ©curisÃ© pour le cdn', 'fr_FR', '252');
INSERT INTO `core_translate_locale` VALUES ('253', 'Chemin sÃ©curisÃ© pour le cdn', 'fr_FR', '253');
INSERT INTO `core_translate_locale` VALUES ('254', 'Peut Ãªtre mis en cache', 'fr_FR', '254');
INSERT INTO `core_translate_locale` VALUES ('255', 'Basculer la navigation', 'fr_FR', '255');
INSERT INTO `core_translate_locale` VALUES ('256', 'Type invalide. ChaÃ®ne, entier ou flottant attendu', 'fr_FR', '256');
INSERT INTO `core_translate_locale` VALUES ('257', 'L\'entrÃ©e contient des caractÃ¨res non alphabÃ©tiques et non numÃ©riques', 'fr_FR', '257');
INSERT INTO `core_translate_locale` VALUES ('258', 'L\'entrÃ©e est une chaÃ®ne vide', 'fr_FR', '258');
INSERT INTO `core_translate_locale` VALUES ('259', 'Type invalide. ChaÃ®ne attendue', 'fr_FR', '259');
INSERT INTO `core_translate_locale` VALUES ('260', 'L\'entrÃ©e contient des caractÃ¨res non alphabÃ©tiques', 'fr_FR', '260');
INSERT INTO `core_translate_locale` VALUES ('261', 'L\'entrÃ©e n\'est pas un nombre flottant', 'fr_FR', '261');
INSERT INTO `core_translate_locale` VALUES ('262', 'Type invalide. ChaÃ®ne ou entier attendu', 'fr_FR', '262');
INSERT INTO `core_translate_locale` VALUES ('263', 'L\'entrÃ©e n\'est pas un entier', 'fr_FR', '263');
INSERT INTO `core_translate_locale` VALUES ('264', 'L\'entrÃ©e ne semble pas Ãªtre un code postal valide', 'fr_FR', '264');
INSERT INTO `core_translate_locale` VALUES ('265', 'Une exception a Ã©tÃ© levÃ©e lors de la validation de l\'entrÃ©e', 'fr_FR', '265');
INSERT INTO `core_translate_locale` VALUES ('266', 'L\'entrÃ©e n\'a pas passÃ© la validation de la somme de contrÃ´le', 'fr_FR', '266');
INSERT INTO `core_translate_locale` VALUES ('267', 'L\'entrÃ©e contient des caractÃ¨res invalides', 'fr_FR', '267');
INSERT INTO `core_translate_locale` VALUES ('268', 'L\'entrÃ©e devrait contenir %length% caractÃ¨res', 'fr_FR', '268');
INSERT INTO `core_translate_locale` VALUES ('269', 'L\'entrÃ©e n\'est pas comprise entre \'%min%\' et \'%max%\', inclusivement', 'fr_FR', '269');
INSERT INTO `core_translate_locale` VALUES ('270', 'L\'entrÃ©e n\'est pas strictement comprise entre \'%min%\' et \'%max%\'', 'fr_FR', '270');
INSERT INTO `core_translate_locale` VALUES ('271', 'L\'entrÃ©e n\'est pas valide', 'fr_FR', '271');
INSERT INTO `core_translate_locale` VALUES ('272', 'Une exception a Ã©tÃ© levÃ©e dans la fonction de rappel', 'fr_FR', '272');
INSERT INTO `core_translate_locale` VALUES ('273', 'L\'entrÃ©e semble contenir une somme de contrÃ´le invalide', 'fr_FR', '273');
INSERT INTO `core_translate_locale` VALUES ('274', 'L\'entrÃ©e ne doit contenir que des chiffres', 'fr_FR', '274');
INSERT INTO `core_translate_locale` VALUES ('275', 'L\'entrÃ©e contient un nombre invalide de chiffres', 'fr_FR', '275');
INSERT INTO `core_translate_locale` VALUES ('276', 'L\'entrÃ©e ne provient pas d\'une institution autorisÃ©e', 'fr_FR', '276');
INSERT INTO `core_translate_locale` VALUES ('277', 'L\'entrÃ©e semble Ãªtre un numÃ©ro de carte bancaire invalide', 'fr_FR', '277');
INSERT INTO `core_translate_locale` VALUES ('278', 'Le formulaire ne provient pas du site attendu', 'fr_FR', '278');
INSERT INTO `core_translate_locale` VALUES ('279', 'EntrÃ©e invalide. ChaÃ®ne, entier, tableau ou DateTime attendu', 'fr_FR', '279');
INSERT INTO `core_translate_locale` VALUES ('280', 'L\'entrÃ©e ne semble pas Ãªtre une date valide', 'fr_FR', '280');
INSERT INTO `core_translate_locale` VALUES ('281', 'L\'entrÃ©e ne correspond pas au format \'%format%\'', 'fr_FR', '281');
INSERT INTO `core_translate_locale` VALUES ('282', 'L\'entrÃ©e n\'est pas un multiple valide', 'fr_FR', '282');
INSERT INTO `core_translate_locale` VALUES ('283', 'Aucun enregistrement trouvÃ©', 'fr_FR', '283');
INSERT INTO `core_translate_locale` VALUES ('284', 'Un enregistrement a Ã©tÃ© trouvÃ©', 'fr_FR', '284');
INSERT INTO `core_translate_locale` VALUES ('285', 'L\'entrÃ©e n\'est pas une adresse email valide. Utilisez le format local-part@hostname', 'fr_FR', '285');
INSERT INTO `core_translate_locale` VALUES ('286', '\'%hostname%\' n\'est pas un nom d\'hÃ´te valide pour l\'adresse email', 'fr_FR', '286');
INSERT INTO `core_translate_locale` VALUES ('287', '\'%hostname%\' ne semble pas avoir d\'enregistrement MX valide pour l\'adresse email', 'fr_FR', '287');
INSERT INTO `core_translate_locale` VALUES ('288', '\'%hostname%\' n\'est pas dans un segment rÃ©seau routable. L\'adresse email ne devrait pas Ãªtre rÃ©solue depuis un rÃ©seau public.', 'fr_FR', '288');
INSERT INTO `core_translate_locale` VALUES ('289', '\'%localPart%\' ne correspond pas au format dot-atom', 'fr_FR', '289');
INSERT INTO `core_translate_locale` VALUES ('290', '\'%localPart%\' ne correspond pas au format quoted-string', 'fr_FR', '290');
INSERT INTO `core_translate_locale` VALUES ('291', '\'%localPart%\' n\'est pas une partie locale valide pour l\'adresse email', 'fr_FR', '291');
INSERT INTO `core_translate_locale` VALUES ('292', 'L\'entrÃ©e dÃ©passe la taille autorisÃ©e', 'fr_FR', '292');
INSERT INTO `core_translate_locale` VALUES ('293', 'Trop de fichiers. \'%max%\' sont autorisÃ©s au maximum, mais \'%count%\' reÃ§u(s)', 'fr_FR', '293');
INSERT INTO `core_translate_locale` VALUES ('294', 'Trop peu de fichiers. \'%min%\' sont attendus, mais \'%count%\' reÃ§u(s)', 'fr_FR', '294');
INSERT INTO `core_translate_locale` VALUES ('295', 'Le fichier \'%value%\' ne correspond pas aux sommes de contrÃ´le CRC32 donnÃ©es', 'fr_FR', '295');
INSERT INTO `core_translate_locale` VALUES ('296', 'Une somme de contrÃ´le CRC32 n\'a pas pu Ãªtre calculÃ©e pour le fichier', 'fr_FR', '296');
INSERT INTO `core_translate_locale` VALUES ('297', 'Le fichier \'%value%\' n\'est pas lisible ou n\'existe pas', 'fr_FR', '297');
INSERT INTO `core_translate_locale` VALUES ('298', 'Le fichier \'%value%\' a une mauvaise extension', 'fr_FR', '298');
INSERT INTO `core_translate_locale` VALUES ('299', 'Le fichier \'%value%\' n\'existe pas', 'fr_FR', '299');
INSERT INTO `core_translate_locale` VALUES ('300', 'Tous les fichiers devraient avoir une taille maximale de \'%max%\' mais une taille de \'%size%\' a Ã©tÃ© dÃ©tectÃ©e', 'fr_FR', '300');
INSERT INTO `core_translate_locale` VALUES ('301', 'Tous les fichiers devraient avoir une taille minimale de \'%max%\' mais une taille de \'%size%\' a Ã©tÃ© dÃ©tectÃ©e', 'fr_FR', '301');
INSERT INTO `core_translate_locale` VALUES ('302', 'Un ou plusieurs fichiers ne peut pas Ãªtre lu', 'fr_FR', '302');
INSERT INTO `core_translate_locale` VALUES ('303', 'Le fichier \'%value%\' ne correspond pas aux sommes de contrÃ´le donnÃ©es', 'fr_FR', '303');
INSERT INTO `core_translate_locale` VALUES ('304', 'Une somme de contrÃ´le n\'a pas pu Ãªtre calculÃ©e pour le fichier', 'fr_FR', '304');
INSERT INTO `core_translate_locale` VALUES ('305', 'La largeur maximale pour l\'image \'%value%\' devrait Ãªtre \'%maxwidth%\', mais \'%width%\' dÃ©tectÃ©', 'fr_FR', '305');
INSERT INTO `core_translate_locale` VALUES ('306', 'La largeur minimale pour l\'image \'%value%\' devrait Ãªtre \'%minwidth%\', mais \'%width%\' dÃ©tectÃ©', 'fr_FR', '306');
INSERT INTO `core_translate_locale` VALUES ('307', 'La hauteur maximale pour l\'image \'%value%\' devrait Ãªtre \'%maxheight%\', mais \'%height%\' dÃ©tectÃ©', 'fr_FR', '307');
INSERT INTO `core_translate_locale` VALUES ('308', 'La hauteur maximale pour l\'image \'%value%\' devrait Ãªtre \'%minheight%\', mais \'%height%\' dÃ©tectÃ©', 'fr_FR', '308');
INSERT INTO `core_translate_locale` VALUES ('309', 'La taille de l\'image \'%value%\' n\'a pas pu Ãªtre dÃ©tectÃ©e', 'fr_FR', '309');
INSERT INTO `core_translate_locale` VALUES ('310', 'Le fichier \'%value%\' n\'est pas compressÃ©, \'%type%\' dÃ©tectÃ©', 'fr_FR', '310');
INSERT INTO `core_translate_locale` VALUES ('311', 'Le type MIME du fichier \'%value%\' n\'a pas pu Ãªtre dÃ©tectÃ©', 'fr_FR', '311');
INSERT INTO `core_translate_locale` VALUES ('312', 'Le fichier \'%value%\' n\'est pas une image, \'%type%\' dÃ©tectÃ©', 'fr_FR', '312');
INSERT INTO `core_translate_locale` VALUES ('313', 'Le fichier \'%value%\' ne correspond pas aux sommes de contrÃ´le MD5 donnÃ©es', 'fr_FR', '313');
INSERT INTO `core_translate_locale` VALUES ('314', 'Une somme de contrÃ´le MD5 n\'a pas pu Ãªtre calculÃ©e pour le fichier', 'fr_FR', '314');
INSERT INTO `core_translate_locale` VALUES ('315', 'Le fichier \'%value%\' a un faux type MIME : \'%type%\'', 'fr_FR', '315');
INSERT INTO `core_translate_locale` VALUES ('316', 'Le fichier \'%value%\' existe', 'fr_FR', '316');
INSERT INTO `core_translate_locale` VALUES ('317', 'Le fichier \'%value%\' ne correspond pas aux sommes de contrÃ´le SHA1 donnÃ©es', 'fr_FR', '317');
INSERT INTO `core_translate_locale` VALUES ('318', 'Une somme de contrÃ´le SHA1 n\'a pas pu Ãªtre calculÃ©e pour le fichier', 'fr_FR', '318');
INSERT INTO `core_translate_locale` VALUES ('319', 'La taille de fichier maximale pour \'%value%\' est \'%max%\', mais \'%size%\' dÃ©tectÃ©e', 'fr_FR', '319');
INSERT INTO `core_translate_locale` VALUES ('320', 'La taille de fichier minimale pour \'%value%\' est \'%min%\', mais \'%size%\' dÃ©tectÃ©e', 'fr_FR', '320');
INSERT INTO `core_translate_locale` VALUES ('321', 'Le fichier \'%value%\' dÃ©passe la taille dÃ©finie dans le fichier INI', 'fr_FR', '321');
INSERT INTO `core_translate_locale` VALUES ('322', 'Le fichier \'%value%\' dÃ©passe la taille dÃ©finie dans le formulaire', 'fr_FR', '322');
INSERT INTO `core_translate_locale` VALUES ('323', 'Le fichier \'%value%\' n\'a Ã©tÃ© que partiellement envoyÃ©', 'fr_FR', '323');
INSERT INTO `core_translate_locale` VALUES ('324', 'Le fichier \'%value%\' n\'a pas Ã©tÃ© envoyÃ©', 'fr_FR', '324');
INSERT INTO `core_translate_locale` VALUES ('325', 'Le dossier temporaire n\'a pas Ã©tÃ© trouvÃ© pour le fichier \'%value%\'', 'fr_FR', '325');
INSERT INTO `core_translate_locale` VALUES ('326', 'Impossible d\'Ã©crire dans le fichier \'%value%\'', 'fr_FR', '326');
INSERT INTO `core_translate_locale` VALUES ('327', 'Une extension PHP a retournÃ© une erreur en envoyant le fichier \'%value%\'', 'fr_FR', '327');
INSERT INTO `core_translate_locale` VALUES ('328', 'Le fichier \'%value%\' a Ã©tÃ© envoyÃ© illÃ©galement. Il peut s\'agir d\'une attaque', 'fr_FR', '328');
INSERT INTO `core_translate_locale` VALUES ('329', 'Le fichier \'%value%\' n\'a pas Ã©tÃ© trouvÃ©', 'fr_FR', '329');
INSERT INTO `core_translate_locale` VALUES ('330', 'Erreur inconnue lors de l\'envoi du fichier \'%value%\'', 'fr_FR', '330');
INSERT INTO `core_translate_locale` VALUES ('331', 'Le fichier dÃ©passe la taille dÃ©finie dans le fichier INI', 'fr_FR', '331');
INSERT INTO `core_translate_locale` VALUES ('332', 'Le fichier dÃ©passe la taille dÃ©finie dans le formulaire', 'fr_FR', '332');
INSERT INTO `core_translate_locale` VALUES ('333', 'Le fichier n\'a Ã©tÃ© que partiellement envoyÃ©', 'fr_FR', '333');
INSERT INTO `core_translate_locale` VALUES ('334', 'Le fichier n\'a pas Ã©tÃ© envoyÃ©', 'fr_FR', '334');
INSERT INTO `core_translate_locale` VALUES ('335', 'Le dossier temporaire n\'a pas Ã©tÃ© trouvÃ© pour le fichier', 'fr_FR', '335');
INSERT INTO `core_translate_locale` VALUES ('336', 'Impossible d\'Ã©crire dans le fichier', 'fr_FR', '336');
INSERT INTO `core_translate_locale` VALUES ('337', 'Une extension PHP a retournÃ© une erreur en envoyant le fichier', 'fr_FR', '337');
INSERT INTO `core_translate_locale` VALUES ('338', 'Le fichier a Ã©tÃ© envoyÃ© illÃ©galement. Il peut s\'agir d\'une attaque', 'fr_FR', '338');
INSERT INTO `core_translate_locale` VALUES ('339', 'Le fichier n\'a pas Ã©tÃ© trouvÃ©', 'fr_FR', '339');
INSERT INTO `core_translate_locale` VALUES ('340', 'Erreur inconnue lors de l\'envoi du fichier', 'fr_FR', '340');
INSERT INTO `core_translate_locale` VALUES ('341', 'Trop de mots. \'%max%\' sont autorisÃ©s, \'%count%\' comptÃ©s', 'fr_FR', '341');
INSERT INTO `core_translate_locale` VALUES ('342', 'Pas assez de mots. \'%min%\' sont attendus, \'%count%\' comptÃ©s', 'fr_FR', '342');
INSERT INTO `core_translate_locale` VALUES ('343', 'L\'entrÃ©e n\'est pas supÃ©rieure Ã  \'%min%\'', 'fr_FR', '343');
INSERT INTO `core_translate_locale` VALUES ('344', 'L\'entrÃ©e n\'est pas supÃ©rieure ou Ã©gale Ã  \'%min%\'', 'fr_FR', '344');
INSERT INTO `core_translate_locale` VALUES ('345', 'L\'entrÃ©e contient des caractÃ¨res non-hexadÃ©cimaux', 'fr_FR', '345');
INSERT INTO `core_translate_locale` VALUES ('346', 'L\'entrÃ©e semble Ãªtre un DNS valide mais le code n\'a pu Ãªtre dÃ©codÃ©', 'fr_FR', '346');
INSERT INTO `core_translate_locale` VALUES ('347', 'L\'entrÃ©e semble Ãªtre un nom d\'hÃ´te DNS mais il contient un tiret Ã  une position invalide', 'fr_FR', '347');
INSERT INTO `core_translate_locale` VALUES ('348', 'L\'entrÃ©e ne correspond pas Ã  la structure attendue d\'un nom d\'hÃ´te DNS', 'fr_FR', '348');
INSERT INTO `core_translate_locale` VALUES ('349', 'L\'entrÃ©e semble Ãªtre un nom d\'hÃ´te DNS valide mais ne correspond pas au schÃ©ma de l\'extension TLD \'%tld%\'', 'fr_FR', '349');
INSERT INTO `core_translate_locale` VALUES ('350', 'L\'entrÃ©e ne semble pas Ãªtre un nom de rÃ©seau local valide', 'fr_FR', '350');
INSERT INTO `core_translate_locale` VALUES ('351', 'L\'entrÃ©e ne semble pas Ãªtre une URI de nom d\'hÃ´te valide', 'fr_FR', '351');
INSERT INTO `core_translate_locale` VALUES ('352', 'L\'entrÃ©e semble Ãªtre une adresse IP valide, mais les adresses IP ne sont pas autorisÃ©es', 'fr_FR', '352');
INSERT INTO `core_translate_locale` VALUES ('353', 'L\'entrÃ©e semble Ãªtre un nom de rÃ©seau local, mais les rÃ©seaux locaux ne sont pas autorisÃ©s', 'fr_FR', '353');
INSERT INTO `core_translate_locale` VALUES ('354', 'L\'entrÃ©e semble Ãªtre un nom d\'hÃ´te DNS mais l\'extension TLD ne peut Ãªtre extraite', 'fr_FR', '354');
INSERT INTO `core_translate_locale` VALUES ('355', 'L\'entrÃ©e semble Ãªtre un nom d\'hÃ´te DNS mais son extension TLD semble inconnue', 'fr_FR', '355');
INSERT INTO `core_translate_locale` VALUES ('356', 'Pays inconnu pour l\'IBAN', 'fr_FR', '356');
INSERT INTO `core_translate_locale` VALUES ('357', 'Les pays en dehors du Single Euro Payments Area (SEPA) ne sont pas supportÃ©s', 'fr_FR', '357');
INSERT INTO `core_translate_locale` VALUES ('358', 'L\'entrÃ©e n\'a pas un format IBAN valide', 'fr_FR', '358');
INSERT INTO `core_translate_locale` VALUES ('359', 'L\'entrÃ©e n\'a pas passÃ© la validation IBAN', 'fr_FR', '359');
INSERT INTO `core_translate_locale` VALUES ('360', 'Les deux jetons passÃ©s ne correspondent pas', 'fr_FR', '360');
INSERT INTO `core_translate_locale` VALUES ('361', 'Aucun jeton de correspondance n\'a Ã©tÃ© donnÃ©', 'fr_FR', '361');
INSERT INTO `core_translate_locale` VALUES ('362', 'L\'entrÃ©e ne fait pas partie des valeurs attendues', 'fr_FR', '362');
INSERT INTO `core_translate_locale` VALUES ('363', 'L\'entrÃ©e ne semble pas Ãªtre une adresse IP valide', 'fr_FR', '363');
INSERT INTO `core_translate_locale` VALUES ('364', 'L\'entrÃ©e n\'est pas un nombre ISBN valide', 'fr_FR', '364');
INSERT INTO `core_translate_locale` VALUES ('365', 'L\'entrÃ©e n\'est pas infÃ©rieure Ã  \'%max%\'', 'fr_FR', '365');
INSERT INTO `core_translate_locale` VALUES ('366', 'L\'entrÃ©e n\'est pas infÃ©rieure ou Ã©gale Ã  \'%max%\'', 'fr_FR', '366');
INSERT INTO `core_translate_locale` VALUES ('367', 'Une valeur est requise et ne peut Ãªtre vide', 'fr_FR', '367');
INSERT INTO `core_translate_locale` VALUES ('368', 'Type invalide. ChaÃ®ne, entier, flottant, boolÃ©en ou tableau attendu', 'fr_FR', '368');
INSERT INTO `core_translate_locale` VALUES ('369', 'L\'entrÃ©e n\'est pas valide avec l\'expression \'%pattern%\'', 'fr_FR', '369');
INSERT INTO `core_translate_locale` VALUES ('370', 'Une erreur interne est survenue avec l\'expression \'%pattern%\'', 'fr_FR', '370');
INSERT INTO `core_translate_locale` VALUES ('371', 'L\'entrÃ©e n\'est pas une valeur de frÃ©quence de sitemap valide', 'fr_FR', '371');
INSERT INTO `core_translate_locale` VALUES ('372', 'L\'entrÃ©e n\'est pas une date de modification de sitemap valide', 'fr_FR', '372');
INSERT INTO `core_translate_locale` VALUES ('373', 'L\'entrÃ©e n\'est pas un emplacement de sitemap valide', 'fr_FR', '373');
INSERT INTO `core_translate_locale` VALUES ('374', 'L\'entrÃ©e n\'est pas une prioritÃ© de sitemap valide', 'fr_FR', '374');
INSERT INTO `core_translate_locale` VALUES ('375', 'Type invalide. ChaÃ®ne numÃ©rique, entier ou flottant attendu', 'fr_FR', '375');
INSERT INTO `core_translate_locale` VALUES ('376', 'Type invalide. Scalaire attendu', 'fr_FR', '376');
INSERT INTO `core_translate_locale` VALUES ('377', 'L\'entrÃ©e contient moins de %min% caractÃ¨res', 'fr_FR', '377');
INSERT INTO `core_translate_locale` VALUES ('378', 'L\'entrÃ©e contient plus de %max% caractÃ¨res', 'fr_FR', '378');
INSERT INTO `core_translate_locale` VALUES ('379', 'L\'entrÃ©e ne semble pas Ãªtre une URI valide', 'fr_FR', '379');
INSERT INTO `core_translate_locale` VALUES ('380', 'Ð”Ð¾Ð±Ð°Ð²Ð¸Ñ‚ÑŒ', 'ru_RU', '1');
INSERT INTO `core_translate_locale` VALUES ('381', 'Ð”Ð¾Ð±Ð°Ð²Ð¸Ñ‚ÑŒ ÑÐ²Ð¾Ð¹ÑÑ‚Ð²Ð¾', 'ru_RU', '3');
INSERT INTO `core_translate_locale` VALUES ('382', 'Ð”Ð¾Ð±Ð°Ð²Ð¸Ñ‚ÑŒ Ð²ÐºÐ»Ð°Ð´ÐºÑƒ', 'ru_RU', '4');
INSERT INTO `core_translate_locale` VALUES ('383', 'Ð”Ð¾Ð±Ð°Ð²Ð¸Ñ‚ÑŒ Ð¿ÐµÑ€ÐµÐ²Ð¾Ð´', 'ru_RU', '5');
INSERT INTO `core_translate_locale` VALUES ('384', 'Ð”Ð¾Ð±Ð°Ð²Ð¸Ñ‚ÑŒ Ð²Ð¸Ð´', 'ru_RU', '6');
INSERT INTO `core_translate_locale` VALUES ('385', ' ', 'ru_RU', '7');
INSERT INTO `core_translate_locale` VALUES ('386', 'ÐÐ´Ð¼Ð¸Ð½Ð¸ÑÑ‚Ñ€Ð°Ñ‚Ð¾Ñ€', 'ru_RU', '8');
INSERT INTO `core_translate_locale` VALUES ('387', 'Ð”Ð¾ÑÑ‚ÑƒÐ¿Ð½Ñ‹Ðµ Ð¿Ð¾Ð´Ñ‡Ð¸Ð½ÐµÐ½Ð¸Ñ', 'ru_RU', '9');
INSERT INTO `core_translate_locale` VALUES ('388', 'Ð¡Ð¾Ð´ÐµÑ€Ð¶Ð°Ð½Ð¸Ðµ', 'ru_RU', '10');
INSERT INTO `core_translate_locale` VALUES ('389', 'ÐŸÐµÑ‡ÐµÐ½Ð¸Ðµ Ð´Ð¾Ð¼ÐµÐ½Ð°', 'ru_RU', '11');
INSERT INTO `core_translate_locale` VALUES ('390', 'ÐŸÑƒÑ‚ÑŒ Ð¿ÐµÑ‡ÐµÐ½ÑŒÑ', 'ru_RU', '12');
INSERT INTO `core_translate_locale` VALUES ('391', 'ÐšÐ¾Ð¿Ð¸Ñ€Ð¾Ð²Ð°Ñ‚ÑŒ', 'ru_RU', '13');
INSERT INTO `core_translate_locale` VALUES ('392', 'Ð¡Ð¾Ð·Ð´Ð°Ñ‚ÑŒ', 'ru_RU', '14');
INSERT INTO `core_translate_locale` VALUES ('393', 'Ð¡Ð¾Ð·Ð´Ð°Ñ‚ÑŒ Ð´Ð¾ÐºÑƒÐ¼ÐµÐ½Ñ‚', 'ru_RU', '15');
INSERT INTO `core_translate_locale` VALUES ('394', 'Ð¡Ð¾Ð·Ð´Ð°Ð½Ð¸Ðµ, Ñ€ÐµÐ´Ð°ÐºÑ‚Ð¸Ñ€Ð¾Ð²Ð°Ð½Ð¸Ðµ Ð¸ ÑƒÐ´Ð°Ð»ÐµÐ½Ð¸Ðµ Ð¿Ð¾Ð»ÑŒÐ·Ð¾Ð²Ð°Ñ‚ÐµÐ»ÐµÐ¹.', 'ru_RU', '16');
INSERT INTO `core_translate_locale` VALUES ('395', 'Ð¡Ð¾Ð·Ð´Ð°Ð½Ð¸Ðµ, Ñ€ÐµÐ´Ð°ÐºÑ‚Ð¸Ñ€Ð¾Ð²Ð°Ð½Ð¸Ðµ Ð¸ ÑƒÐ´Ð°Ð»ÐµÐ½Ð¸Ðµ Ð²Ð¸Ð´Ð¾Ð².', 'ru_RU', '17');
INSERT INTO `core_translate_locale` VALUES ('396', 'Ð¡Ð¾Ð´Ð°Ð½Ð¸Ðµ ÑÐ¾Ð±ÑÑ‚Ð²ÐµÐ½Ð½Ð¾Ð³Ð¾ ÑÐ°Ð¹Ñ‚Ð°.', 'ru_RU', '18');
INSERT INTO `core_translate_locale` VALUES ('397', 'Ð’Ñ‹Ñ€ÐµÐ·Ð°Ñ‚ÑŒ', 'ru_RU', '19');
INSERT INTO `core_translate_locale` VALUES ('398', 'ÐŸÐ°Ð½ÐµÐ»ÑŒ Ð½Ð°ÑÑ‚Ñ€Ð¾ÐµÐº', 'ru_RU', '20');
INSERT INTO `core_translate_locale` VALUES ('399', 'ÐœÐ¾Ð¶Ð½Ð¾ ÑÐ¾Ñ…Ñ€Ð°Ð½ÑÑ‚ÑŒ Ð»ÑŽÐ±Ñ‹Ðµ Ð´Ð°Ð½Ð½Ñ‹Ðµ. Ð¡Ð¾Ð·Ð´Ð°Ð¹Ñ‚Ðµ ÑÐ²Ð¾Ð¹ Ñ‚Ð¸Ð¿ Ð´Ð°Ð½Ð½Ñ‹Ñ…, Ð—Ð°Ð¹Ð´Ð¸Ñ‚Ðµ Ð² ÐºÐ¾Ð½Ñ„Ð¸Ð³ÑƒÑ€Ð¸Ñ€Ð¾Ð²Ð°Ð½Ð¸Ðµ, Ð¸ Ð²Ñ‹Ð±ÐµÑ€ÐµÑ‚Ðµ ÑÑ‚Ð¾Ñ‚ Ñ‚Ð¸Ð¿ Ð´Ð»Ñ ÑÐ²Ð¾ÐµÐ³Ð¾ Ð´Ð¾ÐºÑƒÐ¼ÐµÐ½Ñ‚Ð°.', 'ru_RU', '21');
INSERT INTO `core_translate_locale` VALUES ('400', 'Ñ‚Ð¸Ð¿ Ð´Ð°Ð½Ð½Ñ‹Ñ…', 'ru_RU', '22');
INSERT INTO `core_translate_locale` VALUES ('401', 'Ð¢Ð¸Ð¿Ñ‹ Ð´Ð°Ð½Ð½Ñ‹Ñ…', 'ru_RU', '23');
INSERT INTO `core_translate_locale` VALUES ('402', 'ÐžÑ‚Ð»Ð°Ð´ÐºÐ°', 'ru_RU', '380');
INSERT INTO `core_translate_locale` VALUES ('403', 'ÐžÑ‚Ð»Ð°Ð´ÐºÐ° Ð°ÐºÑ‚Ð¸Ð²Ð¸Ñ€Ð¾Ð²Ð°Ð½Ð°', 'ru_RU', '24');
INSERT INTO `core_translate_locale` VALUES ('404', 'ÐšÐµÑˆ', 'ru_RU', '381');
INSERT INTO `core_translate_locale` VALUES ('405', 'ÐšÐµÑˆ Ð°ÐºÑ‚Ð¸Ð²ÐµÑ€Ð¾Ð²Ð°Ð½', 'ru_RU', '25');
INSERT INTO `core_translate_locale` VALUES ('406', 'ÐžÐ±Ñ€Ð°Ð±Ð¾Ñ‚Ñ‡Ð¸Ðº ÐºÐµÑˆÐ°', 'ru_RU', '26');
INSERT INTO `core_translate_locale` VALUES ('407', 'Ð’Ñ€ÐµÐ¼Ñ Ð¶Ð¸Ð·Ð½Ð¸ ÐºÐµÑˆÐ°', 'ru_RU', '27');
INSERT INTO `core_translate_locale` VALUES ('408', 'Ð¡ÐµÑ‚ÑŒ', 'ru_RU', '382');
INSERT INTO `core_translate_locale` VALUES ('409', 'ÐŸÑ€Ð¸Ð½ÑƒÐ´Ð¸Ñ‚ÐµÐ»ÑŒÐ½Ñ‹Ð¹ SSL Ð´Ð»Ñ ÑÐµÑ€Ð²ÐµÑ€Ð°', 'ru_RU', '247');
INSERT INTO `core_translate_locale` VALUES ('410', 'ÐŸÑ€Ð¸Ð½ÑƒÐ´Ð¸Ñ‚ÐµÐ»ÑŒÐ½Ñ‹Ð¹ SSL Ð´Ð»Ñ Ð¸Ð½Ñ‚ÐµÑ€Ñ„ÐµÐ¹ÑÐ°', 'ru_RU', '383');
INSERT INTO `core_translate_locale` VALUES ('411', 'ÐžÐ±Ñ‹Ñ‡Ð½Ñ‹Ð¹ Ð¿ÑƒÑ‚ÑŒ ÑÐµÑ€Ð²ÐµÑ€Ð°', 'ru_RU', '248');
INSERT INTO `core_translate_locale` VALUES ('412', 'ÐžÐ±Ñ‹Ñ‡Ð½Ñ‹Ð¹ Ð¿ÑƒÑ‚ÑŒ Ð¸Ð½Ñ‚ÐµÑ€Ñ„ÐµÐ¹ÑÐ°', 'ru_RU', '249');
INSERT INTO `core_translate_locale` VALUES ('413', 'Ð‘ÐµÐ·Ð¾Ð¿Ð°ÑÐ½Ñ‹Ð¹ Ð¿ÑƒÑ‚ÑŒ ÑÐµÑ€Ð²ÐµÑ€Ð°', 'ru_RU', '250');
INSERT INTO `core_translate_locale` VALUES ('414', 'Ð‘ÐµÐ·Ð¾Ð¿Ð°ÑÐ½Ñ‹Ð¹ Ð¿ÑƒÑ‚ÑŒ Ð¸Ð½Ñ‚ÐµÑ€Ñ„ÐµÐ¹ÑÐ°', 'ru_RU', '251');
INSERT INTO `core_translate_locale` VALUES ('415', 'ÐžÐ±Ñ‹Ñ‡Ð½Ñ‹Ð¹ Ð¿ÑƒÑ‚ÑŒ Ñ„ÑƒÐ½ÐºÑ†Ð¸Ð¹ cdn', 'ru_RU', '252');
INSERT INTO `core_translate_locale` VALUES ('416', 'Ð‘ÐµÐ·Ð¾Ð¿Ð°ÑÐ½Ñ‹Ð¹ Ð¿ÑƒÑ‚ÑŒ Ñ„ÑƒÐ½ÐºÑ†Ð¸Ð¹ cdn', 'ru_RU', '253');
INSERT INTO `core_translate_locale` VALUES ('417', 'Ð’Ð¸Ð´ Ð¿Ð¾ ÑƒÐ¼Ð¾Ð»Ñ‡Ð°Ð½Ð¸ÑŽ', 'ru_RU', '28');
INSERT INTO `core_translate_locale` VALUES ('418', 'ÐžÐ¿Ñ€ÐµÐ´ÐµÐ»Ð¸Ñ‚Ðµ Ð´Ð°Ð½Ð½Ñ‹Ðµ, ÐºÐ¾Ñ‚Ð¾Ñ€Ñ‹Ðµ Ð±ÑƒÐ´ÑƒÑ‚ Ð¸ÑÐ¿Ð¾Ð»ÑŒÐ·Ð¾Ð²Ð°Ñ‚ÑŒÑÑ Ð´Ð»Ñ ÑÐ°Ð¹Ñ‚Ð°, Ñ‚Ð°ÐºÐ¸Ðµ ÐºÐ°Ðº ÑÐ·Ñ‹Ðº, ÑÐµÑÑÐ¸Ð¸, Ð¸Ð¼Ñ ...', 'ru_RU', '29');
INSERT INTO `core_translate_locale` VALUES ('419', 'Ð£Ð´Ð°Ð»Ð¸Ñ‚ÑŒ', 'ru_RU', '30');
INSERT INTO `core_translate_locale` VALUES ('420', 'Ð Ð°Ð·Ñ€Ð°Ð±Ð¾Ñ‚ÐºÐ°', 'ru_RU', '31');
INSERT INTO `core_translate_locale` VALUES ('421', 'Ð Ð°Ð·Ñ€Ð°Ð±Ð¾Ñ‚Ñ‡Ð¸Ðº', 'ru_RU', '32');
INSERT INTO `core_translate_locale` VALUES ('422', 'Ð Ð°Ð·ÑŠÐµÐ´ÐµÐ½Ð¸Ñ‚ÑŒ', 'ru_RU', '33');
INSERT INTO `core_translate_locale` VALUES ('423', 'Ð¢Ð¸Ð¿ Ð´Ð¾ÐºÑƒÐ¼ÐµÐ½Ñ‚Ð°', 'ru_RU', '34');
INSERT INTO `core_translate_locale` VALUES ('424', 'Ð ÐµÐ´Ð°ÐºÑ‚Ð¸Ñ€Ð¾Ð²Ð°Ñ‚ÑŒ', 'ru_RU', '35');
INSERT INTO `core_translate_locale` VALUES ('425', 'Ð ÐµÐ´Ð°ÐºÑ‚Ð¸Ñ€Ð¾Ð²Ð°Ñ‚ÑŒ Ð¿ÐµÑ€ÐµÐ²Ð¾Ð´ ÑÐ¾Ð´ÐµÑ€Ð¶Ð°Ð½Ð¸Ñ Ð´Ð»Ñ Ð¸Ð½Ñ‚ÐµÑ€Ñ„ÐµÐ¹ÑÐ° Ð¸ ÑÐµÑ€Ð²ÐµÑ€Ð°\".', 'ru_RU', '36');
INSERT INTO `core_translate_locale` VALUES ('426', 'elFinder ÑÐ²Ð»ÑÐµÑ‚ÑÑ Ð¾Ñ‚ÐºÑ€Ñ‹Ñ‚Ñ‹Ð¼ Ð¸ÑÑ…Ð¾Ð´Ð½Ñ‹Ð¼ ÐºÐ¾Ð´Ð¾Ð¼ Ñ„Ð°Ð¹Ð»Ð¾Ð²Ð¾Ð³Ð¾ Ð¼ÐµÐ½ÐµÐ´Ð¶ÐµÑ€Ð° Ð´Ð»Ñ ÑÐ°Ð¹Ñ‚Ð°. Ð¡ ÐµÐ³Ð¾ Ð¿Ð¾Ð¼Ð¾Ñ‰ÑŒÑŽ Ð²Ñ‹ Ð¼Ð¾Ð¶ÐµÑ‚Ðµ ÑƒÐ¿Ñ€Ð°Ð²Ð»ÑÑ‚ÑŒ ÑÐ²Ð¾Ð¸Ð¼Ð¸ Ñ„Ð°Ð¹Ð»Ð°Ð¼Ð¸, Ð¿Ð°Ð¿ÐºÐ°Ð¼Ð¸ Ð¸ Ð´Ñ€ÑƒÐ³Ð¸Ð¼Ð¸ Ð´Ð°Ð½Ð½Ñ‹Ð¼Ð¸ ÑÑ‚Ð¾Ð³Ð¾ ÑÐ°Ð¹Ñ‚Ð°.', 'ru_RU', '37');
INSERT INTO `core_translate_locale` VALUES ('427', 'Ð‘Ñ‹ÑÑ‚Ñ€Ð°Ñ ÑÑÑ‹Ð»ÐºÐ°', 'ru_RU', '38');
INSERT INTO `core_translate_locale` VALUES ('428', 'Ð¤Ð°Ð¹Ð»Ð¾Ð²Ñ‹Ð¹ Ð¼ÐµÐ½ÐµÐ´Ð¶ÐµÑ€', 'ru_RU', '39');
INSERT INTO `core_translate_locale` VALUES ('429', 'Ð¤Ð°Ð¹Ð»Ñ‹', 'ru_RU', '40');
INSERT INTO `core_translate_locale` VALUES ('430', 'Ð˜Ð¼Ñ', 'ru_RU', '41');
INSERT INTO `core_translate_locale` VALUES ('431', 'Ð—Ð°Ð±Ñ‹Ð»Ð¸ Ð¿Ð°Ñ€Ð¾Ð»ÑŒ?', 'ru_RU', '42');
INSERT INTO `core_translate_locale` VALUES ('432', 'E-mail Ð¾Ñ‚', 'ru_RU', '43');
INSERT INTO `core_translate_locale` VALUES ('433', 'Ð˜Ð¼Ñ Ð¾Ñ‚Ð¿Ñ€Ð°Ð²Ð¸Ñ‚ÐµÐ»Ñ', 'ru_RU', '44');
INSERT INTO `core_translate_locale` VALUES ('434', 'Ð“Ð»Ð°Ð²Ð½Ð°Ñ', 'ru_RU', '45');
INSERT INTO `core_translate_locale` VALUES ('435', 'Ð“Ð»Ð°Ð²Ð½Ð°Ñ ÐºÐ¾Ð½Ñ„Ð¸Ð³ÑƒÑ€Ð°Ñ†Ð¸Ñ', 'ru_RU', '46');
INSERT INTO `core_translate_locale` VALUES ('436', 'Ð•ÑÑ‚ÑŒ Ð¼Ð½Ð¾Ð³Ð¾ Ð¾Ð¿Ñ†Ð¸Ð¹ ÐºÐ°Ðº Ñƒ Ð¾ÐºÐ½Ð° Ð¿Ñ€Ð¾Ð²Ð¾Ð´Ð½Ð¸ÐºÐ°. Ð‘ÑƒÐ´ÑŒÑ‚Ðµ Ð²Ð½Ð¸Ð¼Ð°Ñ‚ÐµÐ»ÑŒÐ½Ñ‹ Ð¿Ñ€Ð¸ ÑƒÐ´Ð°Ð»ÐµÐ½Ð¸Ð¸ Ð´Ð°Ð½Ð½Ñ‹Ñ…, Ð¾Ð¿ÐµÑ€Ð°Ñ†Ð¸Ñ Ð½Ðµ Ð¾Ð±Ñ€Ð°Ñ‚Ð¸Ð¼Ð°!', 'ru_RU', '47');
INSERT INTO `core_translate_locale` VALUES ('437', 'Ð˜Ð´ÐµÐ½Ñ‚Ð¸Ñ„Ð¸ÐºÐ°Ñ‚Ð¾Ñ€', 'ru_RU', '48');
INSERT INTO `core_translate_locale` VALUES ('438', 'Ð˜Ð¼Ð¿Ð¾Ñ€Ñ‚ Ð²ÐºÐ»Ð°Ð´Ð¾Ðº', 'ru_RU', '49');
INSERT INTO `core_translate_locale` VALUES ('439', 'Ð’ÑÑ‚Ð°Ð²Ñ‚Ðµ Ñ‚Ð¸Ð¿ Ð¾Ð±ÑŠÐµÐºÑ‚Ð° Ð² Ð´Ð¾ÐºÑƒÐ¼ÐµÐ½Ñ‚, ÐµÑÐ»Ð¸ Ð²Ñ‹ Ñ…Ð¾Ñ‚Ð¸Ñ‚Ðµ Ð¿Ð¾Ð»ÑƒÑ‡Ð¸Ñ‚ÑŒ Ð¸ Ð¸ÑÐ¿Ð¾Ð»ÑŒÐ·Ð¾Ð²Ð°Ñ‚ÑŒ ÑÐ²ÐµÐ´ÐµÐ½Ð¸Ñ Ð¾Ð± Ð¾Ð±ÑŠÐµÐºÑ‚Ðµ : $this->propertyIdentifier', 'ru_RU', '50');
INSERT INTO `core_translate_locale` VALUES ('440', 'ÐÐºÑ‚Ð¸Ð²Ð¸Ñ€Ð¾Ð²Ð°Ð½Ð¾', 'ru_RU', '51');
INSERT INTO `core_translate_locale` VALUES ('441', 'ÐÐ²Ñ‚Ð¾Ð½Ð¾Ð¼Ð½Ñ‹Ð¹ Ñ€ÐµÐ¶Ð¸Ð¼', 'ru_RU', '52');
INSERT INTO `core_translate_locale` VALUES ('442', 'Ð¤Ð°Ð¼Ð¸Ð»Ð¸Ñ', 'ru_RU', '53');
INSERT INTO `core_translate_locale` VALUES ('443', 'Ð¨Ð°Ð±Ð»Ð¾Ð½', 'ru_RU', '54');
INSERT INTO `core_translate_locale` VALUES ('444', 'ÐžÐ³Ñ€Ð°Ð½Ð¸Ñ‡ÐµÐ½Ð¸Ñ Ð¿Ð¾Ð»ÑŒÐ·Ð¾Ð²Ð°Ñ‚ÐµÐ»ÐµÐ¹  Ð´Ð»Ñ Ñ€Ð¾Ð»ÐµÐ¹', 'ru_RU', '55');
INSERT INTO `core_translate_locale` VALUES ('445', 'ÑÐ¿Ð¸ÑÐ¾Ðº', 'ru_RU', '56');
INSERT INTO `core_translate_locale` VALUES ('446', 'Ð’Ñ…Ð¾Ð´', 'ru_RU', '57');
INSERT INTO `core_translate_locale` VALUES ('447', 'M.V.C ÑÐ¾Ð·Ð´Ð°Ð½Ð¾ Ð´Ð»Ñ Ñ‚ÐµÐ±Ñ', 'ru_RU', '58');
INSERT INTO `core_translate_locale` VALUES ('448', ' ', 'ru_RU', '59');
INSERT INTO `core_translate_locale` VALUES ('449', ' ', 'ru_RU', '60');
INSERT INTO `core_translate_locale` VALUES ('450', ' ', 'ru_RU', '61');
INSERT INTO `core_translate_locale` VALUES ('451', 'Ð£Ð¿Ñ€Ð°Ð²Ð»ÐµÐ½Ð¸Ðµ ÐºÐ¾Ð½Ñ„Ð¸Ð³ÑƒÑ€Ð°Ñ†Ð¸ÐµÐ¹', 'ru_RU', '62');
INSERT INTO `core_translate_locale` VALUES ('452', 'Ð£Ð¿Ñ€Ð°Ð²Ð»ÐµÐ½Ð¸Ðµ Ñ‚Ð¸Ð¿Ð°Ð¼Ð¸ Ð´Ð°Ð½Ð½Ñ‹Ñ…', 'ru_RU', '63');
INSERT INTO `core_translate_locale` VALUES ('453', 'Ð£Ð¿Ñ€Ð°Ð²Ð»ÐµÐ½Ð¸Ðµ Ð´Ð¾ÐºÑƒÐ¼ÐµÐ½Ñ‚Ð°Ð¼Ð¸', 'ru_RU', '64');
INSERT INTO `core_translate_locale` VALUES ('454', 'Ð£Ð¿Ñ€Ð°Ð²Ð»ÐµÐ½Ð¸Ðµ Ñ‚Ð¸Ð¿Ð°Ð¼Ð¸ Ð´Ð¾ÐºÑƒÐ¼ÐµÐ½Ñ‚Ð¾Ð²', 'ru_RU', '65');
INSERT INTO `core_translate_locale` VALUES ('455', 'Ð£Ð¿Ñ€Ð°Ð²Ð»ÐµÐ½Ð¸Ðµ ÑˆÐ°Ð±Ð»Ð¾Ð½Ð°Ð¼Ð¸', 'ru_RU', '66');
INSERT INTO `core_translate_locale` VALUES ('456', 'Ð£Ð¿Ñ€Ð°Ð²Ð»ÐµÐ½Ð¸Ðµ Ñ€ÐµÑÑƒÑ€ÑÐ°Ð¼Ð¸', 'ru_RU', '67');
INSERT INTO `core_translate_locale` VALUES ('457', 'Ð£Ð¿Ñ€Ð°Ð²Ð»ÐµÐ½Ð¸Ðµ Ñ€Ð¾Ð»ÑÐ¼Ð¸', 'ru_RU', '68');
INSERT INTO `core_translate_locale` VALUES ('458', 'Ð£Ð¿Ñ€Ð°Ð²Ð»ÐµÐ½Ð¸Ðµ ÑÐºÑ€Ð¸Ð¿Ñ‚Ð°Ð¼Ð¸', 'ru_RU', '69');
INSERT INTO `core_translate_locale` VALUES ('459', 'Ð£Ð¿Ñ€Ð°Ð²Ð»ÐµÐ½Ð¸Ðµ Ð¿ÐµÑ€ÐµÐ²Ð¾Ð´Ð¾Ð¼', 'ru_RU', '70');
INSERT INTO `core_translate_locale` VALUES ('460', 'Ð£Ð¿Ñ€Ð°Ð²Ð»ÐµÐ½Ð¸Ðµ Ð¿Ð¾Ð»ÑŒÐ·Ð¾Ð²Ð°Ñ‚ÐµÐ»ÑÐ¼Ð¸', 'ru_RU', '71');
INSERT INTO `core_translate_locale` VALUES ('461', 'Ð£Ð¿Ñ€Ð°Ð²Ð»ÐµÐ½Ð¸Ðµ Ð²Ð¸Ð´Ð°Ð¼Ð¸', 'ru_RU', '72');
INSERT INTO `core_translate_locale` VALUES ('462', 'ÐœÐ¾Ð´ÐµÐ»ÑŒ', 'ru_RU', '73');
INSERT INTO `core_translate_locale` VALUES ('463', 'Ð˜Ð¼Ñ', 'ru_RU', '74');
INSERT INTO `core_translate_locale` VALUES ('464', 'ÐÐ¾Ð²Ñ‹Ð¹', 'ru_RU', '75');
INSERT INTO `core_translate_locale` VALUES ('465', 'Ð¡Ð»ÐµÐ´ÑƒÑŽÑ‰Ð¸Ð¹', 'ru_RU', '76');
INSERT INTO `core_translate_locale` VALUES ('466', 'Ð”Ð¾ÐºÑƒÐ¼ÐµÐ½Ñ‚ ÑÐ½ÑÑ‚ Ñ Ð¿ÑƒÐ±Ð»Ð¸ÐºÐ°Ñ†Ð¸Ð¸', 'ru_RU', '77');
INSERT INTO `core_translate_locale` VALUES ('467', 'Ð”Ð¾ÐºÑƒÐ¼ÐµÐ½Ñ‚ Ð¾Ð¿ÑƒÐ±Ð»Ð¸ÐºÐ¾Ð²Ð°Ð½', 'ru_RU', '78');
INSERT INTO `core_translate_locale` VALUES ('468', 'Ð”Ñ€Ð°Ð¹Ð²ÐµÑ€', 'ru_RU', '384');
INSERT INTO `core_translate_locale` VALUES ('469', 'Ð¡ÐµÑ€Ð²ÐµÑ€ Ð±Ð°Ð·Ñ‹ Ð´Ð°Ð½Ð½Ñ‹Ñ…', 'ru_RU', '385');
INSERT INTO `core_translate_locale` VALUES ('470', 'Ð‘Ð°Ð·Ð° Ð´Ð°Ð½Ð½Ñ‹Ñ…', 'ru_RU', '386');
INSERT INTO `core_translate_locale` VALUES ('471', 'ÐšÐ¾Ð½Ñ„Ð¸Ð³ÑƒÑ€Ð°Ñ†Ð¸Ñ Ð’Ð°ÑˆÐµÐ³Ð¾ ÑÐ°Ð¹Ñ‚Ð°', 'ru_RU', '387');
INSERT INTO `core_translate_locale` VALUES ('472', 'Ð Ð¾Ð»Ð¸', 'ru_RU', '388');
INSERT INTO `core_translate_locale` VALUES ('473', 'Ð’Ñ‹Ð±ÐµÑ€Ð¸Ñ‚Ðµ Ð´Ð¾ÐºÑƒÐ¼ÐµÐ½Ñ‚', 'ru_RU', '171');
INSERT INTO `core_translate_locale` VALUES ('474', 'ÐŸÐ¾Ð»ÑŒÐ·Ð¾Ð²Ð°Ñ‚ÐµÐ»ÑŒ', 'ru_RU', '389');
INSERT INTO `core_translate_locale` VALUES ('475', 'ÐŸÐ°Ñ€Ð¾Ð»ÑŒ', 'ru_RU', '79');
INSERT INTO `core_translate_locale` VALUES ('476', 'ÐŸÐ¾Ð»ÑŒÐ·Ð¾Ð²Ð°Ñ‚ÐµÐ»ÑŒ Ð°Ð´Ð¼Ð¸Ð½Ð¸ÑÑ‚Ñ€Ð°Ñ‚Ð¾Ñ€', 'ru_RU', '219');
INSERT INTO `core_translate_locale` VALUES ('477', 'ÐŸÐ°Ñ€Ð¾Ð»ÑŒ Ð°Ð´Ð¼Ð¸Ð½Ð¸ÑÑ‚Ñ€Ð°Ñ‚Ð¾Ñ€Ð°', 'ru_RU', '220');
INSERT INTO `core_translate_locale` VALUES ('478', 'ÐŸÐ¾Ð´Ñ‚Ð²ÐµÑ€Ð¶Ð´ÐµÐ½Ð¸Ðµ Ð¿Ð°Ñ€Ð¾Ð»Ñ Ð°Ð´Ð¼Ð¸Ð½Ð¸ÑÑ‚Ñ€Ð°Ñ‚Ð¾Ñ€Ð°', 'ru_RU', '221');
INSERT INTO `core_translate_locale` VALUES ('479', 'ÐžÑÐ½Ð¾Ð²Ð½Ð¾Ð¹ ÑˆÐ°Ð±Ð»Ð¾Ð½', 'ru_RU', '222');
INSERT INTO `core_translate_locale` VALUES ('480', 'Ð’Ñ‹Ð±ÐµÑ€Ð¸Ñ‚Ðµ ÑˆÐ°Ð±Ð»Ð¾Ð½', 'ru_RU', '390');
INSERT INTO `core_translate_locale` VALUES ('481', 'ÐÐ²Ñ‚Ð¾Ñ€', 'ru_RU', '391');
INSERT INTO `core_translate_locale` VALUES ('482', 'URL ÑÐ°Ð¹Ñ‚Ð°', 'ru_RU', '392');
INSERT INTO `core_translate_locale` VALUES ('483', 'ÑÑÑ‹Ð»ÐºÐ° Ð½Ð° ÑÐ°Ð¹Ñ‚', 'ru_RU', '393');
INSERT INTO `core_translate_locale` VALUES ('484', 'ÐÐµÐ¾Ð±Ñ…Ð¾Ð´Ð¸Ð¼Ñ‹Ðµ Ð¼Ð¾Ð´ÑƒÐ»Ð¸', 'ru_RU', '394');
INSERT INTO `core_translate_locale` VALUES ('485', 'ÐŸÐ¾Ð´Ñ‚Ð²ÐµÑ€Ð¶Ð´ÐµÐ½Ð¸Ðµ Ð¿Ð°Ñ€Ð¾Ð»Ñ', 'ru_RU', '80');
INSERT INTO `core_translate_locale` VALUES ('486', 'Ð—Ð°Ð²ÐµÑ€ÑˆÐµÐ½Ð¸Ðµ ÑƒÑÑ‚Ð°Ð½Ð¾Ð²ÐºÐ¸', 'ru_RU', '225');
INSERT INTO `core_translate_locale` VALUES ('487', 'Ð¡Ð¾Ð·Ð´Ð°Ð½Ð¸Ðµ Ð±Ð°Ð·Ñ‹ Ð´Ð°Ð½Ð½Ñ‹Ñ…', 'ru_RU', '229');
INSERT INTO `core_translate_locale` VALUES ('488', 'Ð—Ð°Ð¿Ð¾Ð»Ð½ÐµÐ½Ð¸Ðµ Ð±Ð°Ð·Ñ‹ Ð´Ð°Ð½Ð½Ñ‹Ñ…', 'ru_RU', '230');
INSERT INTO `core_translate_locale` VALUES ('489', 'Ð¡Ð¾Ð·Ð´Ð°Ð½Ð¸Ðµ Ð¿Ð¾Ð»ÑŒÐ·Ð¾Ð²Ð°Ñ‚ÐµÐ»ÐµÐ¹ Ð¸ Ñ€Ð¾Ð»ÐµÐ¹', 'ru_RU', '232');
INSERT INTO `core_translate_locale` VALUES ('490', 'Ð£ÑÑ‚Ð°Ð½Ð¾Ð²ÐºÐ° ÑˆÐ°Ð±Ð»Ð¾Ð½Ð°', 'ru_RU', '233');
INSERT INTO `core_translate_locale` VALUES ('491', 'Ð¡Ð¾Ð·Ð´Ð°Ð½Ð¸Ðµ Ñ„Ð°Ð¹Ð»Ð° ÐºÐ¾Ð½Ñ„Ð¸Ð³ÑƒÑ€Ð°Ñ†Ð¸Ð¸', 'ru_RU', '234');
INSERT INTO `core_translate_locale` VALUES ('492', 'Ð£ÑÑ‚Ð°Ð½Ð¾Ð²ÐºÐ° Ð·Ð°Ð²ÐµÑ€ÑˆÐµÐ½Ð°. ÐžÐ±Ð½Ð¾Ð²Ð¸Ñ‚Ðµ ÑÑ‚Ñ€Ð°Ð½Ð¸Ñ†Ñƒ Ð¸Ð»Ð¸ Ð¿ÐµÑ€ÐµÐ¹Ð´Ð¸Ñ‚Ðµ Ð½Ð° ÑÑ‚Ñ€Ð°Ð½Ð¸Ñ†Ñƒ \"Ð²Ð°Ñˆ ÑÐ°Ð¹Ñ‚\"/admin Ð´Ð»Ñ ÑƒÐ¿Ñ€Ð°Ð²Ð»ÐµÐ½Ð¸Ñ ÑÐ°Ð¹Ñ‚Ð¾Ð¼', 'ru_RU', '224');
INSERT INTO `core_translate_locale` VALUES ('493', 'Ð’ÑÑ‚Ð°Ð²Ð¸Ñ‚ÑŒ', 'ru_RU', '81');
INSERT INTO `core_translate_locale` VALUES ('494', 'Ð¡Ð²Ð¾Ð¹ÑÑ‚Ð²Ð°', 'ru_RU', '82');
INSERT INTO `core_translate_locale` VALUES ('495', 'Ð’Ñ‹Ñ…Ð¾Ð´', 'ru_RU', '83');
INSERT INTO `core_translate_locale` VALUES ('496', 'Ð¢Ñ€ÐµÐ±ÑƒÐµÑ‚ÑÑ', 'ru_RU', '84');
INSERT INTO `core_translate_locale` VALUES ('497', 'Ñ€Ð¾Ð»ÑŒ', 'ru_RU', '85');
INSERT INTO `core_translate_locale` VALUES ('498', 'Ð¡Ð¾Ñ…Ñ€Ð°Ð½Ð¸Ñ‚ÑŒ', 'ru_RU', '86');
INSERT INTO `core_translate_locale` VALUES ('499', 'Ð¡Ð¾Ñ…Ñ€Ð°Ð½Ð¸Ñ‚ÑŒ Ð¸ Ð¾Ð¿ÑƒÐ±Ð»Ð¸ÐºÐ¾Ð²Ð°Ñ‚ÑŒ', 'ru_RU', '87');
INSERT INTO `core_translate_locale` VALUES ('500', 'Ð¡ÐµÑ€Ð²ÐµÑ€', 'ru_RU', '88');
INSERT INTO `core_translate_locale` VALUES ('501', 'Ð¯Ð·Ñ‹Ðº ÑÐµÑ€Ð²ÐµÑ€Ð°', 'ru_RU', '89');
INSERT INTO `core_translate_locale` VALUES ('502', 'Ð¡ÐµÑÑÐ¸Ñ', 'ru_RU', '395');
INSERT INTO `core_translate_locale` VALUES ('503', 'ÐŸÑƒÑ‚ÑŒ ÑÐ¾Ñ…Ñ€Ð°Ð½ÐµÐ½Ð¸Ñ ÑÐµÑÑÐ¸Ð¹', 'ru_RU', '245');
INSERT INTO `core_translate_locale` VALUES ('504', 'ÐžÐ±Ñ€Ð°Ð±Ð¾Ñ‚Ñ‡Ð¸Ðº ÑÐµÑÑÐ¸Ð¸', 'ru_RU', '90');
INSERT INTO `core_translate_locale` VALUES ('505', 'Ð’Ñ€ÐµÐ¼Ñ Ð¶Ð¸Ð·Ð½Ð¸ ÑÐµÑÐ¸Ð¸', 'ru_RU', '91');
INSERT INTO `core_translate_locale` VALUES ('506', 'Ð˜Ð¼Ñ ÑÐ°Ð¹Ñ‚Ð°', 'ru_RU', '92');
INSERT INTO `core_translate_locale` VALUES ('507', 'Ð¡Ð¾Ñ‚Ñ€ÑƒÐ´Ð½Ð¸Ðº', 'ru_RU', '93');
INSERT INTO `core_translate_locale` VALUES ('508', 'ÑÐ¸ÑÑ‚ÐµÐ¼Ð°', 'ru_RU', '94');
INSERT INTO `core_translate_locale` VALUES ('509', ' ', 'ru_RU', '95');
INSERT INTO `core_translate_locale` VALUES ('510', 'Ð’ÐºÐ»Ð°Ð´ÐºÐ¸', 'ru_RU', '96');
INSERT INTO `core_translate_locale` VALUES ('511', 'Ð—Ð° Ð´Ð¾Ð¿Ð¾Ð»Ð½Ð¸Ñ‚ÐµÐ»ÑŒÐ½Ð¾Ð¹ Ð¸Ð½Ñ„Ð¾Ñ€Ð¼Ð°Ñ†Ð¸ÐµÐ¹ Ð¾Ð±Ñ€Ð°Ñ‚Ð¸Ñ‚ÐµÑÑŒ Ðº Ð´Ð¾ÐºÑƒÐ¼ÐµÐ½Ñ‚Ð°Ñ†Ð¸Ð¸, ÐµÑÐ»Ð¸ Ð²Ñ‹ Ñ…Ð¾Ñ‚Ð¸Ñ‚Ðµ Ð¿Ð¾Ð»ÑƒÑ‡Ð¸Ñ‚ÑŒ Ð±Ð¾Ð»ÑŒÑˆÐµ Ð¸Ð½Ñ„Ð¾Ñ€Ð¼Ð°Ñ†Ð¸Ð¸ Ð¾ Zend Framework Ð¸ GotCms.', 'ru_RU', '97');
INSERT INTO `core_translate_locale` VALUES ('512', 'Ð­Ñ‚Ð¸ ÑÐ»ÐµÐ¼ÐµÐ½Ñ‚Ñ‹ Ð±ÑƒÐ´ÑƒÑ‚ ÑƒÐ´Ð°Ð»ÐµÐ½Ñ‹ Ð¸ Ð½Ðµ Ð¼Ð¾Ð³ÑƒÑ‚ Ð±Ñ‹Ñ‚ÑŒ Ð²Ð¾ÑÑÑ‚Ð°Ð½Ð¾Ð²Ð»ÐµÐ½Ñ‹. Ð’Ñ‹ ÑƒÐ²ÐµÑ€ÐµÐ½Ñ‹, ?', 'ru_RU', '98');
INSERT INTO `core_translate_locale` VALUES ('513', 'Ð­Ñ‚Ð¾ ÑˆÐ°Ð±Ð»Ð¾Ð½ Ð´Ð¾ÐºÑƒÐ¼ÐµÐ½Ñ‚Ð° . Ð¡Ð¾Ñ€Ñ‚Ð¸Ñ€Ð¾Ð²ÐºÐ° Ð¿Ð¾ Ð²ÐºÐ»Ð°Ð´ÐºÐ°Ð¼, Ñ‚Ð¸Ð¿Ð°Ð¼ Ð´Ð°Ð½Ð½Ñ‹Ñ… Ð¸ Ð²Ð¸Ð´Ð°Ð¼.', 'ru_RU', '100');
INSERT INTO `core_translate_locale` VALUES ('514', 'Ð”Ð¾ÐºÑƒÐ¼ÐµÐ½Ñ‚Ð¾Ð² Ð²ÑÐµÐ³Ð¾', 'ru_RU', '101');
INSERT INTO `core_translate_locale` VALUES ('515', 'ÐŸÐµÑ€ÐµÐ²Ð¾Ð´', 'ru_RU', '102');
INSERT INTO `core_translate_locale` VALUES ('516', 'Ð¡Ð¿Ð¸ÑÐ¾Ðº Ð¿Ð¾Ð»ÑŒÐ·Ð¾Ð²Ð°Ñ‚ÐµÐ»ÐµÐ¹', 'ru_RU', '103');
INSERT INTO `core_translate_locale` VALUES ('517', 'ÐŸÐ¾Ð»ÑŒÐ·Ð¾Ð²Ð°Ñ‚ÐµÐ»Ð¸', 'ru_RU', '104');
INSERT INTO `core_translate_locale` VALUES ('518', 'Ð’Ð¸Ð´Ñ‹', 'ru_RU', '105');
INSERT INTO `core_translate_locale` VALUES ('519', ' ', 'ru_RU', '106');
INSERT INTO `core_translate_locale` VALUES ('520', 'Ð”Ð¾Ð±Ñ€Ð¾ Ð¿Ð¾Ð¶Ð°Ð»Ð¾Ð²Ð°Ñ‚ÑŒ %s', 'ru_RU', '107');
INSERT INTO `core_translate_locale` VALUES ('521', 'Ð”Ð»Ñ Ð¸ÑÐ¿Ð¾Ð»ÑŒÐ·Ð¾Ð²Ð°Ð½Ð¸Ñ Ð²Ð¸Ð´Ð° Ð’Ñ‹ Ð´Ð¾Ð»Ð¶Ð½Ñ‹ Ð¾Ð¿Ñ€ÐµÐ´ÐµÐ»Ð¸Ñ‚ÑŒ ÑÐ²Ð¾Ð¹ÑÑ‚Ð²Ð°, Ð¸ÑÐ¿Ð¾Ð»ÑŒÐ·ÑƒÐ¹Ñ‚Ðµ Ð¿Ð¾Ð¼Ð¾ÑˆÐ½Ð¸ÐºÐ° Ð²Ð¸Ð´Ð° Ð´Ð»Ñ Ð²Ð½ÐµÐ´Ñ€ÐµÐ½Ð¸Ñ Ð¿Ð¾Ð´Ñ‡Ð¸Ð½ÐµÐ½Ñ‹Ñ… Ð²Ð¸Ð´Ð¾Ð²: $this->content.', 'ru_RU', '108');
INSERT INTO `core_translate_locale` VALUES ('522', 'Ð Ð°Ð±Ð¾Ñ‚Ð°ÐµÑ‚ ÐºÐ°Ðº ÐºÐ¾Ð½Ñ‚Ñ€Ð¾Ð»Ð»ÐµÑ€Ñ‹ Zend Framework, Ð¸Ð¼ÐµÐµÑ‚ÑÑ Ð´Ð¾ÑÑ‚ÑƒÐ¿ Ðº Ð·Ð°Ð¿Ñ€Ð¾ÑÑƒ, Ð¾Ñ‚Ð²ÐµÑ‚Ñƒ Ð¸ Ð¿Ð»Ð°Ð³Ð¸Ð½Ð°Ð¼ ÐºÐ¾Ð½Ñ‚Ñ€Ð¾Ð»Ð»ÐµÑ€Ð°.', 'ru_RU', '109');
INSERT INTO `core_translate_locale` VALUES ('523', 'Ð’Ñ‹ Ð¼Ð¾Ð¶ÐµÑ‚Ðµ ÑÐ¾Ð·Ð´Ð°Ð²Ð°Ñ‚ÑŒ, Ñ€ÐµÐ´Ð°ÐºÑ‚Ð¸Ñ€Ð¾Ð²Ð°Ñ‚ÑŒ, ÐºÐ¾Ð¿Ð¸Ñ€Ð¾Ð²Ð°Ñ‚ÑŒ, Ð²Ñ‹Ñ€ÐµÐ·Ð°Ñ‚ÑŒ Ð¸ Ð²ÑÑ‚Ð°Ð²Ð»ÑÑ‚ÑŒ Ð´Ð¾ÐºÑƒÐ¼ÐµÐ½Ñ‚ Ñ‰ÐµÐ»ÐºÐ½ÑƒÐ² Ð¿Ñ€Ð°Ð²Ð¾Ð¹ ÐºÐ½Ð¾Ð¿ÐºÐ¾Ð¹ Ð¼Ñ‹ÑˆÐ¸ Ð½Ð° Ð²ÐµÐ±-ÑÐ°Ð¹Ñ‚Ðµ Ð¸Ð»Ð¸ Ð¿Ð¾Ð´Ñ‡ÐµÐ½ÐµÐ½Ð½Ð¾Ð¼ Ð´Ð¾ÐºÑƒÐ¼ÐµÐ½Ñ‚Ðµ.', 'ru_RU', '110');
INSERT INTO `core_translate_locale` VALUES ('524', 'Ð’Ñ‹ Ð¸ÑÐ¿Ð¾Ð»ÑŒÐ·ÑƒÐµÑ‚Ðµ GotCms %s', 'ru_RU', '111');
INSERT INTO `core_translate_locale` VALUES ('525', 'Ð¨Ð°Ð³ :', 'ru_RU', '112');
INSERT INTO `core_translate_locale` VALUES ('526', 'Ð£ÑÑ‚Ð°Ð½Ð¾Ð²ÐºÐ°', 'ru_RU', '396');
INSERT INTO `core_translate_locale` VALUES ('527', 'Ð’Ñ‹Ð±ÐµÑ€Ð¸Ñ‚Ðµ ÑÐ·Ñ‹Ðº', 'ru_RU', '397');
INSERT INTO `core_translate_locale` VALUES ('528', 'Ð¯Ð·Ñ‹Ðº', 'ru_RU', '113');
INSERT INTO `core_translate_locale` VALUES ('529', 'Ð›Ð¸Ñ†ÐµÐ½Ð·Ð¸Ñ', 'ru_RU', '114');
INSERT INTO `core_translate_locale` VALUES ('530', 'Ð£ÑÑ‚Ð°Ð½Ð¾Ð²ÐºÐ° ÐºÐ¾Ð½Ñ„Ð¸Ð³ÑƒÑ€Ð°Ñ†Ð¸Ð¸', 'ru_RU', '115');
INSERT INTO `core_translate_locale` VALUES ('531', 'Ð‘Ð°Ð·Ð° Ð´Ð°Ð½Ð½Ñ‹Ñ…', 'ru_RU', '116');
INSERT INTO `core_translate_locale` VALUES ('532', 'Ð’Ñ‹ Ð´Ð¾Ð»Ð¶Ð½Ñ‹ Ð¿Ñ€Ð¸Ð½ÑÑ‚ÑŒ ÑƒÑÐ»Ð¾Ð²Ð¸Ñ Ð»Ð¸Ñ†ÐµÐ½Ð·Ð¸Ð¸ Ð´Ð»Ñ Ð¿Ñ€Ð¾Ð´Ð¾Ð»Ð¶ÐµÐ½Ð¸Ñ ÑƒÑÑ‚Ð°Ð½Ð¾Ð²ÐºÐ¸ ÑÑ‚Ð¾Ð³Ð¾ Ð¿Ñ€Ð¾Ð³Ñ€Ð°Ð¼Ð¼Ð½Ð¾Ð³Ð¾ Ð¾Ð±ÐµÑÐ¿ÐµÑ‡ÐµÐ½Ð¸Ñ.', 'ru_RU', '117');
INSERT INTO `core_translate_locale` VALUES ('533', 'ÐŸÑ€Ð¾Ð´Ð¾Ð»Ð¶Ð¸Ñ‚ÑŒ', 'ru_RU', '118');
INSERT INTO `core_translate_locale` VALUES ('534', 'ÐŸÑ€Ð¾Ð²ÐµÑ€ÐºÐ° Ð¿ÐµÑ€ÐµÐ´ ÑƒÑÑ‚Ð°Ð½Ð¾Ð²ÐºÐ¾Ð¹ GotCms %s', 'ru_RU', '119');
INSERT INTO `core_translate_locale` VALUES ('535', 'Ð”Ð»Ñ Ð¿Ñ€Ð°Ð²Ð¸Ð»ÑŒÐ½Ð¾Ð¹ ÑƒÑÑ‚Ð°Ð½Ð¾Ð²ÐºÐ¸ ÑÐ¸ÑÑ‚ÐµÐ¼Ñ‹, Ð¿Ð°Ñ€Ð°Ð¼ÐµÑ‚Ñ€Ñ‹ ÐÐ• Ð´Ð¾Ð»Ð¶Ð½Ñ‹ Ð¸Ð¼ÐµÑ‚ÑŒ Ð·Ð½Ð°Ñ‡ÐµÐ½Ð¸Ðµ  \"ÐÐµÑ‚\".', 'ru_RU', '120');
INSERT INTO `core_translate_locale` VALUES ('536', 'Ð”Ð°', 'ru_RU', '121');
INSERT INTO `core_translate_locale` VALUES ('537', 'ÐÐµÑ‚', 'ru_RU', '398');
INSERT INTO `core_translate_locale` VALUES ('538', 'Ð’ÐºÐ»ÑŽÑ‡ÐµÐ½Ð¾', 'ru_RU', '122');
INSERT INTO `core_translate_locale` VALUES ('539', 'ÐžÑ‚ÐºÐ»ÑŽÑ‡ÐµÐ½Ð¾', 'ru_RU', '123');
INSERT INTO `core_translate_locale` VALUES ('540', 'Ð ÐµÐºÐ¾Ð¼ÐµÐ½Ð´Ð¾Ð²Ð°Ð½Ð¾', 'ru_RU', '124');
INSERT INTO `core_translate_locale` VALUES ('541', '%s Ñ€Ð°Ð·Ñ€ÐµÑˆÐµÐ½Ð¾ Ð½Ð° Ð·Ð°Ð¿Ð¸ÑÑŒ', 'ru_RU', '125');
INSERT INTO `core_translate_locale` VALUES ('542', 'Ð ÐµÐºÐ¾Ð¼ÐµÐ½Ð´ÑƒÐµÐ¼Ñ‹Ðµ Ð¿Ð°Ñ€Ð°Ð¼ÐµÑ‚Ñ€Ñ‹', 'ru_RU', '126');
INSERT INTO `core_translate_locale` VALUES ('543', 'Ð”Ð»Ñ Ð¾Ð±ÐµÑÐ¿ÐµÑ‡ÐµÐ½Ð¸ Ð¿Ð¾Ð»Ð½Ð¾Ð¹ ÑÐ¾Ð²Ð¼ÐµÑÑ‚Ð¸Ð¼Ð¾ÑÑ‚Ð¸, ÑÑ‚Ð¸ Ð½Ð°ÑÑ‚Ñ€Ð¾Ð¹ÐºÐ¸ Ñ€ÐµÐºÐ¾Ð¼ÐµÐ½Ð´ÑƒÐµÑ‚ÑÑ Ð´Ð»Ñ PHP.', 'ru_RU', '127');
INSERT INTO `core_translate_locale` VALUES ('544', 'ÐžÐ¿Ñ€ÐµÐ´ÐµÐ»ÐµÐ½Ð¾', 'ru_RU', '128');
INSERT INTO `core_translate_locale` VALUES ('545', 'Ð’ÑÐµ Ð¿Ð°Ñ€Ð°Ð¼ÐµÑ‚Ñ€Ñ‹ Ð´Ð¾Ð»Ð¶Ð½Ñ‹ Ð±Ñ‹Ñ‚ÑŒ ÑƒÑÑ‚Ð°Ð½Ð¾Ð²Ð»ÐµÐ½Ñ‹ Ð½Ð° Ð·Ð½Ð°Ñ‡ÐµÐ½Ð¸Ðµ \\\"Ð”Ð°\\\"', 'ru_RU', '129');
INSERT INTO `core_translate_locale` VALUES ('546', 'Ð¡Ñ‚Ð°Ñ‚ÑƒÑ', 'ru_RU', '130');
INSERT INTO `core_translate_locale` VALUES ('547', 'ÐŸÐ¾ÑÐµÑ‚Ð¸Ñ‚ÐµÐ»ÐµÐ¹ Ð²ÑÐµÐ³Ð¾', 'ru_RU', '131');
INSERT INTO `core_translate_locale` VALUES ('548', 'ÐŸÑ€Ð¾ÑÐ¼Ð¾Ñ‚Ñ€Ð¾Ð² ÑÑ‚Ñ€Ð°Ð½Ð¸Ñ† Ð²ÑÐµÐ³Ð¾', 'ru_RU', '132');
INSERT INTO `core_translate_locale` VALUES ('549', 'ÐžÐ±Ð½Ð¾Ð²Ð»ÐµÐ½Ð¸Ðµ', 'ru_RU', '133');
INSERT INTO `core_translate_locale` VALUES ('550', 'Ð²ÑÐµ', 'ru_RU', '134');
INSERT INTO `core_translate_locale` VALUES ('551', 'Ð¿Ð¾Ð»ÑŒÐ·Ð¾Ð²Ð°Ñ‚ÐµÐ»ÑŒ', 'ru_RU', '135');
INSERT INTO `core_translate_locale` VALUES ('552', 'Ð¼ÐµÐ´Ð¸Ð°', 'ru_RU', '136');
INSERT INTO `core_translate_locale` VALUES ('553', 'ÑÐ·Ñ‹Ðº', 'ru_RU', '137');
INSERT INTO `core_translate_locale` VALUES ('554', 'Ð²Ð¸Ð´', 'ru_RU', '138');
INSERT INTO `core_translate_locale` VALUES ('555', 'ÑˆÐ°Ð±Ð»Ð¾Ð½', 'ru_RU', '139');
INSERT INTO `core_translate_locale` VALUES ('556', 'Ð´Ð¾ÐºÑƒÐ¼ÐµÐ½Ñ‚', 'ru_RU', '399');
INSERT INTO `core_translate_locale` VALUES ('557', 'Ñ‚Ð¸Ð¿ Ð´Ð¾ÐºÑƒÐ¼ÐµÐ½Ñ‚Ð°', 'ru_RU', '142');
INSERT INTO `core_translate_locale` VALUES ('558', 'Ð£ÑÑ‚Ð°Ð½Ð¾Ð²Ð»ÐµÐ½Ð° Ð¿Ð¾ÑÐ»ÐµÐ´Ð½ÑÑ Ð²ÐµÑ€ÑÐ¸Ñ', 'ru_RU', '143');
INSERT INTO `core_translate_locale` VALUES ('559', 'Ð¢ÐµÐºÑƒÑ‰Ð¸Ð¹ Ð´ÐµÐ½ÑŒ', 'ru_RU', '144');
INSERT INTO `core_translate_locale` VALUES ('560', 'ÐœÐµÑÑÑ†', 'ru_RU', '145');
INSERT INTO `core_translate_locale` VALUES ('561', 'Ð“Ð¾Ð´', 'ru_RU', '146');
INSERT INTO `core_translate_locale` VALUES ('562', 'Ð’ÑÐµ Ð²Ñ€ÐµÐ¼Ñ', 'ru_RU', '147');
INSERT INTO `core_translate_locale` VALUES ('563', 'ÐŸÑ€Ð¾ÑÐ¼Ð¾Ñ‚Ñ€ ÑÑ‚Ñ€Ð°Ð½Ð¸Ñ†Ñ‹', 'ru_RU', '148');
INSERT INTO `core_translate_locale` VALUES ('564', 'ÐŸÐ¾ÑÐµÑ‚Ð¸Ñ‚ÐµÐ»ÑŒ', 'ru_RU', '149');
INSERT INTO `core_translate_locale` VALUES ('565', 'ÐÐ´Ñ€ÐµÑÐ°, Ð½Ð°Ð±Ð¾Ð»ÑŒÑˆÐ¸Ðµ Ð¿Ñ€Ð¾ÑÐ¼Ð¾Ñ‚Ñ€Ñ‹ ', 'ru_RU', '150');
INSERT INTO `core_translate_locale` VALUES ('566', 'Ð¡ÑÑ‹Ð»ÐºÐ¸', 'ru_RU', '151');
INSERT INTO `core_translate_locale` VALUES ('567', 'Ð­Ñ‚Ð¾Ñ‚ Ð¼Ð¾Ð´ÑƒÐ»ÑŒ Ð¸Ð¼ÐµÐµÑ‚ Ð¿Ñ€Ð¾Ð±Ð»ÐµÐ¼Ñ‹ :', 'ru_RU', '152');
INSERT INTO `core_translate_locale` VALUES ('568', 'Ð­Ñ‚Ð¾Ñ‚ Ñ‚Ð¸Ð¿ Ð´Ð°Ð½Ð½Ñ‹Ñ… Ð¸Ð¼ÐµÐµÑ‚ Ð¿Ñ€Ð¾Ð±Ð»ÐµÐ¼Ñ‹ :', 'ru_RU', '153');
INSERT INTO `core_translate_locale` VALUES ('569', 'Ð¡ÑƒÑ‰ÐµÑÑ‚Ð²ÑƒÐµÑ‚ Ð½Ð¾Ð²Ð°Ñ Ð²ÐµÑ€ÑÐ¸Ñ %s , Ð¿Ð¾Ð¶Ð°Ð»ÑƒÑÑ‚Ð° Ð¾Ð±Ð½Ð¾Ð²Ð¸Ñ‚Ðµ Ð´Ð»Ñ Ð¾Ð±ÐµÑÐ¿ÐµÑ‡ÐµÐ½Ð¸Ñ Ð±ÐµÐ·Ð¾Ð¿Ð°ÑÐ½Ð¾ÑÑ‚Ð¸.', 'ru_RU', '154');
INSERT INTO `core_translate_locale` VALUES ('570', 'Ð’Ñ‹ Ð´ÐµÐ¹ÑÑ‚Ð²Ð¸Ñ‚ÐµÐ»ÑŒÐ½Ð¾ Ñ…Ð¾Ñ‚Ð¸Ñ‚Ðµ Ð¾Ð±Ð½Ð¾Ð²Ð¸Ñ‚ÑŒ GotCms ?', 'ru_RU', '155');
INSERT INTO `core_translate_locale` VALUES ('571', 'Ð¡ÑÑ‹Ð»ÐºÐ° Ð¿Ñ€Ð¾ÐµÐºÑ‚Ð° Ð½Ð°  github :', 'ru_RU', '156');
INSERT INTO `core_translate_locale` VALUES ('572', 'ÐŸÐ°Ð½ÐµÐ»ÑŒ ÑƒÐ¿Ñ€Ð°Ð²Ð»ÐµÐ½Ð¸Ñ', 'ru_RU', '157');
INSERT INTO `core_translate_locale` VALUES ('573', 'ÐœÐ¾Ð´ÑƒÐ»Ð¸', 'ru_RU', '158');
INSERT INTO `core_translate_locale` VALUES ('574', 'ÐœÐ¾Ð´ÑƒÐ»ÑŒ', 'ru_RU', '400');
INSERT INTO `core_translate_locale` VALUES ('575', 'Ð’Ñ‹Ð±ÐµÑ€Ð¸Ñ‚Ðµ ...', 'ru_RU', '228');
INSERT INTO `core_translate_locale` VALUES ('576', 'ÐšÐ¾Ð½Ñ„Ð¸Ð³ÑƒÑ€Ð°Ñ†Ð¸Ñ', 'ru_RU', '159');
INSERT INTO `core_translate_locale` VALUES ('577', 'Ð˜ÑÑ‚Ð¾Ñ‡Ð½Ð¸Ðº', 'ru_RU', '160');
INSERT INTO `core_translate_locale` VALUES ('578', 'ÐÐ°Ð·Ð½Ð°Ñ‡ÐµÐ½Ð¸Ðµ', 'ru_RU', '161');
INSERT INTO `core_translate_locale` VALUES ('579', 'Ð¡ÐºÑ€Ð¸Ð¿Ñ‚', 'ru_RU', '162');
INSERT INTO `core_translate_locale` VALUES ('580', 'Ð¡ÐºÑ€Ð¸Ð¿Ñ‚', 'ru_RU', '401');
INSERT INTO `core_translate_locale` VALUES ('581', 'Ð˜Ð½Ñ„Ð¾Ñ€Ð¼Ð°Ñ†Ð¸Ñ', 'ru_RU', '163');
INSERT INTO `core_translate_locale` VALUES ('582', 'Ð¯Ð·Ñ‹Ðº', 'ru_RU', '164');
INSERT INTO `core_translate_locale` VALUES ('583', 'ÐžÐ¿Ð¸ÑÐ°Ð½Ð¸Ðµ', 'ru_RU', '165');
INSERT INTO `core_translate_locale` VALUES ('584', 'Ð˜ÐºÐ¾Ð½ÐºÐ°', 'ru_RU', '166');
INSERT INTO `core_translate_locale` VALUES ('585', 'Ð˜Ð½Ñ„Ð¾Ñ€Ð¼Ð°Ñ†Ð¸Ñ', 'ru_RU', '167');
INSERT INTO `core_translate_locale` VALUES ('586', 'Ð”Ð¾Ð¼Ð¾Ð¹', 'ru_RU', '402');
INSERT INTO `core_translate_locale` VALUES ('587', 'Ð¡Ð²ÑÐ·ÑŒ', 'ru_RU', '403');
INSERT INTO `core_translate_locale` VALUES ('588', 'Ð¡Ñ‚Ð°Ñ‚Ð¸ÑÑ‚Ð¸ÐºÐ°', 'ru_RU', '168');
INSERT INTO `core_translate_locale` VALUES ('589', 'ÑƒÑÑ‚Ð°Ð½Ð¾Ð²ÐºÐ°', 'ru_RU', '226');
INSERT INTO `core_translate_locale` VALUES ('590', 'Ð´ÐµÐ¸Ð½ÑÑ‚Ð°Ð»ÑÑ†Ð¸Ñ', 'ru_RU', '169');
INSERT INTO `core_translate_locale` VALUES ('591', '-- Ð’Ñ‹Ð±Ð¾Ñ€ --', 'ru_RU', '170');
INSERT INTO `core_translate_locale` VALUES ('592', 'ÐŸÐ¾ÐºÐ°Ð·Ð°Ñ‚ÑŒ / Ð¡ÐºÑ€Ñ‹Ñ‚ÑŒ Ñ‚Ð¸Ð¿Ñ‹ Ð´Ð°Ð½Ð½Ñ‹Ñ…', 'ru_RU', '172');
INSERT INTO `core_translate_locale` VALUES ('593', 'Ð’ÐºÐ»Ð°Ð´ÐºÐ°', 'ru_RU', '173');
INSERT INTO `core_translate_locale` VALUES ('594', 'Ð—Ð°Ð³Ñ€ÑƒÐ·Ð¸Ñ‚ÑŒ Ð²ÑÐµ Ñ„Ð°Ð¹Ð»Ñ‹', 'ru_RU', '174');
INSERT INTO `core_translate_locale` VALUES ('595', 'Ð—Ð°Ð³Ñ€ÑƒÐ·ÐºÐ° Ñ„Ð°Ð¹Ð»Ð°', 'ru_RU', '175');
INSERT INTO `core_translate_locale` VALUES ('596', 'Ð¤Ð¾Ñ€Ð¼Ð°Ñ‚ Ñ„Ð°Ð¹Ð»Ð° : .phtml', 'ru_RU', '178');
INSERT INTO `core_translate_locale` VALUES ('597', 'Ð—Ð°Ð³Ñ€ÑƒÐ·ÐºÐ°', 'ru_RU', '180');
INSERT INTO `core_translate_locale` VALUES ('598', 'Ð—Ð°Ð³Ñ€ÑƒÐ·ÐºÐ° Ñ„Ð°Ð¹Ð»Ð°', 'ru_RU', '181');
INSERT INTO `core_translate_locale` VALUES ('599', '%d Ð²ÐºÐ»ÑŽÑ‡Ð¸Ñ‚ÑŒ ÐºÐ¾Ð¼Ð¼ÐµÐ½Ñ‚Ð°Ñ€Ð¸Ð¸', 'ru_RU', '182');
INSERT INTO `core_translate_locale` VALUES ('600', '%d Ð¾Ñ‚ÐºÐ»ÑŽÑ‡Ð¸Ñ‚ÑŒ ÐºÐ¾Ð¼Ð¼ÐµÐ½Ñ‚Ð°Ñ€Ð¸Ð¸', 'ru_RU', '183');
INSERT INTO `core_translate_locale` VALUES ('601', 'Ð“ÐµÐ½ÐµÑ€Ð¸Ñ€Ð¾Ð²Ð°Ñ‚ÑŒ', 'ru_RU', '184');
INSERT INTO `core_translate_locale` VALUES ('602', 'Ð¢Ð¾Ð»ÑŒÐºÐ¾ Ð´Ð°Ð½Ñ‹Ðµ', 'ru_RU', '185');
INSERT INTO `core_translate_locale` VALUES ('603', 'Ð¢Ð¾Ð»ÑŒÐºÐ¾ ÑÑ‚Ñ€ÑƒÐºÑ‚ÑƒÑ€Ð°', 'ru_RU', '186');
INSERT INTO `core_translate_locale` VALUES ('604', 'Ð¡Ñ‚Ñ€ÑƒÐºÑ‚ÑƒÑ€Ð° Ð¸ Ð´Ð°Ð½Ð½Ñ‹Ðµ', 'ru_RU', '187');
INSERT INTO `core_translate_locale` VALUES ('605', 'Ð—Ð°Ð³Ñ€ÑƒÐ·ÐºÐ°', 'ru_RU', '188');
INSERT INTO `core_translate_locale` VALUES ('606', 'Ð’Ð½Ð¸Ð¼Ð°Ð½Ð¸Ðµ', 'ru_RU', '189');
INSERT INTO `core_translate_locale` VALUES ('607', 'Ð’Ñ‹Ñ…Ð¾Ð´', 'ru_RU', '190');
INSERT INTO `core_translate_locale` VALUES ('608', 'ÐÐ°Ð¶Ð¼Ð¸Ñ‚Ðµ Ð´Ð»Ñ Ð²Ñ‹Ñ…Ð¾Ð´Ð°', 'ru_RU', '191');
INSERT INTO `core_translate_locale` VALUES ('609', 'Ð¡ÐºÑ€Ð¸Ð¿Ñ‚ ÑÐ¾Ñ…Ñ€Ð°Ð½ÐµÐ½', 'ru_RU', '192');
INSERT INTO `core_translate_locale` VALUES ('610', 'Ð¨Ð°Ð±Ð»Ð¾Ð½ ÑÐ¾Ñ…Ñ€Ð°Ð½ÐµÐ½', 'ru_RU', '193');
INSERT INTO `core_translate_locale` VALUES ('611', 'Ð’Ð¸Ð´ ÑÐ¾Ñ…Ñ€Ð°Ð½ÐµÐ½', 'ru_RU', '194');
INSERT INTO `core_translate_locale` VALUES ('612', 'ÐŸÐ¾Ð»ÑŒÐ·Ð¾Ð²Ð°Ñ‚ÐµÐ»ÑŒ ÑÐ¾Ñ…Ñ€Ð°Ð½ÐµÐ½', 'ru_RU', '195');
INSERT INTO `core_translate_locale` VALUES ('613', 'Ð¢Ð¸Ð¿ Ð´Ð°Ð½Ð½Ñ‹Ñ… ÑÐ¾Ñ…Ñ€Ð°Ð½ÐµÐ½', 'ru_RU', '196');
INSERT INTO `core_translate_locale` VALUES ('614', 'Ð¢Ð¸Ð¿ Ð´Ð¾ÐºÑƒÐ¼ÐµÐ½Ñ‚Ð° ÑÐ¾Ñ…Ñ€Ð°Ð½ÐµÐ½', 'ru_RU', '197');
INSERT INTO `core_translate_locale` VALUES ('615', 'ÐšÐ¾Ð½Ñ„Ð¸Ð³ÑƒÑ€Ð°Ñ†Ð¸Ñ ÑÐ¾Ñ…Ñ€Ð°Ð½ÐµÐ½Ð°', 'ru_RU', '199');
INSERT INTO `core_translate_locale` VALUES ('616', 'ÐÐµ Ð²Ð¾Ð·Ð¼Ð¾Ð¶Ð½Ð¾ ÑÐ¾Ñ…Ñ€Ð°Ð½Ð¸Ñ‚ÑŒ Ð¿Ð¾Ð»ÑŒÐ·Ð¾Ð²Ð°Ñ‚ÐµÐ»Ñ', 'ru_RU', '200');
INSERT INTO `core_translate_locale` VALUES ('617', 'ÐŸÐ¾Ð»ÑŒÐ·Ð¾Ð²Ð°Ñ‚ÐµÐ»ÑŒ Ð½Ðµ Ð¾Ð¿Ñ€ÐµÐ´ÐµÐ»ÐµÐ½', 'ru_RU', '201');
INSERT INTO `core_translate_locale` VALUES ('618', 'ÐŸÐ¾Ð»ÑŒÐ·Ð¾Ð²Ð°Ñ‚ÐµÐ»ÑŒ ÑƒÐ´Ð°Ð»ÐµÐ½', 'ru_RU', '202');
INSERT INTO `core_translate_locale` VALUES ('619', 'Ð¢Ð¸Ð¿ Ð´Ð°Ð½Ð½Ñ‹Ñ… ÑƒÐ´Ð°Ð»ÐµÐ½', 'ru_RU', '203');
INSERT INTO `core_translate_locale` VALUES ('620', 'Ð¢Ð¸Ð¿ Ð´Ð¾ÐºÑƒÐ¼ÐµÐ½Ñ‚Ð° ÑƒÐ´Ð°Ð»ÐµÐ½', 'ru_RU', '204');
INSERT INTO `core_translate_locale` VALUES ('621', 'Ð’ÐºÐ»Ð°Ð´ÐºÐ° ÑƒÐ´Ð°Ð»ÐµÐ½Ð°', 'ru_RU', '205');
INSERT INTO `core_translate_locale` VALUES ('622', 'Ð¡Ð²Ð¾Ð¹ÑÑ‚Ð²Ð¾ ÑƒÐ´Ð°Ð»ÐµÐ½Ð¾', 'ru_RU', '206');
INSERT INTO `core_translate_locale` VALUES ('623', 'Ð¨Ð°Ð±Ð»Ð¾Ð½ ÑƒÐ´Ð°Ð»ÐµÐ½', 'ru_RU', '207');
INSERT INTO `core_translate_locale` VALUES ('624', 'Ð¡ÐºÑ€Ð¸Ð¿Ñ‚ ÑƒÐ´Ð°Ð»ÐµÐ½ ', 'ru_RU', '208');
INSERT INTO `core_translate_locale` VALUES ('625', 'Ð’Ð¸Ð´ ÑƒÐ´Ð°Ð»ÐµÐ½', 'ru_RU', '209');
INSERT INTO `core_translate_locale` VALUES ('626', 'Ð Ð¾Ð»ÑŒ ÑƒÐ´Ð°Ð»ÐµÐ½Ð°', 'ru_RU', '210');
INSERT INTO `core_translate_locale` VALUES ('627', 'Ð Ð¾Ð»ÑŒ Ð½Ðµ Ð¾Ð¿Ñ€ÐµÐ»ÐµÐ½Ð°', 'ru_RU', '211');
INSERT INTO `core_translate_locale` VALUES ('628', 'Ð¢Ð¸Ð¿ Ð´Ð°Ð½Ð½Ñ‹Ñ… Ð½Ðµ Ð¾Ð¿Ñ€ÐµÐ´ÐµÐ»ÐµÐ½', 'ru_RU', '212');
INSERT INTO `core_translate_locale` VALUES ('629', 'Ð¢Ð¸Ð¿ Ð´Ð¾ÐºÑƒÐ¼ÐµÐ½Ñ‚Ð° Ð½Ðµ Ð¾Ð¿Ñ€ÐµÐ´ÐµÐ»ÐµÐ½', 'ru_RU', '213');
INSERT INTO `core_translate_locale` VALUES ('630', 'Ð’Ð¸Ð´ Ð½Ðµ Ð¾Ð¿Ñ€ÐµÐ´ÐµÐ»ÐµÐ½', 'ru_RU', '214');
INSERT INTO `core_translate_locale` VALUES ('631', 'Ð¨Ð°Ð±Ð»Ð¾Ð½ Ð½Ðµ Ð¾Ð¿Ñ€ÐµÐ´ÐµÐ»ÐµÐ½', 'ru_RU', '215');
INSERT INTO `core_translate_locale` VALUES ('632', 'Ð¡ÐºÑ€Ð¸Ð¿Ñ‚ Ð½Ðµ Ð¾Ð¿Ñ€ÐµÐ´ÐµÐ»ÐµÐ½', 'ru_RU', '216');
INSERT INTO `core_translate_locale` VALUES ('633', 'ÐŸÑ€Ð¾ÐµÐºÑ‚ git Ð½Ð°Ð¹Ð´ÐµÐ½, Ð¿Ñ€Ð¾Ð²ÐµÑ€Ñ‚Ðµ Ð½Ð°ÑÑ‚Ñ€Ð¾Ð¹ÐºÐ¸ Ð¿Ð¾Ð»ÑŒÐ·Ð¾Ð²Ð°Ñ‚ÐµÐ»Ñ ÑÐµÑ€Ð²ÐµÑ€Ð° apache.', 'ru_RU', '217');
INSERT INTO `core_translate_locale` VALUES ('634', 'ÐšÐ¾Ð½Ñ„Ð¸Ð³ÑƒÑ€Ð°Ñ†Ð¸Ñ Ð±Ð°Ð·Ñ‹ Ð´Ð°Ð½Ð½Ñ‹Ñ…', 'ru_RU', '218');
INSERT INTO `core_translate_locale` VALUES ('635', 'ÐÐµÐ²ÐµÑ€Ð½Ñ‹Ð¹ Ñ‚Ð¸Ð¿ Ð´Ð°Ð½Ð½Ñ‹Ñ…, Ð¾Ð¶Ð¸Ð´Ð°ÐµÑ‚ÑÑ ÑÑ‚Ñ€Ð¾ÐºÐ°, Ñ†ÐµÐ»Ð¾Ðµ Ñ‡Ð¸ÑÐ»Ð¾ Ð¸Ð»Ð¸ Ñ‡Ð¸ÑÐ»Ð¾ Ñ Ð¿Ð»Ð°Ð²Ð°ÑŽÑ‰ÐµÐ¹ Ñ‚Ð¾Ñ‡ÐºÐ¾Ð¹', 'ru_RU', '256');
INSERT INTO `core_translate_locale` VALUES ('636', 'Ð’Ð²Ð¾Ð´ ÑÐ¾Ð´ÐµÑ€Ð¶Ð¸Ñ‚ ÑÐ¸Ð²Ð¾Ð»Ñ‹ Ð¾Ñ‚Ð»Ð¸Ñ‡Ð°ÑŽÑ‰Ð¸ÐµÑÑ Ð¾Ñ‚ Ñ‚ÐµÐºÑÑ‚Ð¾Ð²Ð¾Ð¹ Ð¸ Ñ†Ð¸Ñ„Ñ€Ð¾Ð²Ð¾Ð¹ Ð¸Ð½Ñ„Ð¾Ñ€Ð¼Ð°Ñ†Ð¸Ð¸', 'ru_RU', '257');
INSERT INTO `core_translate_locale` VALUES ('637', 'Ð’Ð²ÐµÐ´ÐµÐ½Ð° Ð¿ÑƒÑÑ‚Ð°Ñ ÑÑ‚Ñ€Ð¾ÐºÐ°', 'ru_RU', '258');
INSERT INTO `core_translate_locale` VALUES ('638', 'ÐÐµÐ²ÐµÑ€Ð½Ñ‹Ð¹ Ñ‚Ð¸Ð¿, Ð¾Ð¶Ð¸Ð´Ð°ÐµÑ‚ÑÑ ÑÑ‚Ñ€Ð¾ÐºÐ°', 'ru_RU', '259');
INSERT INTO `core_translate_locale` VALUES ('639', 'Ð’Ð²Ð¾Ð´ ÑÐ¾Ð´ÐµÑ€Ð¶Ð¸Ñ‚ Ð½Ðµ ÑÐ¸Ð¼Ð²Ð¾Ð»ÑŒÐ½ÑƒÑŽ Ð¸Ð½Ñ„Ð¾Ñ€Ð¼Ð°Ñ†Ð¸ÑŽ', 'ru_RU', '260');
INSERT INTO `core_translate_locale` VALUES ('640', 'Ð’Ð²Ð¾Ð´ Ð½Ðµ Ð¿Ñ€Ð¸Ð½Ð°Ð´Ð»ÐµÐ¶Ð¸Ñ‚ Ñ‡Ð¸ÑÐ»Ñƒ Ñ Ð¿Ð»Ð°Ð²Ð°ÑŽÑ‰ÐµÐ¹ Ñ‚Ð¾Ñ‡ÐºÐ¾Ð¹', 'ru_RU', '261');
INSERT INTO `core_translate_locale` VALUES ('641', 'ÐÐµÐ²ÐµÑ€Ð½Ñ‹Ð¹ Ñ‚Ð¸Ð¿ Ð´Ð°Ð½Ð½Ñ‹Ñ…, Ð¾Ð¶Ð¸Ð´Ð°ÐµÑ‚ÑÑ ÑÑ‚Ñ€Ð¾ÐºÐ° Ð¸Ð»Ð¸ Ñ†ÐµÐ»Ð¾Ðµ Ñ‡Ð¸ÑÐ»Ð¾', 'ru_RU', '262');
INSERT INTO `core_translate_locale` VALUES ('642', 'Ð’Ð²Ð¾Ð´ Ð½Ðµ Ð¿Ñ€Ð¸Ð½Ð°Ð´Ð»ÐµÐ¶Ð¸Ñ‚ Ñ†ÐµÐ»Ð¾Ð¼Ñƒ Ñ‡Ð¸ÑÐ»Ñƒ', 'ru_RU', '263');
INSERT INTO `core_translate_locale` VALUES ('643', 'Ð’Ð²Ð¾Ð´ ÑÐ¾Ð´ÐµÑ€Ð¶Ð¸Ñ‚ Ð½Ðµ Ð¿Ð¾Ñ‡Ñ‚Ð¾Ð²Ñ‹Ð¹ Ð°Ð´Ñ€ÐµÑ', 'ru_RU', '264');
INSERT INTO `core_translate_locale` VALUES ('644', 'Ð’Ñ‹Ð·Ð²Ð°Ð½Ð¾ Ð¸ÑÐºÐ»ÑŽÑ‡ÐµÐ½Ð¸Ðµ Ð¿Ñ€Ð¸ Ð¿Ñ€Ð¾Ð²ÐµÑ€ÐºÐµ Ð²Ð²ÐµÐ´ÐµÐ½Ð½Ñ‹Ñ… Ð´Ð°Ð½Ð½Ñ‹Ñ…', 'ru_RU', '265');
INSERT INTO `core_translate_locale` VALUES ('645', 'ÐžÑˆÐ¸Ð±ÐºÐ° Ð¿Ñ€Ð¾Ð²ÐµÑ€ÐºÐ¸ ÐºÐ¾Ð½Ñ‚Ñ€Ð¾Ð»ÑŒÐ½Ð¾Ð¹ ÑÑƒÐ¼Ð¼Ñ‹', 'ru_RU', '266');
INSERT INTO `core_translate_locale` VALUES ('646', 'Ð’Ð²Ð¾Ð´ ÑÐ¾Ð´ÐµÑ€Ð¶Ð¸Ñ‚ Ð½ÐµÐ²ÐµÑ€Ð½Ñ‹Ðµ ÑÐ¸Ð¼Ð²Ð¾Ð»Ñ‹', 'ru_RU', '267');
INSERT INTO `core_translate_locale` VALUES ('647', 'Ð”Ð»Ð¸Ð½Ð½Ð° ÑÑ‚Ñ€Ð¾ÐºÐ¸ Ð´Ð¾Ð»Ð¶Ð½Ð° Ð±Ñ‹Ñ‚ÑŒ %length% ÑÐ¸Ð¼Ð²Ð¾Ð»Ð¾Ð²', 'ru_RU', '268');
INSERT INTO `core_translate_locale` VALUES ('648', 'Ð’Ð²Ð¾Ð´ Ð½Ðµ Ð²Ñ…Ð¾Ð´Ð¸Ñ‚ Ð´Ð¸Ð°Ð¿Ð°Ð·Ð¾Ð½ Ð¾Ñ‚ \'%min%\' Ð´Ð¾ \'%max%\'', 'ru_RU', '269');
INSERT INTO `core_translate_locale` VALUES ('649', 'Ð’Ð²Ð¾Ð´ Ð´Ð¾Ð»Ð¶ÐµÐ½ Ð±Ñ‹Ñ‚ÑŒ ÑÑ‚Ñ€Ð¾Ð³Ð¾ Ð² Ð´Ð¸Ð°Ð¿Ð°Ð·Ð¾Ð½Ðµ Ð¾Ñ‚ \'%min%\' Ð´Ð¾ \'%max%\'', 'ru_RU', '270');
INSERT INTO `core_translate_locale` VALUES ('650', 'ÐÐµ Ð²ÐµÑ€Ð½Ð¾Ðµ Ð·Ð½Ð°Ñ‡ÐµÐ½Ð¸Ðµ Ð²Ð²Ð¾Ð´Ð°', 'ru_RU', '271');
INSERT INTO `core_translate_locale` VALUES ('651', 'Ð’Ñ‹Ð·Ð²Ð°Ð½Ð¾ Ð¸ÑÐºÐ»ÑŽÑ‡ÐµÐ½Ð¸Ðµ Ð² Ñ„ÑƒÐ½ÐºÑ†Ð¸Ð¸ Ð¾Ð±Ñ€Ð°Ñ‚Ð½Ð¾Ð³Ð¾ Ð²Ñ‹Ð·Ð¾Ð²Ð°', 'ru_RU', '272');
INSERT INTO `core_translate_locale` VALUES ('652', 'Ð’Ð²Ð¾Ð´ Ð½Ð°Ð²ÐµÑ€Ð½Ð¾Ðµ ÑÐ¾Ð´ÐµÑ€Ð¶Ð¸Ñ‚ Ð½Ðµ Ð²ÐµÑ€Ð½Ð¾Ðµ Ð·Ð½Ð°Ñ‡ÐµÐ½Ð¸Ðµ ÐºÐ¾Ð½Ñ‚Ñ€Ð¾Ð»ÑŒÐ½Ð¾Ð¹ ÑÑƒÐ¼Ð¼Ñ‹', 'ru_RU', '273');
INSERT INTO `core_translate_locale` VALUES ('653', 'Ð’Ð²Ð¾Ð´ Ð´Ð¾Ð»Ð¶ÐµÐ½ ÑÐ¾Ð´ÐµÑ€Ð¶Ð°Ñ‚ÑŒ Ñ‚Ð¾Ð»ÑŒÐºÐ¾ Ñ†Ð¸Ñ„Ñ€Ñ‹', 'ru_RU', '274');
INSERT INTO `core_translate_locale` VALUES ('654', 'Ð’Ð²Ð¾Ð´ ÑÐ¾Ð´ÐµÑ€Ð¶Ð¸Ñ‚ Ð½ÐµÐ´Ð¾Ð¿ÑƒÑÑ‚Ð¸Ð¼Ð¾Ðµ ÐºÐ¾Ð»Ð¸Ñ‡ÐµÑÑ‚Ð²Ð¾ Ñ†Ð¸Ñ„Ñ€', 'ru_RU', '275');
INSERT INTO `core_translate_locale` VALUES ('655', 'Ð’Ð²Ð¾Ð´ ÑÐ¾Ð´ÐµÑ€Ð¶Ð¸Ñ‚ Ð½ÐµÐ´Ð¾Ð¿ÑƒÑÑ‚Ð¸Ð¼Ð¾Ðµ Ð²Ñ‹Ñ€Ð°Ð¶ÐµÐ½Ð¸Ðµ', 'ru_RU', '276');
INSERT INTO `core_translate_locale` VALUES ('656', 'Ð’Ð²Ð¾Ð´ ÑÐ¾Ð´ÐµÑ€Ð¶Ð¸Ñ‚ Ð½Ðµ Ð²ÐµÑ€Ð½Ñ‹Ð¹ Ð½Ð¾Ð¼ÐµÑ€ ÐºÑ€ÐµÐ´Ð¸Ñ‚Ð½Ð¾Ð¹ ÐºÐ°Ñ€Ñ‚Ñ‹', 'ru_RU', '277');
INSERT INTO `core_translate_locale` VALUES ('657', 'Ð¤Ð¾Ñ€Ð¼Ð° Ð¿Ð¾Ð´Ñ‚Ð²ÐµÑ€Ð¶Ð´ÐµÐ½Ð¸Ñ Ð½Ðµ Ð¿Ñ€ÐµÐ½Ð°Ð´Ð»ÐµÐ¶Ð¸Ñ‚ Ð¾Ð¶Ð¸Ð´Ð°ÐµÐ¼Ð¾Ð¼Ñƒ ÑÐ°Ð¹Ñ‚Ñƒ', 'ru_RU', '278');
INSERT INTO `core_translate_locale` VALUES ('658', 'ÐÐµÐ²ÐµÑ€Ð½Ñ‹Ð¹ Ñ‚Ð¸Ð¿. ÐžÐ¶Ð¸Ð´Ð°ÐµÑ‚ÑÑ ÑÑ‚Ñ€Ð¾ÐºÐ°, Ñ†ÐµÐ»Ð¾Ðµ Ñ‡Ð¸ÑÐ»Ð¾ Ð¸Ð»Ð¸ Ð´Ð°Ñ‚Ð° Ð¸ Ð²Ñ€ÐµÐ¼Ñ', 'ru_RU', '279');
INSERT INTO `core_translate_locale` VALUES ('659', 'Ð’Ð²Ð¾Ð´ ÑÐ¾Ð´ÐµÑ€Ð¶Ð¸Ñ‚ Ð½ÐµÐ²ÐµÑ€Ð½Ð¾Ðµ Ð·Ð½Ð°Ñ‡ÐµÐ½Ð¸Ðµ Ð´Ð°Ñ‚Ñ‹', 'ru_RU', '280');
INSERT INTO `core_translate_locale` VALUES ('660', 'ÐÐµ ÑÐ¾Ð¾Ñ‚Ð²ÐµÑ‚ÑÑ‚Ð²ÑƒÐµÑ‚ Ñ„Ð¾Ñ€Ð¼Ð°Ñ‚Ñƒ \'%format%\'', 'ru_RU', '281');
INSERT INTO `core_translate_locale` VALUES ('661', 'ÐÐµÐ²ÐµÑ€Ð½Ð¾Ðµ Ð·Ð½Ð°Ñ‡ÐµÐ½Ð¸Ðµ Ð¿ÐµÑ€Ð¸Ð¾Ð´Ð°', 'ru_RU', '282');
INSERT INTO `core_translate_locale` VALUES ('662', 'ÐÐµ Ð½Ð°Ð¹Ð´ÐµÐ½Ð¾ Ð½Ð¸ Ð¾Ð´Ð½Ð¾Ð¹ ÑÐ¾Ð¾Ñ‚Ð²ÐµÑ‚ÑÑ‚Ð²ÑƒÑŽÑ‰ÐµÐ¹ Ð·Ð°Ð¿Ð¸ÑÐ¸', 'ru_RU', '283');
INSERT INTO `core_translate_locale` VALUES ('663', 'Ð¡Ð¾Ð¾Ñ‚Ð²ÐµÑ‚ÑÐ²Ð¸Ðµ Ð·Ð°Ð¿Ð¸ÑÐ¸ Ð½Ð°Ð¹Ð´ÐµÐ½Ð¾', 'ru_RU', '284');
INSERT INTO `core_translate_locale` VALUES ('664', 'ÐÐµÐ²ÐµÑ€Ð½Ð¾Ðµ Ð·Ð½Ð°Ñ‡ÐµÐ½Ð¸Ðµ Ð°Ð´Ñ€ÐµÑÐ° email. Ð˜ÑÐ¿Ð¾Ð»ÑŒÐ·ÑƒÐ¹Ñ‚Ðµ Ñ„Ð¾Ñ€Ð¼Ð°Ñ‚: local-part@hostname', 'ru_RU', '285');
INSERT INTO `core_translate_locale` VALUES ('665', 'ÐÐµÐ²ÐµÑ€Ð½Ð¾Ðµ Ð·Ð½Ð°Ñ‡ÐµÐ½Ð¸Ðµ Ñ…Ð¾ÑÑ‚Ð° \'%hostname%\' Ð´Ð»Ñ Ð°Ð´Ñ€ÐµÑÐ° email', 'ru_RU', '286');
INSERT INTO `core_translate_locale` VALUES ('666', '\'%hostname%\' - ÐÐµÐ²ÐµÑ€Ð½Ð¾Ðµ Ð·Ð½Ð°Ñ‡ÐµÐ½Ð¸Ðµ MX Ð¸Ð»Ð¸ Ð·Ð°Ð¿Ð¸ÑÐ¸ A Ð´Ð»Ñ Ð°Ð´Ñ€ÐµÑÐ° email', 'ru_RU', '287');
INSERT INTO `core_translate_locale` VALUES ('667', '\'%hostname%\' - ÐÐ´Ñ€ÐµÑ Ð½Ðµ Ð½Ð°Ð¹Ð´ÐµÐ½ Ð² Ð¼Ð°Ñ€ÑˆÑ€ÑƒÑ‚Ð°Ñ… ÑÐµÐ³Ð¼ÐµÐ½Ñ‚Ð° ÑÐµÑ‚Ð¸. ÐÐµÐ²Ð¾Ð·Ð¼Ð¾Ð¶Ð½Ð¾ Ð¾Ð¿Ñ€ÐµÐ´ÐµÐ»Ð¸Ñ‚ÑŒ email Ð°Ð´Ñ€ÐµÑ Ð² ÑÐµÑ‚Ð¸ Ð¿ÑƒÐ±Ð»Ð¸Ñ‡Ð½Ð¾Ð³Ð¾ Ð´Ð¾ÑÑ‚ÑƒÐ¿Ð°.', 'ru_RU', '288');
INSERT INTO `core_translate_locale` VALUES ('668', '\'%localPart%\' Ð½Ðµ ÑÐ¾Ð¾Ñ‚Ð²ÐµÑ‚ÑÑ‚Ð²ÑƒÐµÑ‚ dot-atom Ñ„Ð¾Ñ€Ð¼Ð°Ñ‚Ñƒ', 'ru_RU', '289');
INSERT INTO `core_translate_locale` VALUES ('669', '\'%localPart%\' ÑÑ‚Ñ€Ð¾ÐºÐ° Ð½Ðµ ÑÐ¾Ð¾Ñ‚Ð²ÐµÑ‚ÑÑ‚Ð²ÑƒÐµÑ‚ Ñ„Ð¾Ñ€Ð¼Ð°Ñ‚Ñƒ ÐºÐ°Ð²Ñ‹Ñ‡ÐµÐº', 'ru_RU', '290');
INSERT INTO `core_translate_locale` VALUES ('670', '\'%localPart%\' Ð½Ðµ ÑÐ¾Ð¾Ñ‚Ð²ÐµÑ‚ÑÑ‚Ð²ÑƒÐµÑ‚ local Ñ„Ð¾Ñ€Ð¼Ð°Ñ‚Ñƒ Ð² Ð°Ð´Ñ€ÐµÑÐµ email', 'ru_RU', '291');
INSERT INTO `core_translate_locale` VALUES ('671', 'ÐŸÑ€ÐµÐ²Ñ‹ÑˆÐµÐ½Ð¸Ðµ Ð´Ð¾Ð¿ÑƒÑÑ‚Ð¸Ð¼Ð¾Ð¹ Ð´Ð»Ð¸Ð½Ñ‹', 'ru_RU', '292');
INSERT INTO `core_translate_locale` VALUES ('672', 'Ð¡Ð»Ð¸ÑˆÐºÐ¾Ð¼ Ð¼Ð½Ð¾Ð³Ð¾ Ñ„Ð°Ð¹Ð»Ð¾Ð². ÐœÐ°ÐºÑÐ¸Ð¼Ð°Ð»ÑŒÐ½Ð¾ Ð´Ð¾Ð¿ÑƒÑÑ‚Ð¸Ð¼Ð¾Ðµ  ÐºÐ¾Ð»Ð¸Ñ‡ÐµÑÑ‚Ð²Ð¾ \'%max%\', Ð¾Ð¿Ñ€ÐµÐ´ÐµÐ»ÐµÐ½Ð¾ ÐºÐ¾Ð»Ð¸Ñ‡ÐµÑÑ‚Ð²Ð¾ \'%count%\'', 'ru_RU', '293');
INSERT INTO `core_translate_locale` VALUES ('673', 'Ð¡Ð»Ð¸ÑˆÐºÐ¾Ð¼ Ð¼Ð°Ð»Ð¾ Ñ„Ð°Ð¹Ð»Ð¾Ð². ÐœÐ¸Ð½Ð¸Ð¼Ð°Ð»ÑŒÐ½Ð¾ Ð´Ð¾Ð¿ÑƒÑÑ‚Ð¸Ð¼Ð¾Ðµ ÐºÐ¾Ð»Ð¸Ñ‡ÐµÑÑ‚Ð²Ð¾ \'%min%\', Ð¾Ð¿Ñ€ÐµÐ´ÐµÐ»ÐµÐ½Ð¾ ÐºÐ¾Ð»Ð¸Ñ‡ÐµÑÑ‚Ð²Ð¾ \'%count%\'', 'ru_RU', '294');
INSERT INTO `core_translate_locale` VALUES ('674', 'Ð¤Ð°Ð¹Ð»Ð° \'%value%\' Ð½Ðµ ÑÐ¾Ð¾Ñ‚Ð²ÐµÑ‚ÑÑ‚Ð²ÑƒÐµÑ‚ ÐºÐ¾Ð½Ñ‚Ñ€Ð¾Ð»ÑŒÐ½Ð¾Ð¹ ÑÑƒÐ¼Ð¼Ðµ CRC32', 'ru_RU', '295');
INSERT INTO `core_translate_locale` VALUES ('675', 'ÐšÐ¾Ð½Ñ‚Ñ€Ð¾Ð»ÑŒÐ½Ð°Ñ ÑÑƒÐ¼Ð¼Ð° CRC32 Ð½Ðµ Ð¼Ð¾Ð¶ÐµÑ‚ Ð±Ñ‹Ñ‚ÑŒ Ð²Ñ‹Ñ‡ÐµÑÐ»ÐµÐ½Ð° Ð´Ð»Ñ Ð´Ð°Ð½Ð½Ð¾Ð³Ð¾ Ñ„Ð°Ð¹Ð»Ð°', 'ru_RU', '296');
INSERT INTO `core_translate_locale` VALUES ('676', 'Ð¤Ð°Ð¹Ð» \'%value%\' Ð½ÐµÐ´Ð¾ÑÑ‚ÑƒÐ¿ÐµÐ½ Ð´Ð»Ñ Ñ‡Ñ‚ÐµÐ½Ð¸Ñ Ð¸Ð»Ð¸ Ð½Ðµ ÑÑƒÑ‰ÐµÑÑ‚Ð²ÑƒÐµÑ‚', 'ru_RU', '297');
INSERT INTO `core_translate_locale` VALUES ('677', 'Ð¤Ð°Ð¹Ð» \'%value%\' Ð¸Ð¼ÐµÐµÑ‚ Ð½ÐµÐ²ÐµÑ€Ð½Ð¾Ðµ Ñ€Ð°ÑÑˆÐ¸Ñ€ÐµÐ½Ð¸Ðµ', 'ru_RU', '298');
INSERT INTO `core_translate_locale` VALUES ('678', 'Ð¤Ð°Ð¹Ð» \'%value%\' Ð½Ðµ ÑÑƒÑ‰ÐµÑÑ‚Ð²ÑƒÐµÑ‚', 'ru_RU', '299');
INSERT INTO `core_translate_locale` VALUES ('679', 'Ð’ÑÐµ Ñ„Ð°Ð¹Ð»Ñ‹ Ð² ÑÑƒÐ¼Ð¼Ðµ Ð´Ð¾Ð»Ð¶Ð½Ñ‹ Ð¸Ð¼ÐµÑ‚ÑŒ Ð¼Ð°ÐºÑÐ¸Ð¼Ð°Ð»ÑŒÐ½Ñ‹Ð¹ Ñ€Ð°Ð·Ð¼ÐµÑ€ \'%max%\', Ð¾Ð¿Ñ€ÐµÐ´ÐµÐ»ÐµÐ½ Ñ€Ð°Ð·Ð¼ÐµÑ€ \'%size%\'', 'ru_RU', '300');
INSERT INTO `core_translate_locale` VALUES ('680', 'Ð’ÑÐµ Ñ„Ð°Ð¹Ð»Ñ‹ Ð² ÑÑƒÐ¼Ð¼Ðµ Ð´Ð¾Ð»Ð¶Ð½Ñ‹ Ð¸Ð¼ÐµÑ‚ÑŒ Ð¼Ð¸Ð½Ð¸Ð¼Ð°Ð»ÑŒÐ½Ñ‹Ð¹ Ñ€Ð°Ð·Ð¼ÐµÑ€ \'%min%\', Ð¾Ð¿Ñ€ÐµÐ´ÐµÐ»ÐµÐ½ Ñ€Ð°Ð·Ð¼ÐµÑ€ \'%size%\'', 'ru_RU', '301');
INSERT INTO `core_translate_locale` VALUES ('681', 'ÐžÐ´Ð¸Ð½ Ð¸Ð»Ð¸ Ð±Ð¾Ð»ÐµÐµ Ñ„Ð°Ð¹Ð»Ð¾Ð² Ð½Ðµ Ð¼Ð¾Ð³ÑƒÑ‚ Ð±Ñ‹Ñ‚ÑŒ Ð¿Ñ€Ð¾Ñ‡Ð¸Ñ‚Ð°Ð½Ñ‹', 'ru_RU', '302');
INSERT INTO `core_translate_locale` VALUES ('682', 'Ð¤Ð°Ð¹Ð» \'%value%\' Ð½Ðµ ÑÐ¾Ð¾Ñ‚Ð²ÐµÑ‚ÑÑ‚Ð²ÑƒÐµÑ‚ ÐºÐ¾Ð½Ñ‚Ñ€Ð¾Ð»ÑŒÐ½Ð¾Ð¹ ÑÑƒÐ¼Ð¼Ðµ', 'ru_RU', '303');
INSERT INTO `core_translate_locale` VALUES ('683', 'ÐšÐ¾Ð½Ñ‚Ñ€Ð¾Ð»ÑŒÐ½Ð°Ñ ÑÑƒÐ¼Ð¼Ð° Ð½Ðµ Ð¼Ð¾Ð¶ÐµÑ‚ Ð±Ñ‹Ñ‚ÑŒ Ð²Ñ‹Ñ‡ÐµÑÐ»ÐµÐ½Ð° Ð´Ð»Ñ Ð´Ð°Ð½Ð½Ð¾Ð³Ð¾ Ñ„Ð°Ð¹Ð»Ð°', 'ru_RU', '304');
INSERT INTO `core_translate_locale` VALUES ('684', 'ÐœÐ°ÐºÑÐ¸Ð¼Ð°Ð»ÑŒÐ½Ð¾ Ð´Ð¾Ð¿ÑƒÑÑ‚Ð¸Ð¼Ð°Ñ ÑˆÐ¸Ñ€Ð¸Ð½Ð° Ð¸Ð·Ð¾Ð±Ñ€Ð°Ð¶ÐµÐ½Ð¸Ñ Ð´Ð»Ñ \'%value%\' Ð½Ðµ Ð´Ð¾Ð»Ð¶Ð½Ð° Ð¿Ñ€ÐµÐ²Ñ‹ÑˆÐ°Ñ‚ÑŒ \'%maxwidth%\', Ð¾Ð¿Ñ€ÐµÐ´ÐµÐ»ÐµÐ½Ð¾\'%width%\'', 'ru_RU', '305');
INSERT INTO `core_translate_locale` VALUES ('685', 'ÐœÐ¸Ð½Ð¸Ð¼Ð°Ð»ÑŒÐ½Ð¾ Ð´Ð¾Ð¿ÑƒÑÑ‚Ð¸Ð¼Ð°Ñ ÑˆÐ¸Ñ€Ð¸Ð½Ð° Ð¸Ð·Ð¾Ð±Ñ€Ð°Ð¶ÐµÐ½Ð¸Ñ Ð´Ð»Ñ \'%value%\' Ð½Ðµ Ð´Ð¾Ð»Ð¶Ð½Ð° Ð±Ñ‹Ñ‚ÑŒ Ð¼ÐµÐ½ÑŒÑˆÐµ \'%minwidth%\', Ð¾Ð¿Ñ€ÐµÐ´ÐµÐ»ÐµÐ½Ð¾ \'%width%\'', 'ru_RU', '306');
INSERT INTO `core_translate_locale` VALUES ('686', 'ÐœÐ°ÐºÑÐ¸Ð¼Ð°Ð»ÑŒÐ½Ð¾ Ð´Ð¾Ð¿ÑƒÑÑ‚Ð¸Ð¼Ð°Ñ Ð²Ñ‹ÑÐ¾Ñ‚Ð° Ð¸Ð·Ð¾Ð±Ñ€Ð°Ð¶ÐµÐ½Ð¸Ñ Ð´Ð»Ñ \'%value%\' Ð½Ðµ Ð´Ð¾Ð»Ð¶Ð½Ð° Ð¿Ñ€ÐµÐ²Ñ‹ÑˆÐ°Ñ‚ÑŒ \'%maxheight%\', Ð¾Ð¿Ñ€ÐµÐ´ÐµÐ»ÐµÐ½Ð¾ \'%height%\'', 'ru_RU', '307');
INSERT INTO `core_translate_locale` VALUES ('687', 'ÐœÐ¸Ð½Ð¸Ð¼Ð°Ð»ÑŒÐ½Ð¾ Ð´Ð¾Ð¿ÑƒÑÑ‚Ð¸Ð¼Ð°Ñ Ð²Ñ‹ÑÐ¾Ñ‚Ð° Ð¸Ð·Ð¾Ð±Ñ€Ð°Ð¶ÐµÐ½Ð¸Ñ Ð´Ð»Ñ \'%value%\' Ð½Ðµ Ð´Ð¾Ð»Ð¶Ð½Ð° Ð±Ñ‹Ñ‚ÑŒ Ð¼ÐµÐ½ÑŒÑˆÐµ \'%minheight%\', Ð¾Ð¿Ñ€ÐµÐ´ÐµÐ»ÐµÐ½Ð¾ \'%height%\'', 'ru_RU', '308');
INSERT INTO `core_translate_locale` VALUES ('688', 'ÐÐµ Ð²Ð¾Ð·Ð¼Ð¾Ð¶Ð½Ð¾ Ð¾Ð¿Ñ€ÐµÐ´ÐµÐ»Ð¸Ñ‚ÑŒ Ñ€Ð°Ð·Ð¼ÐµÑ€ Ð¸Ð·Ð¾Ð±Ñ€Ð°Ð¶ÐµÐ½Ð¸Ñ \'%value%\'', 'ru_RU', '309');
INSERT INTO `core_translate_locale` VALUES ('689', 'Ð¤Ð°Ð¹Ð» \'%value%\' Ð½Ðµ ÑÐ¶Ð°Ñ‚, Ð¾Ð¿Ñ€ÐµÐ´ÐµÐ»ÐµÐ½Ð¾ \'%type%\'', 'ru_RU', '310');
INSERT INTO `core_translate_locale` VALUES ('690', 'Ð¢Ð¸Ð¿ MIME Ñ„Ð°Ð¹Ð»Ð° \'%value%\' Ð½Ðµ Ð¼Ð¾Ð¶ÐµÑ‚ Ð±Ñ‹Ñ‚ÑŒ Ð¾Ð¿Ñ€ÐµÐ´ÐµÐ»ÐµÐ½', 'ru_RU', '311');
INSERT INTO `core_translate_locale` VALUES ('691', 'Ð¤Ð°Ð¹Ð» \'%value%\' Ð½Ðµ ÑÐ²Ð»ÑÐµÑ‚ÑÑ Ð¸Ð·Ð¾Ð±Ñ€Ð°Ð¶ÐµÐ½Ð¸ÐµÐ¼, Ð¾Ð¿Ñ€ÐµÐ´ÐµÐ»ÐµÐ½Ð¾ \'%type%\'', 'ru_RU', '312');
INSERT INTO `core_translate_locale` VALUES ('692', 'Ð¤Ð°Ð¹Ð»Ð° \'%value%\' Ð½Ðµ ÑÐ¾Ð¾Ñ‚Ð²ÐµÑ‚ÑÑ‚Ð²ÑƒÐµÑ‚ ÐºÐ¾Ð½Ñ‚Ñ€Ð¾Ð»ÑŒÐ½Ð¾Ð¹ ÑÑƒÐ¼Ð¼Ðµ MD5', 'ru_RU', '313');
INSERT INTO `core_translate_locale` VALUES ('693', 'ÐšÐ¾Ð½Ñ‚Ñ€Ð¾Ð»ÑŒÐ½Ð°Ñ ÑÑƒÐ¼Ð¼Ð° MD5 Ð½Ðµ Ð¼Ð¾Ð¶ÐµÑ‚ Ð±Ñ‹Ñ‚ÑŒ Ð²Ñ‹Ñ‡ÐµÑÐ»ÐµÐ½Ð° Ð´Ð»Ñ Ð´Ð°Ð½Ð½Ð¾Ð³Ð¾ Ñ„Ð°Ð¹Ð»Ð°', 'ru_RU', '314');
INSERT INTO `core_translate_locale` VALUES ('694', 'Ð¤Ð°Ð¹Ð» \'%value%\' ÐÐµÐ²ÐµÑ€Ð½Ñ‹Ð¹ Ñ‚Ð¸Ð¿ MIME \'%type%\'', 'ru_RU', '315');
INSERT INTO `core_translate_locale` VALUES ('695', 'Ð¤Ð°Ð¹Ð» \'%value%\' ÑÑƒÑ‰ÐµÑÑ‚Ð²ÑƒÐµÑ‚.', 'ru_RU', '316');
INSERT INTO `core_translate_locale` VALUES ('696', 'Ð¤Ð°Ð¹Ð» \'%value%\' Ð½Ðµ ÑÐ¾Ð¾Ñ‚Ð²ÐµÑ‚ÑÑ‚Ð²ÑƒÐµÑ‚ ÐºÐ¾Ð½Ñ‚Ñ€Ð¾Ð»ÑŒÐ½Ð¾Ð¹ ÑÑƒÐ¼Ð¼Ðµ SHA1', 'ru_RU', '317');
INSERT INTO `core_translate_locale` VALUES ('697', 'ÐšÐ¾Ð½Ñ‚Ñ€Ð¾Ð»ÑŒÐ½Ð°Ñ ÑÑƒÐ¼Ð¼Ð° SHA1 Ð½Ðµ Ð¼Ð¾Ð¶ÐµÑ‚ Ð±Ñ‹Ñ‚ÑŒ Ð²Ñ‹Ñ‡ÐµÑÐ»ÐµÐ½Ð° Ð´Ð»Ñ Ð´Ð°Ð½Ð½Ð¾Ð³Ð¾ Ñ„Ð°Ð¹Ð»Ð°', 'ru_RU', '318');
INSERT INTO `core_translate_locale` VALUES ('698', 'ÐœÐ°ÐºÑÐ¸Ð¼Ð°Ð»ÑŒÐ½Ð¾ Ð´Ð¾Ð¿ÑƒÑÑ‚Ð¸Ð¼Ñ‹Ð¹ Ñ€Ð°Ð·Ð¼ÐµÑ€ Ñ„Ð°Ð¹Ð»Ð° \'%value%\' Ð½Ðµ Ð´Ð¾Ð»Ð¶ÐµÐ½ Ð¿Ñ€ÐµÐ²Ñ‹ÑˆÐ°Ñ‚ÑŒ \'%max%\', Ð¾Ð¿Ñ€ÐµÐ´ÐµÐ»ÐµÐ½Ð¾ \'%size%\'', 'ru_RU', '319');
INSERT INTO `core_translate_locale` VALUES ('699', 'ÐœÐ¸Ð½Ð¸Ð¼Ð°Ð»ÑŒÐ½Ð¾ Ð´Ð¾Ð¿ÑƒÑÑ‚Ð¸Ð¼Ñ‹Ð¹ Ñ€Ð°Ð·Ð¼ÐµÑ€ Ñ„Ð°Ð¹Ð»Ð° \'%value%\' Ð½Ðµ Ð´Ð¾Ð»Ð¶ÐµÐ½ Ð±Ñ‹Ñ‚ÑŒ Ð¼ÐµÐ½ÑŒÑˆÐµ \'%min%\', Ð¾Ð¿Ñ€ÐµÐ´ÐµÐ»ÐµÐ½Ð¾ \'%size%\'', 'ru_RU', '320');
INSERT INTO `core_translate_locale` VALUES ('700', 'Ð¤Ð°Ð¹Ð» \'%value%\' Ð¿Ñ€ÐµÐ²Ñ‹ÑˆÐ°ÐµÑ‚ Ð¾Ð¿Ñ€ÐµÐ´ÐµÐ»ÐµÐ½Ð½Ñ‹Ð¹ Ñ€Ð°Ð·Ð¼ÐµÑ€ INI Ð½Ð°ÑÑ‚Ñ€Ð¾Ð¹ÐºÐ¸', 'ru_RU', '321');
INSERT INTO `core_translate_locale` VALUES ('701', 'Ð¤Ð°Ð¹Ð» \'%value%\' Ð¿Ñ€ÐµÐ²Ñ‹ÑˆÐ°ÐµÑ‚ Ð¾Ð¿Ñ€ÐµÐ´ÐµÐ»ÐµÐ½Ð½Ñ‹Ð¹ Ñ€Ð°Ð·Ð¼ÐµÑ€ form Ð½Ð°ÑÑ‚Ñ€Ð¾Ð¹ÐºÐ¸', 'ru_RU', '322');
INSERT INTO `core_translate_locale` VALUES ('702', 'Ð¤Ð°Ð¹Ð» \'%value%\' Ñ‚Ð¾Ð»ÑŒÐºÐ¾ Ñ‡Ð°ÑÑ‚Ð¸Ñ‡Ð½Ð°Ñ Ð·Ð°Ð³Ñ€ÑƒÐ·ÐºÐ°', 'ru_RU', '323');
INSERT INTO `core_translate_locale` VALUES ('703', 'Ð¤Ð°Ð¹Ð» \'%value%\' Ð½Ðµ Ð¼Ð¾Ð¶ÐµÑ‚ Ð±Ñ‹Ñ‚ÑŒ Ð·Ð°Ð³Ñ€ÑƒÐ¶ÐµÐ½', 'ru_RU', '324');
INSERT INTO `core_translate_locale` VALUES ('704', 'Ð’Ñ€ÐµÐ¼ÐµÐ½Ð½Ð°Ñ Ð´Ð¸Ñ€ÐµÐºÑ‚Ð¾Ñ€Ð¸Ñ Ð´Ð»Ñ Ñ„Ð°Ð¹Ð»Ð° \'%value%\' Ð½Ðµ Ð½Ð°Ð¹Ð´ÐµÐ½Ð°', 'ru_RU', '325');
INSERT INTO `core_translate_locale` VALUES ('705', 'Ð¤Ð°Ð¹Ð» \'%value%\' Ð½Ðµ Ð¼Ð¾Ð¶ÐµÑ‚ Ð±Ñ‹Ñ‚ÑŒ Ð·Ð°Ð¿Ð¸ÑÐ°Ð½', 'ru_RU', '326');
INSERT INTO `core_translate_locale` VALUES ('706', 'Ð Ð°ÑÑˆÐ¸Ñ€ÐµÐ½Ð¸Ðµ PHP Ð²ÐµÑ€Ð½ÑƒÐ»Ð¾ Ð¾ÑˆÐ¸Ð±ÐºÑƒ Ð¿Ñ€Ð¸ Ð·Ð°Ð³Ñ€ÑƒÐ·ÐºÐµ Ñ„Ð°Ð¹Ð»Ð° \'%value%\'', 'ru_RU', '327');
INSERT INTO `core_translate_locale` VALUES ('707', 'Ð¤Ð°Ð¹Ð» \'%value%\' Ð±Ñ‹Ð» Ð·Ð°Ð³Ñ€ÑƒÐ¶ÐµÐ½ Ð½ÐµÐ»ÐµÐ³Ð°Ð»ÑŒÐ½Ð¾. Ð’Ð¾Ð·Ð¼Ð¾Ð¶Ð½Ð¾ ÑÑ‚Ð¾ Ð°Ñ‚Ð°ÐºÐ°', 'ru_RU', '328');
INSERT INTO `core_translate_locale` VALUES ('708', 'Ð¤Ð°Ð¹Ð» \'%value%\' Ð½Ðµ Ð½Ð°Ð¹Ð´ÐµÐ½', 'ru_RU', '329');
INSERT INTO `core_translate_locale` VALUES ('709', 'ÐÐµÐ¸Ð·Ð²ÐµÑÑ‚Ð½Ð°Ñ Ð¾ÑˆÐ¸Ð±ÐºÐ° Ð¿Ñ€Ð¸ Ð·Ð°Ð³Ñ€ÑƒÐ·ÐºÐµ Ñ„Ð°Ð¹Ð»Ð° \'%value%\'', 'ru_RU', '330');
INSERT INTO `core_translate_locale` VALUES ('710', 'Ð¤Ð°Ð¹Ð» \'%value%\' Ð¿Ñ€ÐµÐ²Ñ‹ÑˆÐ°ÐµÑ‚ Ð¾Ð¿Ñ€ÐµÐ´ÐµÐ»ÐµÐ½Ð½Ñ‹Ð¹ Ñ€Ð°Ð·Ð¼ÐµÑ€ INI Ð½Ð°ÑÑ‚Ñ€Ð¾Ð¹ÐºÐ¸', 'ru_RU', '331');
INSERT INTO `core_translate_locale` VALUES ('711', 'Ð¤Ð°Ð¹Ð» \'%value%\' Ð¿Ñ€ÐµÐ²Ñ‹ÑˆÐ°ÐµÑ‚ Ð¾Ð¿Ñ€ÐµÐ´ÐµÐ»ÐµÐ½Ð½Ñ‹Ð¹ Ñ€Ð°Ð·Ð¼ÐµÑ€ form Ð½Ð°ÑÑ‚Ñ€Ð¾Ð¹ÐºÐ¸', 'ru_RU', '332');
INSERT INTO `core_translate_locale` VALUES ('712', 'Ð¤Ð°Ð¹Ð» Ñ‚Ð¾Ð»ÑŒÐºÐ¾ Ñ‡Ð°ÑÑ‚Ð¸Ñ‡Ð½Ð°Ñ Ð·Ð°Ð³Ñ€ÑƒÐ·ÐºÐ°', 'ru_RU', '333');
INSERT INTO `core_translate_locale` VALUES ('713', 'Ð¤Ð°Ð¹Ð» Ð½Ðµ Ð¼Ð¾Ð¶ÐµÑ‚ Ð±Ñ‹Ñ‚ÑŒ Ð·Ð°Ð³Ñ€ÑƒÐ¶ÐµÐ½', 'ru_RU', '334');
INSERT INTO `core_translate_locale` VALUES ('714', 'Ð’Ñ€ÐµÐ¼ÐµÐ½Ð½Ð°Ñ Ð´Ð¸Ñ€ÐµÐºÑ‚Ð¾Ñ€Ð¸Ñ Ð´Ð»Ñ Ñ„Ð°Ð¹Ð»Ð° Ð½Ðµ Ð½Ð°Ð¹Ð´ÐµÐ½Ð°', 'ru_RU', '335');
INSERT INTO `core_translate_locale` VALUES ('715', 'Ð¤Ð°Ð¹Ð» Ð½Ðµ Ð¼Ð¾Ð¶ÐµÑ‚ Ð±Ñ‹Ñ‚ÑŒ Ð·Ð°Ð¿Ð¸ÑÐ°Ð½', 'ru_RU', '336');
INSERT INTO `core_translate_locale` VALUES ('716', 'Ð Ð°ÑÑˆÐ¸Ñ€ÐµÐ½Ð¸Ðµ PHP Ð²ÐµÑ€Ð½ÑƒÐ»Ð¾ Ð¾ÑˆÐ¸Ð±ÐºÑƒ Ð¿Ñ€Ð¸ Ð·Ð°Ð³Ñ€ÑƒÐ·ÐºÐµ Ñ„Ð°Ð¹Ð»Ð°', 'ru_RU', '337');
INSERT INTO `core_translate_locale` VALUES ('717', 'Ð¤Ð°Ð¹Ð» Ð±Ñ‹Ð» Ð·Ð°Ð³Ñ€ÑƒÐ¶ÐµÐ½ Ð½ÐµÐ»ÐµÐ³Ð°Ð»ÑŒÐ½Ð¾. Ð’Ð¾Ð·Ð¼Ð¾Ð¶Ð½Ð¾ ÑÑ‚Ð¾ Ð°Ñ‚Ð°ÐºÐ°', 'ru_RU', '338');
INSERT INTO `core_translate_locale` VALUES ('718', 'Ð¤Ð°Ð¹Ð» Ð½Ðµ Ð½Ð°Ð¹Ð´ÐµÐ½', 'ru_RU', '339');
INSERT INTO `core_translate_locale` VALUES ('719', 'ÐÐµÐ¸Ð·Ð²ÐµÑÑ‚Ð½Ð°Ñ Ð¾ÑˆÐ¸Ð±ÐºÐ° Ð¿Ñ€Ð¸ Ð·Ð°Ð³Ñ€ÑƒÐ·ÐºÐµ Ñ„Ð°Ð¹Ð»Ð°', 'ru_RU', '340');
INSERT INTO `core_translate_locale` VALUES ('720', 'Ð¡Ð»Ð¸ÑˆÐºÐ¾Ð¼ Ð¼Ð½Ð¾Ð³Ð¾ ÑÐ»Ð¾Ð², Ð¼Ð°ÐºÑÐ¸Ð¼Ð°Ð»ÑŒÐ½Ð¾ Ð´Ð¾Ð¿ÑƒÑÑ‚Ð¸Ð¼Ð¾Ðµ Ð·Ð½Ð°Ñ‡ÐµÐ½Ð¸Ðµ \'%max%\', Ð¾Ð¿Ñ€ÐµÐ´ÐµÐ»ÐµÐ½Ð¾ \'%count%\'', 'ru_RU', '341');
INSERT INTO `core_translate_locale` VALUES ('721', 'Ð¡Ð»Ð¸ÑˆÐºÐ¾Ð¼ Ð¼Ð°Ð»Ð¾ ÑÐ»Ð¾Ð², Ð¼Ð¸Ð½Ð¸Ð¼Ð°Ð»ÑŒÐ½Ð¾ Ð´Ð¾Ð¿ÑƒÑÑ‚Ð¸Ð¼Ð¾Ðµ Ð·Ð½Ð°Ñ‡ÐµÐ½Ð¸Ðµ\'%min%\', Ð¾Ð¿Ñ€ÐµÐ´ÐµÐ»ÐµÐ½Ð¾ \'%count%\'', 'ru_RU', '342');
INSERT INTO `core_translate_locale` VALUES ('722', 'Ð’ÐµÐ´ÐµÐ½Ð¾ Ð·Ð½Ð°Ñ‡ÐµÐ½Ð¸Ðµ Ð½Ðµ Ð±Ð¾Ð»ÑŒÑˆÐµÐµ Ñ‡ÐµÐ¼ \'%min%\'', 'ru_RU', '343');
INSERT INTO `core_translate_locale` VALUES ('723', 'Ð’Ð²ÐµÐ´ÐµÐ½Ð¾ Ð·Ð½Ð°Ñ‡ÐµÐ½Ð¸Ðµ Ð½Ðµ Ð±Ð¾Ð»ÑŒÑˆÐµÐµ Ð¸Ð»Ð¸ Ñ€Ð°Ð²Ð½Ð¾Ðµ \'%min%\'', 'ru_RU', '344');
INSERT INTO `core_translate_locale` VALUES ('724', 'Ð’Ð²Ð¾Ð´ ÑÐ¾Ð´ÐµÑ€Ð¶Ð¸Ñ‚ Ð½Ðµ ÑˆÐµÑÑ‚Ð½Ð°Ñ†Ð°Ñ‚ÐµÑ€Ð¸Ñ‡Ð½Ð¾Ðµ Ð·Ð½Ð°Ñ‡ÐµÐ½Ð¸Ðµ', 'ru_RU', '345');
INSERT INTO `core_translate_locale` VALUES ('725', 'Ð’Ð²Ð¾Ð´ ÑÐ²Ð»ÑÐµÑ‚ÑÑ DNS Ð¸Ð¼ÐµÐ½ÐµÐ¼ Ñ…Ð¾ÑÑ‚Ð° Ð½Ð¾ Ð´Ð°Ð½Ð½Ñ‹Ðµ Punycode Ð¾Ð±Ð¾Ð·Ð½Ð°Ñ‡ÐµÐ½Ð¸Ñ Ð½Ðµ Ð¼Ð¾Ð³ÑƒÑ‚ Ð±Ñ‹Ñ‚ÑŒ Ñ€Ð°ÑÑˆÐ¸Ñ„Ñ€Ð¾Ð²Ð°Ð½Ñ‹', 'ru_RU', '346');
INSERT INTO `core_translate_locale` VALUES ('726', 'Ð’Ð²Ð¾Ð´ ÑÐ²Ð»ÑÐµÑ‚ÑÑ DNS Ð¸Ð¼ÐµÐ½ÐµÐ¼ Ñ…Ð¾ÑÑ‚Ð° Ð½Ð¾ ÑÐ¾Ð´ÐµÑ€Ð¶Ð¸Ñ‚ Ñ‚Ð¸Ñ€Ðµ Ð² Ð½ÐµÐ²ÐµÑ€Ð½Ð¾Ð¼ Ð¼ÐµÑÑ‚Ðµ', 'ru_RU', '347');
INSERT INTO `core_translate_locale` VALUES ('727', 'ÐÐµ ÑÐ¾Ð¾Ñ‚Ð²ÐµÑ‚ÑÑ‚Ð²ÑƒÐµÑ‚ Ð¾Ð¶Ð¸Ð´Ð°ÐµÐ¼Ð¾Ð¹ ÑÑ‚Ñ€ÑƒÐºÑ‚ÑƒÑ€Ðµ DNS Ñ…Ð¾ÑÑ‚Ð°', 'ru_RU', '348');
INSERT INTO `core_translate_locale` VALUES ('728', 'Ð’Ð²Ð¾Ð´ ÑÐ²Ð»ÑÐµÑ‚ÑÑ DNS Ð¸Ð¼ÐµÐ½ÐµÐ¼ Ñ…Ð¾ÑÑ‚Ð° Ð½Ð¾ Ð½Ðµ ÑÐ¾Ð¾Ñ‚Ð²ÐµÑ‚ÑÑ‚Ð²ÑƒÐµÑ‚ ÑÑ…ÐµÐ¼Ðµ TLD \'%tld%\'', 'ru_RU', '349');
INSERT INTO `core_translate_locale` VALUES ('729', 'Ð’Ð²Ð¾Ð´ ÑÐ¾Ð´ÐµÑ€Ð¶Ð¸Ñ‚ Ð½ÐµÐ²ÐµÑ€Ð½Ð¾Ðµ Ð¸Ð¼Ñ Ð»Ð¾ÐºÐ°Ð»ÑŒÐ½Ð¾Ð¹ ÑÐµÑ‚Ð¸', 'ru_RU', '350');
INSERT INTO `core_translate_locale` VALUES ('730', 'Ð’Ð¾Ð¾Ð´ ÑÐ¾Ð´ÐµÑ€Ð¶Ð¸Ñ‚ Ð½ÐµÐ²ÐµÑ€Ð½Ð¾Ðµ URI Ð¸Ð¼Ñ Ñ…Ð¾ÑÑ‚Ð°', 'ru_RU', '351');
INSERT INTO `core_translate_locale` VALUES ('731', 'Ð’Ð²Ð¾Ð´ ÑÐ²Ð»ÑÐµÑ‚ÑÑ IP Ð°Ð´Ñ€ÐµÑÐ¾Ð¼ Ñ…Ð¾ÑÑ‚Ð°, Ð½Ð¾ ÑÑ‚Ð¾Ñ‚ IP Ð°Ð´Ñ€ÐµÑ Ð½Ðµ Ð´Ð¾ÑÑ‚ÑƒÐ¿ÐµÐ½', 'ru_RU', '352');
INSERT INTO `core_translate_locale` VALUES ('732', 'Ð’Ð²Ð¾Ð´ ÑÐ²Ð»ÑÐµÑ‚ÑÑ Ð»Ð¾ÐºÐ°Ð»ÑŒÐ½Ñ‹Ð¼ Ð°Ð´Ñ€ÐµÑÐ¾Ð¼ ÑÐµÑ‚Ð¸, Ð½Ð¾ ÑÑ‚Ð¾Ñ‚ Ð»Ð¾ÐºÐ°Ð»ÑŒÐ½Ñ‹Ð¹ Ð°Ð´Ñ€ÐµÑ Ð½Ðµ Ð´Ð¾ÑÑ‚ÑƒÐ¿ÐµÐ½', 'ru_RU', '353');
INSERT INTO `core_translate_locale` VALUES ('733', 'Ð’Ð²Ð¾Ð´ ÑÐ²Ð»ÑÐµÑ‚ÑÑ DNS Ð¸Ð¼ÐµÐ½ÐµÐ¼ Ñ…Ð¾ÑÑ‚Ð° Ð½Ð¾ Ð½Ðµ Ð¼Ð¾Ð¶ÐµÑ‚ Ð±Ñ‹Ñ‚ÑŒ Ð¸Ð·Ð²Ð»ÐµÑ‡ÐµÐ½Ð° TLD Ñ‡Ð°ÑÑ‚ÑŒ', 'ru_RU', '354');
INSERT INTO `core_translate_locale` VALUES ('734', 'Ð’Ð²Ð¾Ð´ ÑÐ²Ð»ÑÐµÑ‚ÑÑ DNS Ð¸Ð¼ÐµÐ½ÐµÐ¼ Ñ…Ð¾ÑÑ‚Ð° Ð½Ð¾ Ð½Ðµ Ð²Ð¾Ð·Ð¼Ð¾Ð¶Ð½Ð¾ ÑÑ€Ð°Ð²Ð½Ð¸Ñ‚ÑŒ TLD Ñ Ð¸Ð·Ð²ÐµÑÑ‚Ð½Ñ‹Ð¼ ÑÐ¿Ð¸ÑÐºÐ¾Ð¼', 'ru_RU', '355');
INSERT INTO `core_translate_locale` VALUES ('735', 'ÐÐµÐ¸Ð·Ð²ÐµÑÑ‚Ð½Ð°Ñ ÑÑ‚Ñ€Ð°Ð½Ð° Ð² IBAN', 'ru_RU', '356');
INSERT INTO `core_translate_locale` VALUES ('736', 'Ð¡Ñ‚Ñ€Ð°Ð½Ñ‹, Ð½Ðµ Ð²Ñ…Ð¾Ð´ÑÑ‰Ð¸Ðµ Ð² Ð•Ð´Ð¸Ð½Ð¾Ðµ Ð•Ð²Ñ€Ð¾Ð¿ÐµÐ¹ÑÐºÐ¾Ðµ ÐŸÐ»Ð°Ñ‚ÐµÐ¶Ð½Ð¾Ðµ Ð¿Ñ€Ð¾ÑÑ‚Ñ€Ð°Ð½ÑÑ‚Ð²Ð¾ (SEPA) Ð½Ðµ Ð¿Ð¾Ð´Ð´ÐµÑ€Ð¶Ð¸Ð²Ð°ÑŽÑ‚ÑÑ', 'ru_RU', '357');
INSERT INTO `core_translate_locale` VALUES ('737', 'Ð’Ð²Ð¾Ð´ ÑÐ¾Ð´ÐµÑ€Ð¶Ð¸Ñ‚ Ð½Ðµ Ð²ÐµÑ€Ð½Ñ‹Ð¹ Ñ„Ð¾Ñ€Ð¼Ð°Ñ‚ IBAN', 'ru_RU', '358');
INSERT INTO `core_translate_locale` VALUES ('738', 'Ð’Ð²Ð¾Ð´ ÑÐ¾Ð´ÐµÑ€Ð¶Ð¸Ñ‚ Ð¾ÑˆÐ¸Ð±ÐºÑƒ Ð² IBAN', 'ru_RU', '359');
INSERT INTO `core_translate_locale` VALUES ('739', 'Ð”Ð²Ð° Ð·Ð½Ð°Ñ‡ÐµÐ½Ð¸Ñ Ð½Ðµ ÑÐ¾Ð²Ð¿Ð°Ð´Ð°ÑŽÑ‚', 'ru_RU', '360');
INSERT INTO `core_translate_locale` VALUES ('740', 'ÐÐµ Ð¿Ñ€ÐµÐ´Ð¾ÑÑ‚Ð°Ð²Ð»ÐµÐ½Ñ‹ Ð·Ð½Ð°Ñ‡ÐµÐ½Ð¸Ñ Ð´Ð»Ñ ÑÑ€Ð°Ð²Ð½ÐµÐ½Ð¸Ñ', 'ru_RU', '361');
INSERT INTO `core_translate_locale` VALUES ('741', 'Ð’Ð²Ð¾Ð´ Ð½Ðµ Ð½Ð°Ð¹Ð´ÐµÐ½ Ð² Ð¼Ð°ÑÑÐ¸Ð²Ðµ', 'ru_RU', '362');
INSERT INTO `core_translate_locale` VALUES ('742', 'Ð’Ð²Ð¾Ð´ ÑÐ¾Ð´ÐµÑ€Ð¶Ð¸Ñ‚ Ð½ÐµÐ²ÐµÑ€Ð½Ñ‹Ð¹ IP Ð°Ð´Ñ€ÐµÑ', 'ru_RU', '363');
INSERT INTO `core_translate_locale` VALUES ('743', 'Ð’Ð²Ð¾Ð´ ÑÐ¾Ð´ÐµÑ€Ð¶Ð¸Ñ‚ Ð½ÐµÐ²ÐµÑ€Ð½Ñ‹Ð¹ ISBN Ð¼Ð¾Ð¼ÐµÑ€', 'ru_RU', '364');
INSERT INTO `core_translate_locale` VALUES ('744', 'Ð’Ð²ÐµÐ´ÐµÐ½Ð¾ Ð·Ð½Ð°Ñ‡ÐµÐ½Ð¸Ðµ Ð½Ðµ Ð¼ÐµÐ½ÑŒÑˆÐµÐµ \'%max%\'', 'ru_RU', '365');
INSERT INTO `core_translate_locale` VALUES ('745', 'Ð’Ð²ÐµÐ´ÐµÐ½Ð¾ Ð·Ð½Ð°Ñ‡ÐµÐ½Ð¸Ðµ Ð½Ðµ Ð¼ÐµÐ½ÑŒÑˆÐµÐµ Ð¸Ð»Ð¸ Ñ€Ð°Ð²Ð½Ð¾Ðµ \'%max%\'', 'ru_RU', '366');
INSERT INTO `core_translate_locale` VALUES ('746', 'Ð—Ð½Ð°Ñ‡ÐµÐ½Ð¸Ðµ Ð½Ðµ Ð¼Ð¾Ð¶ÐµÑ‚ Ð±Ñ‹Ñ‚ÑŒ Ð¿ÑƒÑÑ‚Ñ‹Ð¼', 'ru_RU', '367');
INSERT INTO `core_translate_locale` VALUES ('747', 'ÐÐµÐ²ÐµÑ€Ð½Ñ‹Ð¹ Ñ‚Ð¸Ð¿.ÐžÐ¶Ð¸Ð´Ð°ÐµÑ‚ÑÑ ÑÑ‚Ñ€Ð¾ÐºÐ°, Ñ†ÐµÐ»Ð¾Ðµ Ñ‡Ð¸ÑÐ»Ð¾, Ñ‡Ð¸ÑÐ»Ð¾ Ñ Ð¿Ð»Ð°Ð²Ð°ÑŽÑ‰ÐµÐ¹ Ñ‚Ð¾Ñ‡ÐºÐ¾Ð¹, Ð»Ð¾Ð³Ð¸Ñ‡ÐµÑÐºÐ¾Ðµ Ð·Ð½Ð°Ñ‡ÐµÐ½Ð¸Ðµ Ð¸Ð»Ð¸ Ð¼Ð°ÑÑÐ¸Ð²', 'ru_RU', '368');
INSERT INTO `core_translate_locale` VALUES ('748', 'Ð’Ð²Ð¾Ð´ Ð½Ðµ ÑÐ¾Ð¾Ñ‚Ð²ÐµÑ‚ÑÑ‚Ð²ÑƒÐµÑ‚ ÑÑ…ÐµÐ¼Ðµ Ñ€ÐµÐ³ÑƒÐ»ÑÑ€Ð½Ñ‹Ñ… Ð²Ñ‹Ñ€Ð°Ð¶ÐµÐ½Ð¸Ð¹ \'%pattern%\'', 'ru_RU', '369');
INSERT INTO `core_translate_locale` VALUES ('749', 'ÐŸÑ€Ð¾Ð¸Ð·Ð¾ÑˆÐ»Ð° Ð²Ð½ÑƒÑ‚Ñ€ÐµÐ½Ð½Ñ Ð¾ÑˆÐ¸Ð±ÐºÐ° Ð¿Ñ€Ð¸ Ð¸ÑÐ¿Ð¾Ð»ÑŒÐ·Ð¾Ð²Ð°Ð½Ð¸Ð¸ ÑÑ…ÐµÐ¼Ñ‹ Ñ€ÐµÐ³ÑƒÐ»ÑÑ€Ð½Ð¾Ð³Ð¾ Ð²Ñ‹Ñ€Ð¾Ð¶ÐµÐ½Ð¸Ñ \'%pattern%\'', 'ru_RU', '370');
INSERT INTO `core_translate_locale` VALUES ('750', 'ÐÐµÐ²ÐµÑ€Ð½Ð¾Ðµ Ð·Ð½Ð°Ñ‡ÐµÐ½Ð¸Ðµ ÐºÐ°Ñ€Ñ‚Ñ‹ ÑÐ°Ð¹Ñ‚Ð° changefreq', 'ru_RU', '371');
INSERT INTO `core_translate_locale` VALUES ('751', 'ÐÐµÐ²ÐµÑ€Ð½Ð¾Ðµ Ð·Ð½Ð°Ñ‡ÐµÐ½Ð¸Ðµ ÐºÐ°Ñ€Ñ‚Ñ‹ ÑÐ°Ð¹Ñ‚Ð° lastmod', 'ru_RU', '372');
INSERT INTO `core_translate_locale` VALUES ('752', 'ÐÐµÐ²ÐµÑ€Ð½Ð¾Ðµ Ð·Ð½Ð°Ñ‡ÐµÐ½Ð¸Ðµ ÐºÐ°Ñ€Ñ‚Ñ‹ ÑÐ°Ð¹Ñ‚Ð° location', 'ru_RU', '373');
INSERT INTO `core_translate_locale` VALUES ('753', 'ÐÐµÐ²ÐµÑ€Ð½Ð¾Ðµ Ð·Ð½Ð°Ñ‡ÐµÐ½Ð¸Ðµ ÐºÐ°Ñ€Ñ‚Ñ‹ ÑÐ°Ð¹Ñ‚Ð° priority', 'ru_RU', '374');
INSERT INTO `core_translate_locale` VALUES ('754', 'ÐÐµÐ²ÐµÑ€Ð½Ñ‹Ð¹ Ñ‚Ð¸Ð¿. ÐžÐ¶Ð¸Ð´Ð°ÐµÑ‚ÑÑ ÑÑ‚Ñ€Ð¾ÐºÐ°, Ñ†ÐµÐ»Ð¾Ðµ Ñ‡Ð¸ÑÐ»Ð¾ Ð¸Ð»Ð¸ Ñ‡Ð¸ÑÐ»Ð¾ Ñ Ð¿Ð»Ð°Ð²Ð°ÑŽÑ‰ÐµÐ¹ Ñ‚Ð¾Ñ‡ÐºÐ¾Ð¹', 'ru_RU', '375');
INSERT INTO `core_translate_locale` VALUES ('755', 'ÐÐµÐ²ÐµÑ€Ð½Ñ‹Ð¹ Ñ‚Ð¸Ð¿. ÐžÐ¶Ð¸Ð´Ð°ÐµÑ‚ÑÑ ÑÐºÐ°Ð»ÑÑ€Ð½Ð¾Ðµ Ð²Ñ‹Ñ€Ð°Ð¶ÐµÐ½Ð¸Ðµ', 'ru_RU', '376');
INSERT INTO `core_translate_locale` VALUES ('756', 'Ð’Ð²ÐµÐ´ÐµÐ½Ð¾ Ð·Ð½Ð°Ñ‡ÐµÐ½Ð¸Ðµ Ð¼ÐµÐ½ÑŒÑˆÐµÐµ %min% ÑÐ¸Ð¼Ð²Ð¾Ð»Ð¾Ð²', 'ru_RU', '377');
INSERT INTO `core_translate_locale` VALUES ('757', 'Ð’Ð²ÐµÐ´ÐµÐ½Ð¾ Ð·Ð½Ð°Ñ‡ÐµÐ½Ð¸Ðµ Ð±Ð¾Ð»ÑŒÑˆÐµÐµ %max% ÑÐ¸Ð¼Ð²Ð¾Ð»Ð¾Ð²', 'ru_RU', '378');
INSERT INTO `core_translate_locale` VALUES ('758', 'ÐÐµÐ²ÐµÑ€Ð½Ñ‹Ð¹ URI', 'ru_RU', '379');
INSERT INTO `core_translate_locale` VALUES ('759', 'asdasdasd', 'af', '404');

-- ----------------------------
-- Table structure for datatype
-- ----------------------------
DROP TABLE IF EXISTS `datatype`;
CREATE TABLE `datatype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `prevalue_value` text COLLATE utf8_unicode_ci,
  `model` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of datatype
-- ----------------------------
INSERT INTO `datatype` VALUES ('1', 'Text field', 'N;', 'Textstring');
INSERT INTO `datatype` VALUES ('2', 'Rich text', 'a:1:{s:13:\"toolbar-items\";a:67:{s:6:\"Source\";s:1:\"1\";s:4:\"Save\";s:1:\"1\";s:7:\"NewPage\";s:1:\"1\";s:8:\"DocProps\";s:1:\"1\";s:7:\"Preview\";s:1:\"1\";s:5:\"Print\";s:1:\"1\";s:9:\"Templates\";s:1:\"1\";s:3:\"Cut\";s:1:\"1\";s:4:\"Copy\";s:1:\"1\";s:5:\"Paste\";s:1:\"1\";s:9:\"PasteText\";s:1:\"1\";s:13:\"PasteFromWord\";s:1:\"1\";s:4:\"Undo\";s:1:\"1\";s:4:\"Redo\";s:1:\"1\";s:4:\"Find\";s:1:\"1\";s:7:\"Replace\";s:1:\"1\";s:9:\"SelectAll\";s:1:\"1\";s:12:\"SpellChecker\";s:1:\"1\";s:5:\"Scayt\";s:1:\"1\";s:4:\"Form\";s:1:\"1\";s:8:\"Checkbox\";s:1:\"1\";s:5:\"Radio\";s:1:\"1\";s:9:\"TextField\";s:1:\"1\";s:8:\"Textarea\";s:1:\"1\";s:6:\"Select\";s:1:\"1\";s:6:\"Button\";s:1:\"1\";s:11:\"ImageButton\";s:1:\"1\";s:11:\"HiddenField\";s:1:\"1\";s:4:\"Bold\";s:1:\"1\";s:6:\"Italic\";s:1:\"1\";s:9:\"Underline\";s:1:\"1\";s:6:\"Strike\";s:1:\"1\";s:9:\"Subscript\";s:1:\"1\";s:11:\"Superscript\";s:1:\"1\";s:12:\"RemoveFormat\";s:1:\"1\";s:12:\"NumberedList\";s:1:\"1\";s:12:\"BulletedList\";s:1:\"1\";s:7:\"Outdent\";s:1:\"1\";s:6:\"Indent\";s:1:\"1\";s:10:\"Blockquote\";s:1:\"1\";s:9:\"CreateDiv\";s:1:\"1\";s:11:\"JustifyLeft\";s:1:\"1\";s:13:\"JustifyCenter\";s:1:\"1\";s:12:\"JustifyRight\";s:1:\"1\";s:12:\"JustifyBlock\";s:1:\"1\";s:7:\"BidiLtr\";s:1:\"1\";s:7:\"BidiRtl\";s:1:\"1\";s:4:\"Link\";s:1:\"1\";s:6:\"Unlink\";s:1:\"1\";s:6:\"Anchor\";s:1:\"1\";s:5:\"Image\";s:1:\"1\";s:5:\"Flash\";s:1:\"1\";s:5:\"Table\";s:1:\"1\";s:14:\"HorizontalRule\";s:1:\"1\";s:6:\"Smiley\";s:1:\"1\";s:11:\"SpecialChar\";s:1:\"1\";s:9:\"PageBreak\";s:1:\"1\";s:6:\"Iframe\";s:1:\"1\";s:6:\"Styles\";s:1:\"1\";s:6:\"Format\";s:1:\"1\";s:4:\"Font\";s:1:\"1\";s:8:\"FontSize\";s:1:\"1\";s:9:\"TextColor\";s:1:\"1\";s:7:\"BGColor\";s:1:\"1\";s:8:\"Maximize\";s:1:\"1\";s:10:\"ShowBlocks\";s:1:\"1\";s:5:\"About\";s:1:\"1\";}}', 'Textrich');
INSERT INTO `datatype` VALUES ('3', 'Text area', 'a:3:{s:4:\"cols\";s:2:\"50\";s:4:\"rows\";s:2:\"30\";s:4:\"wrap\";s:4:\"hard\";}', 'Textarea');
INSERT INTO `datatype` VALUES ('4', 'Simple Image', 'a:2:{s:9:\"mime_list\";a:3:{i:0;s:9:\"image/gif\";i:1;s:10:\"image/jpeg\";i:2;s:9:\"image/png\";}s:11:\"is_multiple\";b:0;}', 'Upload');
INSERT INTO `datatype` VALUES ('6', 'Datepicker', 'N;', 'DatePicker');
INSERT INTO `datatype` VALUES ('7', 'ImageCropperRelay', 'a:4:{s:10:\"background\";s:7:\"#FFFFFF\";s:13:\"resize_option\";s:4:\"auto\";s:9:\"mime_list\";a:3:{i:0;s:9:\"image/gif\";i:1;s:10:\"image/jpeg\";i:2;s:9:\"image/png\";}s:4:\"size\";a:1:{i:0;a:3:{s:4:\"name\";s:7:\"570x150\";s:5:\"width\";s:3:\"570\";s:6:\"height\";s:3:\"150\";}}}', 'ImageCropper');
INSERT INTO `datatype` VALUES ('8', 'Sidebar text', 'a:1:{s:9:\"datatypes\";a:2:{i:0;a:3:{s:4:\"name\";s:10:\"Textstring\";s:5:\"label\";s:5:\"Title\";s:6:\"config\";a:1:{s:6:\"length\";s:0:\"\";}}i:1;a:3:{s:4:\"name\";s:8:\"Textrich\";s:5:\"label\";s:7:\"Content\";s:6:\"config\";a:1:{s:13:\"toolbar-items\";a:67:{s:6:\"Source\";s:1:\"1\";s:4:\"Save\";s:1:\"1\";s:7:\"NewPage\";s:1:\"1\";s:8:\"DocProps\";s:1:\"1\";s:7:\"Preview\";s:1:\"1\";s:5:\"Print\";s:1:\"1\";s:9:\"Templates\";s:1:\"1\";s:3:\"Cut\";s:1:\"1\";s:4:\"Copy\";s:1:\"1\";s:5:\"Paste\";s:1:\"1\";s:9:\"PasteText\";s:1:\"1\";s:13:\"PasteFromWord\";s:1:\"1\";s:4:\"Undo\";s:1:\"1\";s:4:\"Redo\";s:1:\"1\";s:4:\"Find\";s:1:\"1\";s:7:\"Replace\";s:1:\"1\";s:9:\"SelectAll\";s:1:\"1\";s:12:\"SpellChecker\";s:1:\"1\";s:5:\"Scayt\";s:1:\"1\";s:4:\"Form\";s:1:\"1\";s:8:\"Checkbox\";s:1:\"1\";s:5:\"Radio\";s:1:\"1\";s:9:\"TextField\";s:1:\"1\";s:8:\"Textarea\";s:1:\"1\";s:6:\"Select\";s:1:\"1\";s:6:\"Button\";s:1:\"1\";s:11:\"ImageButton\";s:1:\"1\";s:11:\"HiddenField\";s:1:\"1\";s:4:\"Bold\";s:1:\"1\";s:6:\"Italic\";s:1:\"1\";s:9:\"Underline\";s:1:\"1\";s:6:\"Strike\";s:1:\"1\";s:9:\"Subscript\";s:1:\"1\";s:11:\"Superscript\";s:1:\"1\";s:12:\"RemoveFormat\";s:1:\"1\";s:12:\"NumberedList\";s:1:\"1\";s:12:\"BulletedList\";s:1:\"1\";s:7:\"Outdent\";s:1:\"1\";s:6:\"Indent\";s:1:\"1\";s:10:\"Blockquote\";s:1:\"1\";s:9:\"CreateDiv\";s:1:\"1\";s:11:\"JustifyLeft\";s:1:\"1\";s:13:\"JustifyCenter\";s:1:\"1\";s:12:\"JustifyRight\";s:1:\"1\";s:12:\"JustifyBlock\";s:1:\"1\";s:7:\"BidiLtr\";s:1:\"1\";s:7:\"BidiRtl\";s:1:\"1\";s:4:\"Link\";s:1:\"1\";s:6:\"Unlink\";s:1:\"1\";s:6:\"Anchor\";s:1:\"1\";s:5:\"Image\";s:1:\"1\";s:5:\"Flash\";s:1:\"1\";s:5:\"Table\";s:1:\"1\";s:14:\"HorizontalRule\";s:1:\"1\";s:6:\"Smiley\";s:1:\"1\";s:11:\"SpecialChar\";s:1:\"1\";s:9:\"PageBreak\";s:1:\"1\";s:6:\"Iframe\";s:1:\"1\";s:6:\"Styles\";s:1:\"1\";s:6:\"Format\";s:1:\"1\";s:4:\"Font\";s:1:\"1\";s:8:\"FontSize\";s:1:\"1\";s:9:\"TextColor\";s:1:\"1\";s:7:\"BGColor\";s:1:\"1\";s:8:\"Maximize\";s:1:\"1\";s:10:\"ShowBlocks\";s:1:\"1\";s:5:\"About\";s:1:\"1\";}}}}}', 'Mixed');
INSERT INTO `datatype` VALUES ('9', 'Upload', 'a:2:{s:9:\"mime_list\";a:3:{i:0;s:9:\"image/gif\";i:1;s:10:\"image/jpeg\";i:2;s:9:\"image/png\";}s:11:\"is_multiple\";b:0;}', 'Upload');

-- ----------------------------
-- Table structure for document
-- ----------------------------
DROP TABLE IF EXISTS `document`;
CREATE TABLE `document` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `url_key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `sort_order` int(11) NOT NULL DEFAULT '0',
  `show_in_nav` tinyint(1) DEFAULT '0',
  `can_be_cached` tinyint(1) DEFAULT '1',
  `locale` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `document_type_id` int(11) DEFAULT NULL,
  `view_id` int(11) DEFAULT NULL,
  `layout_id` int(11) DEFAULT NULL,
  `parent_id` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_document_layout` (`layout_id`),
  KEY `fk_document_document` (`parent_id`),
  KEY `fk_documents_view` (`view_id`),
  KEY `fk_document_document_type` (`document_type_id`),
  KEY `fk_document_user` (`user_id`),
  CONSTRAINT `fk_document_document` FOREIGN KEY (`parent_id`) REFERENCES `document` (`id`) ON DELETE SET NULL ON UPDATE SET NULL,
  CONSTRAINT `fk_document_document_type` FOREIGN KEY (`document_type_id`) REFERENCES `document_type` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_document_layout` FOREIGN KEY (`layout_id`) REFERENCES `layout` (`id`) ON DELETE SET NULL ON UPDATE SET NULL,
  CONSTRAINT `fk_document_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_documents_view` FOREIGN KEY (`view_id`) REFERENCES `view` (`id`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of document
-- ----------------------------
INSERT INTO `document` VALUES ('2', '2012-09-20 22:09:06', '2013-06-02 12:00:33', 'About', 'about', '1', '2', '1', '1', null, '1', '3', '4', '1', null);
INSERT INTO `document` VALUES ('3', '2012-09-20 22:09:29', '2013-05-25 13:58:10', 'Contact', 'contact', '1', '3', '1', '0', null, '1', '2', '3', '1', null);
INSERT INTO `document` VALUES ('4', '2013-05-25 13:57:47', '2013-06-02 12:07:47', 'Home', '', '1', '1', '1', '1', null, '1', '6', '1', '1', null);
INSERT INTO `document` VALUES ('5', '2013-05-25 13:58:49', '2013-05-27 08:53:50', 'First category', 'first-category', '1', '0', '1', '0', null, '1', '5', '1', '1', '4');
INSERT INTO `document` VALUES ('6', '2013-05-25 13:59:05', '2013-05-27 08:53:53', 'Second category', 'second-category', '1', '0', '1', '0', null, '1', '5', '1', '1', '4');
INSERT INTO `document` VALUES ('7', '2013-05-25 14:00:54', '2013-05-26 13:32:18', 'Article 1', 'article-about-something', '1', '0', '0', '0', null, '1', '4', '11', '1', '5');
INSERT INTO `document` VALUES ('8', '2013-05-25 14:01:26', '2013-05-26 13:32:27', 'Article 2', 'article-about-something', '1', '0', '0', '0', null, '1', '4', '11', '1', '6');

-- ----------------------------
-- Table structure for document_type
-- ----------------------------
DROP TABLE IF EXISTS `document_type`;
CREATE TABLE `document_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `icon_id` int(11) DEFAULT NULL,
  `default_view_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_document_type_view` (`default_view_id`),
  KEY `fk_document_type_icon` (`icon_id`),
  CONSTRAINT `fk_document_type_icon` FOREIGN KEY (`icon_id`) REFERENCES `icon` (`id`) ON DELETE SET NULL ON UPDATE SET NULL,
  CONSTRAINT `fk_document_type_view` FOREIGN KEY (`default_view_id`) REFERENCES `view` (`id`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of document_type
-- ----------------------------
INSERT INTO `document_type` VALUES ('2', '2012-09-20 22:05:53', '2013-06-02 11:29:45', 'Contact', 'Contact form', '11', '3', '1');
INSERT INTO `document_type` VALUES ('3', '2012-09-20 22:06:37', '2013-06-02 11:58:48', 'About', 'About this website', '13', '4', '1');
INSERT INTO `document_type` VALUES ('4', '2013-05-24 08:49:53', '2013-06-02 11:29:27', 'Blog ticket', 'Ticket blog', '6', '11', '1');
INSERT INTO `document_type` VALUES ('5', '2013-05-24 08:56:17', '2013-06-02 11:28:48', 'Blog category', 'Blog category', '8', '1', '1');
INSERT INTO `document_type` VALUES ('6', '2013-05-24 08:57:15', '2013-06-02 12:06:43', 'Blog', 'Blog', '24', '1', '1');

-- ----------------------------
-- Table structure for document_type_dependency
-- ----------------------------
DROP TABLE IF EXISTS `document_type_dependency`;
CREATE TABLE `document_type_dependency` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL,
  `children_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_document_type_dependency_parent_id` (`parent_id`),
  KEY `fk_document_type_dependency_children_id` (`children_id`),
  CONSTRAINT `fk_document_type_dependency_children_id` FOREIGN KEY (`children_id`) REFERENCES `document_type` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_document_type_dependency_parent_id` FOREIGN KEY (`parent_id`) REFERENCES `document_type` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of document_type_dependency
-- ----------------------------
INSERT INTO `document_type_dependency` VALUES ('8', '5', '4');
INSERT INTO `document_type_dependency` VALUES ('10', '6', '5');

-- ----------------------------
-- Table structure for document_type_view
-- ----------------------------
DROP TABLE IF EXISTS `document_type_view`;
CREATE TABLE `document_type_view` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `view_id` int(11) NOT NULL,
  `document_type_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_document_type_views_views` (`view_id`),
  KEY `fk_document_type_view_document_type` (`document_type_id`),
  CONSTRAINT `fk_document_type_view_document_type` FOREIGN KEY (`document_type_id`) REFERENCES `document_type` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_document_type_views_views` FOREIGN KEY (`view_id`) REFERENCES `view` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of document_type_view
-- ----------------------------

-- ----------------------------
-- Table structure for icon
-- ----------------------------
DROP TABLE IF EXISTS `icon`;
CREATE TABLE `icon` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of icon
-- ----------------------------
INSERT INTO `icon` VALUES ('1', 'Home', '/media/icons/home.png');
INSERT INTO `icon` VALUES ('2', 'Camera', '/media/icons/camera.png');
INSERT INTO `icon` VALUES ('3', 'Box', '/media/icons/box.png');
INSERT INTO `icon` VALUES ('4', 'Calendar', '/media/icons/calendar.png');
INSERT INTO `icon` VALUES ('5', 'Configuration', '/media/icons/configuration.png');
INSERT INTO `icon` VALUES ('6', 'File', '/media/icons/file.gif');
INSERT INTO `icon` VALUES ('7', 'Film', '/media/icons/film.png');
INSERT INTO `icon` VALUES ('8', 'Folder', '/media/icons/folder.gif');
INSERT INTO `icon` VALUES ('9', 'Folder closed', '/media/icons/folder-closed.gif');
INSERT INTO `icon` VALUES ('10', 'Image', '/media/icons/image.png');
INSERT INTO `icon` VALUES ('11', 'Letter blue', '/media/icons/letter-blue.png');
INSERT INTO `icon` VALUES ('12', 'Letter red', '/media/icons/letter-red.png');
INSERT INTO `icon` VALUES ('13', 'Pen green', '/media/icons/pen-green.png');
INSERT INTO `icon` VALUES ('14', 'Pen yellow', '/media/icons/pen-yellow.png');
INSERT INTO `icon` VALUES ('15', 'Printer', '/media/icons/printer.png');
INSERT INTO `icon` VALUES ('16', 'Rss', '/media/icons/rss.png');
INSERT INTO `icon` VALUES ('17', 'Save', '/media/icons/save-black.png');
INSERT INTO `icon` VALUES ('18', 'Save blue', '/media/icons/save-blue.png');
INSERT INTO `icon` VALUES ('19', 'Shell', '/media/icons/shell.png');
INSERT INTO `icon` VALUES ('20', 'Tool', '/media/icons/tool.png');
INSERT INTO `icon` VALUES ('21', 'Trash', '/media/icons/trash.png');
INSERT INTO `icon` VALUES ('22', 'Trash empty', '/media/icons/trash-empty.png');
INSERT INTO `icon` VALUES ('23', 'TV', '/media/icons/tv.png');
INSERT INTO `icon` VALUES ('24', 'Write', '/media/icons/write.png');

-- ----------------------------
-- Table structure for layout
-- ----------------------------
DROP TABLE IF EXISTS `layout`;
CREATE TABLE `layout` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `identifier` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`identifier`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of layout
-- ----------------------------
INSERT INTO `layout` VALUES ('1', '2012-09-19 19:28:34', '2013-06-02 12:26:50', 'Main', 'main', 'Main layout');

-- ----------------------------
-- Table structure for log_url
-- ----------------------------
DROP TABLE IF EXISTS `log_url`;
CREATE TABLE `log_url` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `visit_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `log_url_info_id` bigint(20) unsigned DEFAULT NULL,
  `log_visitor_id` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_log_url_log_visitor` (`log_visitor_id`),
  KEY `fk_log_url_log_url_info` (`log_url_info_id`),
  CONSTRAINT `fk_log_url_log_url_info` FOREIGN KEY (`log_url_info_id`) REFERENCES `log_url_info` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_log_url_log_visitor` FOREIGN KEY (`log_visitor_id`) REFERENCES `log_visitor` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of log_url
-- ----------------------------
INSERT INTO `log_url` VALUES ('1', '2016-12-16 10:42:48', '1', '1');
INSERT INTO `log_url` VALUES ('2', '2016-12-16 10:42:57', '2', '1');
INSERT INTO `log_url` VALUES ('3', '2016-12-16 10:43:07', '2', '1');
INSERT INTO `log_url` VALUES ('4', '2016-12-16 10:43:09', '2', '1');
INSERT INTO `log_url` VALUES ('5', '2016-12-16 10:43:10', '2', '1');
INSERT INTO `log_url` VALUES ('6', '2016-12-16 10:43:11', '2', '1');

-- ----------------------------
-- Table structure for log_url_info
-- ----------------------------
DROP TABLE IF EXISTS `log_url_info`;
CREATE TABLE `log_url_info` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `referer` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of log_url_info
-- ----------------------------
INSERT INTO `log_url_info` VALUES ('1', '/', 'http://gocms.lc/install/complete');
INSERT INTO `log_url_info` VALUES ('2', '/', 'http://gocms.lc/install/configuration');

-- ----------------------------
-- Table structure for log_visitor
-- ----------------------------
DROP TABLE IF EXISTS `log_visitor`;
CREATE TABLE `log_visitor` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `session_id` char(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `http_user_agent` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `http_accept_CHARset` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `http_accept_language` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `server_addr` bigint(20) DEFAULT NULL,
  `remote_addr` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of log_visitor
-- ----------------------------
INSERT INTO `log_visitor` VALUES ('1', '1li9cd46caup3l3qn1kjsbkss6', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:50.0) Gecko/20100101 Firefox/50.0', null, 'vi-VN,vi;q=0.8,en-US;q=0.5,en;q=0.3', '2130706433', '2130706433');

-- ----------------------------
-- Table structure for module
-- ----------------------------
DROP TABLE IF EXISTS `module`;
CREATE TABLE `module` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of module
-- ----------------------------
INSERT INTO `module` VALUES ('1', 'Blog', '2016-12-16 10:42:18');
INSERT INTO `module` VALUES ('2', 'Sitemap', '2016-12-16 10:55:30');
INSERT INTO `module` VALUES ('3', 'ActivityLog', '2016-12-16 10:55:44');

-- ----------------------------
-- Table structure for property
-- ----------------------------
DROP TABLE IF EXISTS `property`;
CREATE TABLE `property` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `identifier` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `sort_order` int(11) DEFAULT '0',
  `tab_id` int(11) NOT NULL,
  `datatype_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`identifier`,`tab_id`),
  KEY `fk_property_datatype` (`datatype_id`),
  KEY `fk_property_tab` (`tab_id`),
  CONSTRAINT `fk_property_datatype` FOREIGN KEY (`datatype_id`) REFERENCES `datatype` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_property_tab` FOREIGN KEY (`tab_id`) REFERENCES `tab` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of property
-- ----------------------------
INSERT INTO `property` VALUES ('5', 'Content', 'content', 'content', '0', '2', '4', '2');
INSERT INTO `property` VALUES ('6', 'Meta description', 'metaDescription', 'Description', '0', '1', '7', '1');
INSERT INTO `property` VALUES ('7', 'Keywords', 'metaKeywords', 'Keywords', '0', '2', '7', '1');
INSERT INTO `property` VALUES ('8', 'Title', 'pageTitle', 'Title', '0', '3', '7', '1');
INSERT INTO `property` VALUES ('9', 'Main Title', 'mainTitle', 'Title', '0', '4', '7', '1');
INSERT INTO `property` VALUES ('10', 'Meta description', 'metaDescription', 'Description', '0', '3', '8', '1');
INSERT INTO `property` VALUES ('11', 'Keywords', 'metaKeywords', 'Keywords', '0', '4', '8', '1');
INSERT INTO `property` VALUES ('12', 'Title', 'pageTitle', 'Title', '0', '5', '8', '1');
INSERT INTO `property` VALUES ('13', 'Main Title', 'mainTitle', 'Title', '0', '6', '8', '1');
INSERT INTO `property` VALUES ('15', 'Title', 'title', 'Title', '0', '1', '4', '1');
INSERT INTO `property` VALUES ('26', 'Short content', 'shortContent', '', '0', '5', '12', '2');
INSERT INTO `property` VALUES ('27', 'Image', 'image', '', '0', '6', '12', '7');
INSERT INTO `property` VALUES ('28', 'Meta description', 'metaDescription', 'Description', '0', '7', '13', '1');
INSERT INTO `property` VALUES ('29', 'Keywords', 'metaKeywords', 'Keywords', '0', '8', '13', '1');
INSERT INTO `property` VALUES ('30', 'Title', 'pageTitle', 'Title', '0', '9', '13', '1');
INSERT INTO `property` VALUES ('31', 'Main Title', 'mainTitle', 'Title', '0', '10', '13', '1');
INSERT INTO `property` VALUES ('32', 'Title', 'title', '', '0', '1', '11', '1');
INSERT INTO `property` VALUES ('33', 'Publication date', 'published_at', '', '0', '3', '11', '6');
INSERT INTO `property` VALUES ('34', 'Content', 'content', '', '0', '4', '11', '2');
INSERT INTO `property` VALUES ('35', 'Meta description', 'metaDescription', 'Description', '0', '1', '14', '1');
INSERT INTO `property` VALUES ('36', 'Keywords', 'metaKeywords', 'Keywords', '0', '2', '14', '1');
INSERT INTO `property` VALUES ('37', 'Title', 'pageTitle', 'Title', '0', '3', '14', '1');
INSERT INTO `property` VALUES ('38', 'Main Title', 'mainTitle', 'Title', '0', '4', '14', '1');
INSERT INTO `property` VALUES ('39', 'Meta description', 'metaDescription', 'Description', '0', '4', '15', '1');
INSERT INTO `property` VALUES ('40', 'Keywords', 'metaKeywords', 'Keywords', '0', '5', '15', '1');
INSERT INTO `property` VALUES ('41', 'Title', 'pageTitle', 'Title', '0', '6', '15', '1');
INSERT INTO `property` VALUES ('42', 'Main Title', 'mainTitle', 'Title', '0', '7', '15', '1');
INSERT INTO `property` VALUES ('43', 'Author name', 'authorName', '', '0', '2', '11', '1');
INSERT INTO `property` VALUES ('44', 'Elements', 'sidebarElements', '', '0', '3', '16', '8');
INSERT INTO `property` VALUES ('45', 'Elements', 'sidebarElements', '', '0', '5', '17', '8');
INSERT INTO `property` VALUES ('46', 'Elements', 'sidebarElements', '', '0', '11', '18', '8');
INSERT INTO `property` VALUES ('47', 'Elements', 'sidebarElements', '', '0', '5', '19', '8');
INSERT INTO `property` VALUES ('48', 'Elements', 'sidebarElements', '', '0', '7', '20', '8');
INSERT INTO `property` VALUES ('49', 'Image', 'image', '', '0', '1', '21', '9');
INSERT INTO `property` VALUES ('50', 'Content', 'content', '', '0', '2', '21', '2');

-- ----------------------------
-- Table structure for property_value
-- ----------------------------
DROP TABLE IF EXISTS `property_value`;
CREATE TABLE `property_value` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `document_id` int(11) NOT NULL,
  `property_id` int(11) NOT NULL,
  `value` longblob,
  PRIMARY KEY (`id`),
  KEY `fk_property_value_document` (`document_id`),
  KEY `fk_property_value_property` (`property_id`),
  CONSTRAINT `fk_property_value_document` FOREIGN KEY (`document_id`) REFERENCES `document` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_property_value_property` FOREIGN KEY (`property_id`) REFERENCES `property` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of property_value
-- ----------------------------
INSERT INTO `property_value` VALUES ('6', '2', '5', 0x3C703E0A2020202053757370656E64697373652066617563696275732064696374756D2074656C6C757320696420706F73756572652E204372617320717569732065726F732074656C6C75732C20696420706F7375657265206C616375732E205072616573656E74206163206573742065726F732E20416C697175616D20656C656966656E64206E756E63207574206E6571756520636F6E736571756174207175697320737573636970697420656C69742074696E636964756E742E20467573636520696E74657264756D20677261766964612074696E636964756E742E2053656420657420616E7465206E6563206C6967756C61206672696E67696C6C6120636F6E64696D656E74756D2E204D61757269732076656C2073656D206163206C6967756C6120736564206C6F72656D20766573746962756C756D206F726E6172652076656C20736564206E6962682E2046757363652072686F6E6375732074696E636964756E7420616E74652C206E6F6E2068656E647265726974206D61676E6120766573746962756C756D20717569732E20496E74656765722076656C20656E696D2073656D2070686173656C6C75732074656D707573206C6F72656D2E3C2F703E0A3C703E0A202020204D616563656E61732076656C206D61757269732073697420616D657420617567756520616363756D73616E2074656D706F72206E6F6E20696E2073617069656E2E204E756C6C6120666163696C6973692E20416C697175616D20696D706572646965742073656D206574206F7263692061646970697363696E67207665686963756C61207361676974746973206D6574757320636F6E73656374657475722E204D617572697320612064756920646F6C6F72206D61676E612074726973746971756520636F6E64696D656E74756D206E6563207574206C6967756C612E20536564206575206172637520696E206E6571756520706F72746120696163756C69732E204D6175726973206665726D656E74756D2076656C69742073697420616D6574206C656F20636F6E76616C6C697320636F6E73656374657475722E2055742076656C206C696265726F206475692C206575207665686963756C612076656C69742E204D616563656E6173206574206A7573746F207669746165206C616375732076656E656E61746973207665686963756C612E205574206567657420706F7375657265206172637520646F6C6F726520626C616E6469742E3C2F703E0A3C703E0A2020202041656E65616E206E656320747572706973206163206C6967756C6120706F737565726520656C656966656E642073656420612065726F732E20496E7465676572206E6563206E69626820696E74657264756D206E756C6C61206672696E67696C6C6120756C747269636965732E20496E74656765722073656D7065722066656C697320657520616E746520636F6E677565206469676E697373696D2E205072616573656E742072686F6E637573206E756C6C61207365642066656C69732072686F6E63757320657420696163756C6973207269737573206D61747469732E204E616D20736564207075727573206475692C2061206567657374617320656E696D2E20446F6E656320666163696C697369732C20656E696D206964206665726D656E74756D206D61747469732C2074656C6C7573206C696265726F20756C74726963696573206D617373612C20657520626962656E64756D20617567756520697073756D2073697420616D6574206C6967756C612E2050726F696E20706F72746120736167697474697320657261742061632070686172657472612E2041656E65616E20756C7472696369657320656E696D206964206D69206C6163696E69612072686F6E6375732E204E756E6320766F6C75747061742C207475727069732076656C20706F7274612074696E636964756E742C206C6563747573206D65747573206665726D656E74756D206C65637475732C2073656420736F64616C65732065726174206E697369206E6F6E20646F6C6F722E2050656C6C656E7465737175652076697461652066656C69732065676574207475727069732072757472756D206D616C65737561646120696E206E6F6E207175616D2E204D6175726973206174206C6F72656D2076656C206E756E6320747269737469717565207363656C657269737175652073697420616D6574206964206E69736C2E20446F6E6563206174206E697369206D61676E612C20696E207072657469756D206C6967756C612E20536564206C616375732061756775652C207361676974746973206574206772617669646120766976657272612C20696D70657264696574206567657420656C69742E204D6F726269206D616C657375616461206C6967756C612E2050726F696E20706F72746120736167697474697320657261742061632070686172657472612E2041656E65616E20756C7472696369657320656E696D206964206D69206C6163696E69612072686F6E6375732E204E756E6320766F6C75747061742C207475727069732076656C20706F7274612074696E636964756E742C206C6563747573206D65747573206665726D656E74756D206C65637475732C2073656420736F64616C6573206572617420696D706572646965742073656D206574206F7263692061646970697363696E67207665686963756C61207361676974746973206D6574757320636F6E73656374657475722E204D617572697320612064756920646F6C6F72206D61676E612074726973746971756520636F6E64696D656E74756D206E6563207574206C6967756C612E20536564206575206172637520696E206E6571756520706F72746120696163756C69732E204D6175726973206665726D656E74756D2076656C69742073697420616D6574206C656F20636F6E76616C6C697320636F6E73656374657475722E2055742076656C206C696265726F206475692C206575207665686963756C612076656C69742E204D616563656E6173206574206A7573746F206E697369206E6F6E20646F6C6F722E2050656C6C656E7465737175652076697461652066656C69732065676574207475727069732072757472756D206D616C65737561646120696E206E6F6E207175616D2E204D6175726973206174206C6F72656D2076656C206E756E6320747269737469717565207363656C657269737175652073697420616D6574206964206E69736C2E20446F6E6563206174206E697369206D61676E612C20696E207072657469756D206C6967756C612E20536564206C616375732061756775652C207361676974746973206574206772617669646120766976657272612C20696D70657264696574206567657420656C69742E204D6F726269206D616C657375616461206D61757269732065752065726F732072757472756D20626C616E6469742E2043726173206D616C6573756164612072757472756D2073656D2C206163207665686963756C61206469616D20766F6C75747061742061632E20566573746962756C756D2073656420746F72746F722070757275732E2050686173656C6C757320696E206C6563747573206672696E67696C6C612074656C6C757320706F72747469746F72207665686963756C61207574206665726D656E74756D206D65747573206C6F72656D20697073756D20646F6C6F722073697420616D6574206C6F72656D20697073756D20646F6C6F722073697420616D6574206E756C6C616D20636F6E736571756174206C6F72656D20697073756D20646F6C6F722073697420616D657420636F6E736571756174207665726F65726F7320657469616D2E3C2F703E0A);
INSERT INTO `property_value` VALUES ('7', '2', '10', 0x41626F7574);
INSERT INTO `property_value` VALUES ('8', '2', '11', '');
INSERT INTO `property_value` VALUES ('9', '2', '12', 0x41626F7574);
INSERT INTO `property_value` VALUES ('10', '2', '13', 0x41626F7574);
INSERT INTO `property_value` VALUES ('11', '3', '6', 0x436F6E74616374);
INSERT INTO `property_value` VALUES ('12', '3', '7', 0x436F6E74616374);
INSERT INTO `property_value` VALUES ('13', '3', '8', 0x436F6E74616374);
INSERT INTO `property_value` VALUES ('14', '3', '9', 0x436F6E74616374);
INSERT INTO `property_value` VALUES ('15', '2', '15', 0x41626F7574);
INSERT INTO `property_value` VALUES ('26', '4', '39', 0x426C6F67);
INSERT INTO `property_value` VALUES ('27', '4', '40', '');
INSERT INTO `property_value` VALUES ('28', '4', '41', 0x426C6F67);
INSERT INTO `property_value` VALUES ('29', '4', '42', 0x426C6F67);
INSERT INTO `property_value` VALUES ('30', '5', '35', 0x46697273742063617465676F7279202D20426C6F67);
INSERT INTO `property_value` VALUES ('31', '5', '36', '');
INSERT INTO `property_value` VALUES ('32', '5', '37', 0x46697273742063617465676F7279202D20426C6F67);
INSERT INTO `property_value` VALUES ('33', '5', '38', 0x46697273742063617465676F7279202D20426C6F67);
INSERT INTO `property_value` VALUES ('34', '6', '35', 0x5365636F6E642063617465676F7279202D20426C6F67);
INSERT INTO `property_value` VALUES ('35', '6', '36', '');
INSERT INTO `property_value` VALUES ('36', '6', '37', 0x5365636F6E642063617465676F7279202D20426C6F67);
INSERT INTO `property_value` VALUES ('37', '6', '38', 0x5365636F6E642063617465676F7279202D20426C6F67);
INSERT INTO `property_value` VALUES ('38', '7', '32', 0x54776F20436F6C756D6E20233220286C6566742D68616E64207369646562617229);
INSERT INTO `property_value` VALUES ('39', '7', '33', 0x323031332F30352F32352030323A33323A3137);
INSERT INTO `property_value` VALUES ('40', '7', '34', 0x3C703E0A2020202053757370656E64697373652066617563696275732064696374756D2074656C6C757320696420706F73756572652E204372617320717569732065726F732074656C6C75732C20696420706F7375657265206C616375732E205072616573656E74206163206573742065726F732E20416C697175616D20656C656966656E64206E756E63207574206E6571756520636F6E736571756174207175697320737573636970697420656C69742074696E636964756E742E20467573636520696E74657264756D20677261766964612074696E636964756E742E2053656420657420616E7465206E6563206C6967756C61206672696E67696C6C6120636F6E64696D656E74756D2E204D61757269732076656C2073656D206163206C6967756C6120736564206C6F72656D20766573746962756C756D206F726E6172652076656C20736564206E6962682E2046757363652072686F6E6375732074696E636964756E7420616E74652C206E6F6E2068656E647265726974206D61676E6120766573746962756C756D20717569732E20496E74656765722076656C20656E696D2073656D2070686173656C6C75732074656D707573206C6F72656D2E3C2F703E0A3C703E0A202020204D616563656E61732076656C206D61757269732073697420616D657420617567756520616363756D73616E2074656D706F72206E6F6E20696E2073617069656E2E204E756C6C6120666163696C6973692E20416C697175616D20696D706572646965742073656D206574206F7263692061646970697363696E67207665686963756C61207361676974746973206D6574757320636F6E73656374657475722E204D617572697320612064756920646F6C6F72206D61676E612074726973746971756520636F6E64696D656E74756D206E6563207574206C6967756C612E20536564206575206172637520696E206E6571756520706F72746120696163756C69732E204D6175726973206665726D656E74756D2076656C69742073697420616D6574206C656F20636F6E76616C6C697320636F6E73656374657475722E2055742076656C206C696265726F206475692C206575207665686963756C612076656C69742E204D616563656E6173206574206A7573746F207669746165206C616375732076656E656E61746973207665686963756C612E205574206567657420706F7375657265206172637520646F6C6F726520626C616E6469742E3C2F703E0A3C703E0A2020202041656E65616E206E656320747572706973206163206C6967756C6120706F737565726520656C656966656E642073656420612065726F732E20496E7465676572206E6563206E69626820696E74657264756D206E756C6C61206672696E67696C6C6120756C747269636965732E20496E74656765722073656D7065722066656C697320657520616E746520636F6E677565206469676E697373696D2E205072616573656E742072686F6E637573206E756C6C61207365642066656C69732072686F6E63757320657420696163756C6973207269737573206D61747469732E204E616D20736564207075727573206475692C2061206567657374617320656E696D2E20446F6E656320666163696C697369732C20656E696D206964206665726D656E74756D206D61747469732C2074656C6C7573206C696265726F20756C74726963696573206D617373612C20657520626962656E64756D20617567756520697073756D2073697420616D6574206C6967756C612E2050726F696E20706F72746120736167697474697320657261742061632070686172657472612E2041656E65616E20756C7472696369657320656E696D206964206D69206C6163696E69612072686F6E6375732E204E756E6320766F6C75747061742C207475727069732076656C20706F7274612074696E636964756E742C206C6563747573206D65747573206665726D656E74756D206C65637475732C2073656420736F64616C65732065726174206E697369206E6F6E20646F6C6F722E2050656C6C656E7465737175652076697461652066656C69732065676574207475727069732072757472756D206D616C65737561646120696E206E6F6E207175616D2E204D6175726973206174206C6F72656D2076656C206E756E6320747269737469717565207363656C657269737175652073697420616D6574206964206E69736C2E20446F6E6563206174206E697369206D61676E612C20696E207072657469756D206C6967756C612E20536564206C616375732061756775652C207361676974746973206574206772617669646120766976657272612C20696D70657264696574206567657420656C69742E204D6F726269206D616C657375616461206C6967756C612E2050726F696E20706F72746120736167697474697320657261742061632070686172657472612E2041656E65616E20756C7472696369657320656E696D206964206D69206C6163696E69612072686F6E6375732E204E756E6320766F6C75747061742C207475727069732076656C20706F7274612074696E636964756E742C206C6563747573206D65747573206665726D656E74756D206C65637475732C2073656420736F64616C6573206572617420696D706572646965742073656D206574206F7263692061646970697363696E67207665686963756C61207361676974746973206D6574757320636F6E73656374657475722E204D617572697320612064756920646F6C6F72206D61676E612074726973746971756520636F6E64696D656E74756D206E6563207574206C6967756C612E20536564206575206172637520696E206E6571756520706F72746120696163756C69732E204D6175726973206665726D656E74756D2076656C69742073697420616D6574206C656F20636F6E76616C6C697320636F6E73656374657475722E2055742076656C206C696265726F206475692C206575207665686963756C612076656C69742E204D616563656E6173206574206A7573746F206E697369206E6F6E20646F6C6F722E2050656C6C656E7465737175652076697461652066656C69732065676574207475727069732072757472756D206D616C65737561646120696E206E6F6E207175616D2E204D6175726973206174206C6F72656D2076656C206E756E6320747269737469717565207363656C657269737175652073697420616D6574206964206E69736C2E20446F6E6563206174206E697369206D61676E612C20696E207072657469756D206C6967756C612E20536564206C616375732061756775652C207361676974746973206574206772617669646120766976657272612C20696D70657264696574206567657420656C69742E204D6F726269206D616C657375616461206D61757269732065752065726F732072757472756D20626C616E6469742E2043726173206D616C6573756164612072757472756D2073656D2C206163207665686963756C61206469616D20766F6C75747061742061632E20566573746962756C756D2073656420746F72746F722070757275732E2050686173656C6C757320696E206C6563747573206672696E67696C6C612074656C6C757320706F72747469746F72207665686963756C61207574206665726D656E74756D206D65747573206C6F72656D20697073756D20646F6C6F722073697420616D6574206C6F72656D20697073756D20646F6C6F722073697420616D6574206E756C6C616D20636F6E736571756174206C6F72656D20697073756D20646F6C6F722073697420616D657420636F6E736571756174207665726F65726F7320657469616D2E3C2F703E0A);
INSERT INTO `property_value` VALUES ('41', '7', '26', 0x3C703E0A2020202053757370656E64697373652066617563696275732064696374756D2074656C6C757320696420706F73756572652E204372617320717569732065726F732074656C6C75732C20696420706F7375657265206C616375732E205072616573656E74206163206573742065726F732E20416C697175616D20656C656966656E64206E756E63207574206E6571756520636F6E736571756174207175697320737573636970697420656C69742074696E636964756E742E20467573636520696E74657264756D20677261766964612074696E636964756E742E2053656420657420616E7465206E6563206C6967756C61206672696E67696C6C6120636F6E64696D656E74756D2E204D61757269732076656C2073656D206163206C6967756C6120736564206C6F72656D20766573746962756C756D206F726E6172652076656C20736564206E6962682E2046757363652072686F6E6375732074696E636964756E7420616E74652C206E6F6E2068656E647265726974206D61676E6120766573746962756C756D20717569732E20496E74656765722076656C20656E696D2073656D2070686173656C6C75732074656D707573206C6F72656D2E3C2F703E0A);
INSERT INTO `property_value` VALUES ('42', '7', '27', 0x623A303B);
INSERT INTO `property_value` VALUES ('43', '7', '28', 0x54776F20436F6C756D6E202332);
INSERT INTO `property_value` VALUES ('44', '7', '29', '');
INSERT INTO `property_value` VALUES ('45', '7', '30', 0x54776F20436F6C756D6E202332);
INSERT INTO `property_value` VALUES ('46', '7', '31', 0x54776F20436F6C756D6E202332);
INSERT INTO `property_value` VALUES ('47', '8', '32', 0x54776F20436F6C756D6E20233220286C6566742D68616E64207369646562617229);
INSERT INTO `property_value` VALUES ('48', '8', '33', 0x323031332F30352F32352030323A33333A3039);
INSERT INTO `property_value` VALUES ('49', '8', '34', 0x3C703E0A2020202053757370656E64697373652066617563696275732064696374756D2074656C6C757320696420706F73756572652E204372617320717569732065726F732074656C6C75732C20696420706F7375657265206C616375732E205072616573656E74206163206573742065726F732E20416C697175616D20656C656966656E64206E756E63207574206E6571756520636F6E736571756174207175697320737573636970697420656C69742074696E636964756E742E20467573636520696E74657264756D20677261766964612074696E636964756E742E2053656420657420616E7465206E6563206C6967756C61206672696E67696C6C6120636F6E64696D656E74756D2E204D61757269732076656C2073656D206163206C6967756C6120736564206C6F72656D20766573746962756C756D206F726E6172652076656C20736564206E6962682E2046757363652072686F6E6375732074696E636964756E7420616E74652C206E6F6E2068656E647265726974206D61676E6120766573746962756C756D20717569732E20496E74656765722076656C20656E696D2073656D2070686173656C6C75732074656D707573206C6F72656D2E3C2F703E0A3C703E0A202020204D616563656E61732076656C206D61757269732073697420616D657420617567756520616363756D73616E2074656D706F72206E6F6E20696E2073617069656E2E204E756C6C6120666163696C6973692E20416C697175616D20696D706572646965742073656D206574206F7263692061646970697363696E67207665686963756C61207361676974746973206D6574757320636F6E73656374657475722E204D617572697320612064756920646F6C6F72206D61676E612074726973746971756520636F6E64696D656E74756D206E6563207574206C6967756C612E20536564206575206172637520696E206E6571756520706F72746120696163756C69732E204D6175726973206665726D656E74756D2076656C69742073697420616D6574206C656F20636F6E76616C6C697320636F6E73656374657475722E2055742076656C206C696265726F206475692C206575207665686963756C612076656C69742E204D616563656E6173206574206A7573746F207669746165206C616375732076656E656E61746973207665686963756C612E205574206567657420706F7375657265206172637520646F6C6F726520626C616E6469742E3C2F703E0A3C703E0A2020202041656E65616E206E656320747572706973206163206C6967756C6120706F737565726520656C656966656E642073656420612065726F732E20496E7465676572206E6563206E69626820696E74657264756D206E756C6C61206672696E67696C6C6120756C747269636965732E20496E74656765722073656D7065722066656C697320657520616E746520636F6E677565206469676E697373696D2E205072616573656E742072686F6E637573206E756C6C61207365642066656C69732072686F6E63757320657420696163756C6973207269737573206D61747469732E204E616D20736564207075727573206475692C2061206567657374617320656E696D2E20446F6E656320666163696C697369732C20656E696D206964206665726D656E74756D206D61747469732C2074656C6C7573206C696265726F20756C74726963696573206D617373612C20657520626962656E64756D20617567756520697073756D2073697420616D6574206C6967756C612E2050726F696E20706F72746120736167697474697320657261742061632070686172657472612E2041656E65616E20756C7472696369657320656E696D206964206D69206C6163696E69612072686F6E6375732E204E756E6320766F6C75747061742C207475727069732076656C20706F7274612074696E636964756E742C206C6563747573206D65747573206665726D656E74756D206C65637475732C2073656420736F64616C65732065726174206E697369206E6F6E20646F6C6F722E2050656C6C656E7465737175652076697461652066656C69732065676574207475727069732072757472756D206D616C65737561646120696E206E6F6E207175616D2E204D6175726973206174206C6F72656D2076656C206E756E6320747269737469717565207363656C657269737175652073697420616D6574206964206E69736C2E20446F6E6563206174206E697369206D61676E612C20696E207072657469756D206C6967756C612E20536564206C616375732061756775652C207361676974746973206574206772617669646120766976657272612C20696D70657264696574206567657420656C69742E204D6F726269206D616C657375616461206C6967756C612E2050726F696E20706F72746120736167697474697320657261742061632070686172657472612E2041656E65616E20756C7472696369657320656E696D206964206D69206C6163696E69612072686F6E6375732E204E756E6320766F6C75747061742C207475727069732076656C20706F7274612074696E636964756E742C206C6563747573206D65747573206665726D656E74756D206C65637475732C2073656420736F64616C6573206572617420696D706572646965742073656D206574206F7263692061646970697363696E67207665686963756C61207361676974746973206D6574757320636F6E73656374657475722E204D617572697320612064756920646F6C6F72206D61676E612074726973746971756520636F6E64696D656E74756D206E6563207574206C6967756C612E20536564206575206172637520696E206E6571756520706F72746120696163756C69732E204D6175726973206665726D656E74756D2076656C69742073697420616D6574206C656F20636F6E76616C6C697320636F6E73656374657475722E2055742076656C206C696265726F206475692C206575207665686963756C612076656C69742E204D616563656E6173206574206A7573746F206E697369206E6F6E20646F6C6F722E2050656C6C656E7465737175652076697461652066656C69732065676574207475727069732072757472756D206D616C65737561646120696E206E6F6E207175616D2E204D6175726973206174206C6F72656D2076656C206E756E6320747269737469717565207363656C657269737175652073697420616D6574206964206E69736C2E20446F6E6563206174206E697369206D61676E612C20696E207072657469756D206C6967756C612E20536564206C616375732061756775652C207361676974746973206574206772617669646120766976657272612C20696D70657264696574206567657420656C69742E204D6F726269206D616C657375616461206D61757269732065752065726F732072757472756D20626C616E6469742E2043726173206D616C6573756164612072757472756D2073656D2C206163207665686963756C61206469616D20766F6C75747061742061632E20566573746962756C756D2073656420746F72746F722070757275732E2050686173656C6C757320696E206C6563747573206672696E67696C6C612074656C6C757320706F72747469746F72207665686963756C61207574206665726D656E74756D206D65747573206C6F72656D20697073756D20646F6C6F722073697420616D6574206C6F72656D20697073756D20646F6C6F722073697420616D6574206E756C6C616D20636F6E736571756174206C6F72656D20697073756D20646F6C6F722073697420616D657420636F6E736571756174207665726F65726F7320657469616D2E3C2F703E0A);
INSERT INTO `property_value` VALUES ('50', '8', '26', 0x3C703E0A2020202053757370656E64697373652066617563696275732064696374756D2074656C6C757320696420706F73756572652E204372617320717569732065726F732074656C6C75732C20696420706F7375657265206C616375732E205072616573656E74206163206573742065726F732E20416C697175616D20656C656966656E64206E756E63207574206E6571756520636F6E736571756174207175697320737573636970697420656C69742074696E636964756E742E20467573636520696E74657264756D20677261766964612074696E636964756E742E2053656420657420616E7465206E6563206C6967756C61206672696E67696C6C6120636F6E64696D656E74756D2E204D61757269732076656C2073656D206163206C6967756C6120736564206C6F72656D20766573746962756C756D206F726E6172652076656C20736564206E6962682E2046757363652072686F6E6375732074696E636964756E7420616E74652C206E6F6E2068656E647265726974206D61676E6120766573746962756C756D20717569732E20496E74656765722076656C20656E696D2073656D2070686173656C6C75732074656D707573206C6F72656D2E3C2F703E0A);
INSERT INTO `property_value` VALUES ('51', '8', '27', 0x623A303B);
INSERT INTO `property_value` VALUES ('52', '8', '28', 0x54776F20436F6C756D6E202332);
INSERT INTO `property_value` VALUES ('53', '8', '29', '');
INSERT INTO `property_value` VALUES ('54', '8', '30', 0x54776F20436F6C756D6E202332);
INSERT INTO `property_value` VALUES ('55', '8', '31', 0x54776F20436F6C756D6E202332);
INSERT INTO `property_value` VALUES ('56', '4', '44', 0x613A313A7B693A303B613A323A7B693A303B613A313A7B733A353A2276616C7565223B733A31363A2241626F75742053696C766572426C6F67223B7D693A313B613A313A7B733A353A2276616C7565223B733A3231313A223C703E0A0D0953696C766572426C6F6720697320612066726565204353532054656D706C6174652072656C656173656420756E64657220474E552047504C206C6963656E73652E20596F7520617265206672656520746F20757365202F206D6F6469667920697420696E20616E792077617920796F752077616E7420776974686F757420616E79207265737472696374696F6E732E2041206C696E6B206261636B20746F207468697320776562736974652077696C6C20616C776179732062652061707072656369617465642E3C2F703E0A0D223B7D7D7D);
INSERT INTO `property_value` VALUES ('57', '2', '48', 0x4E3B);
INSERT INTO `property_value` VALUES ('58', '4', '49', 0x613A353A7B733A353A2276616C7565223B733A33353A222F6D656469612F66696C65732F342F34392F353161623139373335646164322E6A7067223B733A353A227769647468223B693A3230343B733A363A22686569676874223B693A3132383B733A343A2268746D6C223B693A323B733A343A226D696D65223B733A31303A22696D6167652F6A706567223B7D);
INSERT INTO `property_value` VALUES ('59', '4', '50', 0x3C68333E0A20202020466561747572656420436F6E74656E743C2F68333E0A3C703E0A202020204C6F72656D61207073756D20646F6C6F722073697420616D65742C20636F6E73656374657475722061646970697363696E6720656C69742E20496E7465676572206567657374617320707572757320626962656E64756D206E6571756520616C697175616D20757420706F737565726520656C69742073656D7065722E2046757363652073616769747469732070686172657472612065726F732C2073697420616D657420636F6E7365717561742073656D206D6F6C6C69732076697461652E3C2F703E0A);

-- ----------------------------
-- Table structure for script
-- ----------------------------
DROP TABLE IF EXISTS `script`;
CREATE TABLE `script` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `identifier` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`identifier`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of script
-- ----------------------------
INSERT INTO `script` VALUES ('1', '2012-09-20 22:26:23', '2012-09-20 22:26:23', 'Contact', 'contact', 'Contact ');

-- ----------------------------
-- Table structure for tab
-- ----------------------------
DROP TABLE IF EXISTS `tab`;
CREATE TABLE `tab` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sort_order` int(11) DEFAULT '0',
  `document_type_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of tab
-- ----------------------------
INSERT INTO `tab` VALUES ('4', 'Content', 'Content', '1', '3');
INSERT INTO `tab` VALUES ('7', 'Title and meta', 'Meta description', '1', '2');
INSERT INTO `tab` VALUES ('8', 'Title and meta', 'Meta description', '3', '3');
INSERT INTO `tab` VALUES ('11', 'Content', 'Content', '2', '4');
INSERT INTO `tab` VALUES ('12', 'Relay', 'Relay', '3', '4');
INSERT INTO `tab` VALUES ('13', 'Title and meta', 'Meta description', '4', '4');
INSERT INTO `tab` VALUES ('14', 'Title and meta', 'Meta description', '2', '5');
INSERT INTO `tab` VALUES ('15', 'Title and meta', 'Meta description', '3', '6');
INSERT INTO `tab` VALUES ('16', 'Sidebar', 'Sidebar text', '2', '6');
INSERT INTO `tab` VALUES ('17', 'Sidebar', 'Sidebar text', '1', '5');
INSERT INTO `tab` VALUES ('18', 'Sidebar', 'Sidebar text', '1', '4');
INSERT INTO `tab` VALUES ('19', 'Sidebar', 'Sidebar text', '2', '2');
INSERT INTO `tab` VALUES ('20', 'Sidebar', 'Sidebar text', '2', '3');
INSERT INTO `tab` VALUES ('21', 'Featured', 'Featured content', '1', '6');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `lastname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `firstname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `login` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `retrieve_password_key` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `retrieve_updated_at` datetime DEFAULT NULL,
  `active` tinyint(1) DEFAULT '1',
  `user_acl_role_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`email`),
  KEY `fk_user_user_acl_role` (`user_acl_role_id`),
  CONSTRAINT `fk_user_user_acl_role` FOREIGN KEY (`user_acl_role_id`) REFERENCES `user_acl_role` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', '2016-12-16 10:42:16', '2016-12-16 10:42:16', 'Lee', 'Quan ', 'quan.le350@gmail.com', 'admin', '77074fc3ce9ade0a8da262f59ee79f51d1ff675f', null, null, '1', '1');

-- ----------------------------
-- Table structure for user_acl
-- ----------------------------
DROP TABLE IF EXISTS `user_acl`;
CREATE TABLE `user_acl` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_acl_permission_id` int(11) NOT NULL,
  `user_acl_role_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_user_acl_permission_user_acl_role` (`user_acl_role_id`),
  KEY `fk_user_acl_user_acl_permission` (`user_acl_permission_id`),
  CONSTRAINT `fk_user_acl_permission_user_acl_role` FOREIGN KEY (`user_acl_role_id`) REFERENCES `user_acl_role` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_user_acl_user_acl_permission` FOREIGN KEY (`user_acl_permission_id`) REFERENCES `user_acl_permission` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of user_acl
-- ----------------------------
INSERT INTO `user_acl` VALUES ('1', '13', '2');
INSERT INTO `user_acl` VALUES ('2', '14', '2');
INSERT INTO `user_acl` VALUES ('3', '15', '2');

-- ----------------------------
-- Table structure for user_acl_permission
-- ----------------------------
DROP TABLE IF EXISTS `user_acl_permission`;
CREATE TABLE `user_acl_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `permission` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `user_acl_resource_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_user_acl_permission_user_acl_resource` (`user_acl_resource_id`),
  CONSTRAINT `fk_user_acl_permission_user_acl_resource` FOREIGN KEY (`user_acl_resource_id`) REFERENCES `user_acl_resource` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of user_acl_permission
-- ----------------------------
INSERT INTO `user_acl_permission` VALUES ('1', 'user/list', '1');
INSERT INTO `user_acl_permission` VALUES ('2', 'user/create', '1');
INSERT INTO `user_acl_permission` VALUES ('3', 'user/edit', '1');
INSERT INTO `user_acl_permission` VALUES ('4', 'user/delete', '1');
INSERT INTO `user_acl_permission` VALUES ('5', 'config/system', '1');
INSERT INTO `user_acl_permission` VALUES ('6', 'config/general', '1');
INSERT INTO `user_acl_permission` VALUES ('7', 'config/server', '1');
INSERT INTO `user_acl_permission` VALUES ('8', 'config/update', '1');
INSERT INTO `user_acl_permission` VALUES ('9', 'role/list', '1');
INSERT INTO `user_acl_permission` VALUES ('10', 'role/create', '1');
INSERT INTO `user_acl_permission` VALUES ('11', 'role/edit', '1');
INSERT INTO `user_acl_permission` VALUES ('12', 'role/delete', '1');
INSERT INTO `user_acl_permission` VALUES ('13', 'media', '2');
INSERT INTO `user_acl_permission` VALUES ('14', 'document', '2');
INSERT INTO `user_acl_permission` VALUES ('15', 'translation', '2');
INSERT INTO `user_acl_permission` VALUES ('16', 'view/list', '3');
INSERT INTO `user_acl_permission` VALUES ('17', 'view/create', '3');
INSERT INTO `user_acl_permission` VALUES ('18', 'view/edit', '3');
INSERT INTO `user_acl_permission` VALUES ('19', 'view/delete', '3');
INSERT INTO `user_acl_permission` VALUES ('20', 'layout/list', '3');
INSERT INTO `user_acl_permission` VALUES ('21', 'layout/create', '3');
INSERT INTO `user_acl_permission` VALUES ('22', 'layout/edit', '3');
INSERT INTO `user_acl_permission` VALUES ('23', 'layout/delete', '3');
INSERT INTO `user_acl_permission` VALUES ('24', 'datatype/list', '3');
INSERT INTO `user_acl_permission` VALUES ('25', 'datatype/create', '3');
INSERT INTO `user_acl_permission` VALUES ('26', 'datatype/edit', '3');
INSERT INTO `user_acl_permission` VALUES ('27', 'datatype/delete', '3');
INSERT INTO `user_acl_permission` VALUES ('28', 'document-type/list', '3');
INSERT INTO `user_acl_permission` VALUES ('29', 'document-type/create', '3');
INSERT INTO `user_acl_permission` VALUES ('30', 'document-type/edit', '3');
INSERT INTO `user_acl_permission` VALUES ('31', 'document-type/delete', '3');
INSERT INTO `user_acl_permission` VALUES ('32', 'script/list', '3');
INSERT INTO `user_acl_permission` VALUES ('33', 'script/create', '3');
INSERT INTO `user_acl_permission` VALUES ('34', 'script/edit', '3');
INSERT INTO `user_acl_permission` VALUES ('35', 'script/delete', '3');
INSERT INTO `user_acl_permission` VALUES ('36', 'list', '4');
INSERT INTO `user_acl_permission` VALUES ('37', 'install', '4');
INSERT INTO `user_acl_permission` VALUES ('38', 'uninstall', '4');
INSERT INTO `user_acl_permission` VALUES ('39', 'all', '5');
INSERT INTO `user_acl_permission` VALUES ('40', 'Blog', '4');
INSERT INTO `user_acl_permission` VALUES ('41', 'Sitemap', '4');
INSERT INTO `user_acl_permission` VALUES ('42', 'ActivityLog', '4');

-- ----------------------------
-- Table structure for user_acl_resource
-- ----------------------------
DROP TABLE IF EXISTS `user_acl_resource`;
CREATE TABLE `user_acl_resource` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `resource` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of user_acl_resource
-- ----------------------------
INSERT INTO `user_acl_resource` VALUES ('1', 'settings');
INSERT INTO `user_acl_resource` VALUES ('2', 'content');
INSERT INTO `user_acl_resource` VALUES ('3', 'development');
INSERT INTO `user_acl_resource` VALUES ('4', 'modules');
INSERT INTO `user_acl_resource` VALUES ('5', 'stats');

-- ----------------------------
-- Table structure for user_acl_role
-- ----------------------------
DROP TABLE IF EXISTS `user_acl_role`;
CREATE TABLE `user_acl_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of user_acl_role
-- ----------------------------
INSERT INTO `user_acl_role` VALUES ('1', 'Administrator', null);
INSERT INTO `user_acl_role` VALUES ('2', 'Writer', null);

-- ----------------------------
-- Table structure for view
-- ----------------------------
DROP TABLE IF EXISTS `view`;
CREATE TABLE `view` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `identifier` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`identifier`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of view
-- ----------------------------
INSERT INTO `view` VALUES ('1', '2012-09-19 19:29:04', '2013-06-02 12:22:18', 'Home page', 'home', 'Home page content');
INSERT INTO `view` VALUES ('3', '2012-09-19 19:32:56', '2013-06-02 12:22:18', 'Contact', 'contact', 'Contact form');
INSERT INTO `view` VALUES ('4', '2012-09-19 19:33:51', '2013-06-02 12:22:18', 'One column', 'one-column', 'One column page');
INSERT INTO `view` VALUES ('6', '2012-10-25 19:57:05', '2013-06-02 12:22:18', 'Flash messages', 'flash-messages', 'Flash messages displayer');
INSERT INTO `view` VALUES ('7', '2013-05-20 15:52:38', '2013-06-02 12:22:18', 'Paginator', 'paginator', 'Paginator control');
INSERT INTO `view` VALUES ('11', '2013-05-24 19:02:58', '2013-06-02 12:22:18', 'Blog ticket', 'blog-ticket', 'Simple blog ticket');
INSERT INTO `view` VALUES ('12', '2013-05-27 08:55:24', '2013-06-02 12:22:18', 'Sidebar', 'sidebar', 'Sidebar');
