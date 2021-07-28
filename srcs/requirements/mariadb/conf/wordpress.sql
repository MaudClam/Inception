-- Adminer 4.7.1 MySQL dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

SET NAMES utf8mb4;

DROP TABLE IF EXISTS `wp_commentmeta`;
CREATE TABLE `wp_commentmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `comment_id` bigint(20) unsigned NOT NULL DEFAULT 0,
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`meta_id`),
  KEY `comment_id` (`comment_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `wp_comments`;
CREATE TABLE `wp_comments` (
  `comment_ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `comment_post_ID` bigint(20) unsigned NOT NULL DEFAULT 0,
  `comment_author` tinytext COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment_author_email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_author_url` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_author_IP` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment_karma` int(11) NOT NULL DEFAULT 0,
  `comment_approved` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `comment_agent` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_parent` bigint(20) unsigned NOT NULL DEFAULT 0,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`comment_ID`),
  KEY `comment_post_ID` (`comment_post_ID`),
  KEY `comment_approved_date_gmt` (`comment_approved`,`comment_date_gmt`),
  KEY `comment_date_gmt` (`comment_date_gmt`),
  KEY `comment_parent` (`comment_parent`),
  KEY `comment_author_email` (`comment_author_email`(10))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `wp_comments` (`comment_ID`, `comment_post_ID`, `comment_author`, `comment_author_email`, `comment_author_url`, `comment_author_IP`, `comment_date`, `comment_date_gmt`, `comment_content`, `comment_karma`, `comment_approved`, `comment_agent`, `comment_type`, `comment_parent`, `user_id`) VALUES
(1,	1,	'A WordPress Commenter',	'wapuu@wordpress.example',	'https://wordpress.org/',	'',	'2021-07-28 20:26:38',	'2021-07-28 17:26:38',	'Hi, this is a comment.\nTo get started with moderating, editing, and deleting comments, please visit the Comments screen in the dashboard.\nCommenter avatars come from <a href=\"https://gravatar.com\">Gravatar</a>.',	0,	'post-trashed',	'',	'',	0,	0)
ON DUPLICATE KEY UPDATE `comment_ID` = VALUES(`comment_ID`), `comment_post_ID` = VALUES(`comment_post_ID`), `comment_author` = VALUES(`comment_author`), `comment_author_email` = VALUES(`comment_author_email`), `comment_author_url` = VALUES(`comment_author_url`), `comment_author_IP` = VALUES(`comment_author_IP`), `comment_date` = VALUES(`comment_date`), `comment_date_gmt` = VALUES(`comment_date_gmt`), `comment_content` = VALUES(`comment_content`), `comment_karma` = VALUES(`comment_karma`), `comment_approved` = VALUES(`comment_approved`), `comment_agent` = VALUES(`comment_agent`), `comment_type` = VALUES(`comment_type`), `comment_parent` = VALUES(`comment_parent`), `user_id` = VALUES(`user_id`);

DROP TABLE IF EXISTS `wp_links`;
CREATE TABLE `wp_links` (
  `link_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `link_url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_target` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_visible` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Y',
  `link_owner` bigint(20) unsigned NOT NULL DEFAULT 1,
  `link_rating` int(11) NOT NULL DEFAULT 0,
  `link_updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `link_rel` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_notes` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `link_rss` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`link_id`),
  KEY `link_visible` (`link_visible`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `wp_options`;
CREATE TABLE `wp_options` (
  `option_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `option_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `option_value` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `autoload` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'yes',
  PRIMARY KEY (`option_id`),
  UNIQUE KEY `option_name` (`option_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(1,	'siteurl',	'https://mclam.42.fr',	'yes'),
(2,	'home',	'https://mclam.42.fr',	'yes'),
(3,	'blogname',	'mclam.42.fr',	'yes'),
(4,	'blogdescription',	'Ещё один сайт на WordPress',	'yes'),
(5,	'users_can_register',	'1',	'yes'),
(6,	'admin_email',	'muru@me.com',	'yes'),
(7,	'start_of_week',	'1',	'yes'),
(8,	'use_balanceTags',	'0',	'yes'),
(9,	'use_smilies',	'1',	'yes'),
(10,	'require_name_email',	'1',	'yes'),
(11,	'comments_notify',	'1',	'yes'),
(12,	'posts_per_rss',	'10',	'yes'),
(13,	'rss_use_excerpt',	'0',	'yes'),
(14,	'mailserver_url',	'mail.example.com',	'yes'),
(15,	'mailserver_login',	'login@example.com',	'yes'),
(16,	'mailserver_pass',	'password',	'yes'),
(17,	'mailserver_port',	'110',	'yes'),
(18,	'default_category',	'1',	'yes'),
(19,	'default_comment_status',	'open',	'yes'),
(20,	'default_ping_status',	'open',	'yes'),
(21,	'default_pingback_flag',	'0',	'yes'),
(22,	'posts_per_page',	'10',	'yes'),
(23,	'date_format',	'd.m.Y',	'yes'),
(24,	'time_format',	'H:i',	'yes'),
(25,	'links_updated_date_format',	'd.m.Y H:i',	'yes'),
(26,	'comment_moderation',	'0',	'yes'),
(27,	'moderation_notify',	'1',	'yes'),
(28,	'permalink_structure',	'',	'yes'),
(29,	'rewrite_rules',	'',	'yes'),
(30,	'hack_file',	'0',	'yes'),
(31,	'blog_charset',	'UTF-8',	'yes'),
(32,	'moderation_keys',	'',	'no'),
(33,	'active_plugins',	'a:0:{}',	'yes'),
(34,	'category_base',	'',	'yes'),
(35,	'ping_sites',	'http://rpc.pingomatic.com/',	'yes'),
(36,	'comment_max_links',	'2',	'yes'),
(37,	'gmt_offset',	'3',	'yes'),
(38,	'default_email_category',	'1',	'yes'),
(39,	'recently_edited',	'',	'no'),
(40,	'template',	'teluro',	'yes'),
(41,	'stylesheet',	'teluro',	'yes'),
(42,	'comment_whitelist',	'1',	'yes'),
(43,	'blacklist_keys',	'',	'no'),
(44,	'comment_registration',	'0',	'yes'),
(45,	'html_type',	'text/html',	'yes'),
(46,	'use_trackback',	'0',	'yes'),
(47,	'default_role',	'subscriber',	'yes'),
(48,	'db_version',	'43764',	'yes'),
(49,	'uploads_use_yearmonth_folders',	'1',	'yes'),
(50,	'upload_path',	'',	'yes'),
(51,	'blog_public',	'0',	'yes'),
(52,	'default_link_category',	'2',	'yes'),
(53,	'show_on_front',	'posts',	'yes'),
(54,	'tag_base',	'',	'yes'),
(55,	'show_avatars',	'1',	'yes'),
(56,	'avatar_rating',	'G',	'yes'),
(57,	'upload_url_path',	'',	'yes'),
(58,	'thumbnail_size_w',	'150',	'yes'),
(59,	'thumbnail_size_h',	'150',	'yes'),
(60,	'thumbnail_crop',	'1',	'yes'),
(61,	'medium_size_w',	'300',	'yes'),
(62,	'medium_size_h',	'300',	'yes'),
(63,	'avatar_default',	'mystery',	'yes'),
(64,	'large_size_w',	'1024',	'yes'),
(65,	'large_size_h',	'1024',	'yes'),
(66,	'image_default_link_type',	'none',	'yes'),
(67,	'image_default_size',	'',	'yes'),
(68,	'image_default_align',	'',	'yes'),
(69,	'close_comments_for_old_posts',	'0',	'yes'),
(70,	'close_comments_days_old',	'14',	'yes'),
(71,	'thread_comments',	'1',	'yes'),
(72,	'thread_comments_depth',	'5',	'yes'),
(73,	'page_comments',	'0',	'yes'),
(74,	'comments_per_page',	'50',	'yes'),
(75,	'default_comments_page',	'newest',	'yes'),
(76,	'comment_order',	'asc',	'yes'),
(77,	'sticky_posts',	'a:0:{}',	'yes'),
(78,	'widget_categories',	'a:2:{i:2;a:4:{s:5:\"title\";s:0:\"\";s:5:\"count\";i:0;s:12:\"hierarchical\";i:0;s:8:\"dropdown\";i:0;}s:12:\"_multiwidget\";i:1;}',	'yes'),
(79,	'widget_text',	'a:2:{i:1;a:0:{}s:12:\"_multiwidget\";i:1;}',	'yes'),
(80,	'widget_rss',	'a:2:{i:1;a:0:{}s:12:\"_multiwidget\";i:1;}',	'yes'),
(81,	'uninstall_plugins',	'a:0:{}',	'no'),
(82,	'timezone_string',	'',	'yes'),
(83,	'page_for_posts',	'0',	'yes'),
(84,	'page_on_front',	'0',	'yes'),
(85,	'default_post_format',	'0',	'yes'),
(86,	'link_manager_enabled',	'0',	'yes'),
(87,	'finished_splitting_shared_terms',	'1',	'yes'),
(88,	'site_icon',	'0',	'yes'),
(89,	'medium_large_size_w',	'768',	'yes'),
(90,	'medium_large_size_h',	'0',	'yes'),
(91,	'wp_page_for_privacy_policy',	'3',	'yes'),
(92,	'show_comments_cookies_opt_in',	'0',	'yes'),
(93,	'initial_db_version',	'43764',	'yes'),
(94,	'wp_user_roles',	'a:5:{s:13:\"administrator\";a:2:{s:4:\"name\";s:13:\"Administrator\";s:12:\"capabilities\";a:61:{s:13:\"switch_themes\";b:1;s:11:\"edit_themes\";b:1;s:16:\"activate_plugins\";b:1;s:12:\"edit_plugins\";b:1;s:10:\"edit_users\";b:1;s:10:\"edit_files\";b:1;s:14:\"manage_options\";b:1;s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:6:\"import\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:8:\"level_10\";b:1;s:7:\"level_9\";b:1;s:7:\"level_8\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;s:12:\"delete_users\";b:1;s:12:\"create_users\";b:1;s:17:\"unfiltered_upload\";b:1;s:14:\"edit_dashboard\";b:1;s:14:\"update_plugins\";b:1;s:14:\"delete_plugins\";b:1;s:15:\"install_plugins\";b:1;s:13:\"update_themes\";b:1;s:14:\"install_themes\";b:1;s:11:\"update_core\";b:1;s:10:\"list_users\";b:1;s:12:\"remove_users\";b:1;s:13:\"promote_users\";b:1;s:18:\"edit_theme_options\";b:1;s:13:\"delete_themes\";b:1;s:6:\"export\";b:1;}}s:6:\"editor\";a:2:{s:4:\"name\";s:6:\"Editor\";s:12:\"capabilities\";a:34:{s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;}}s:6:\"author\";a:2:{s:4:\"name\";s:6:\"Author\";s:12:\"capabilities\";a:10:{s:12:\"upload_files\";b:1;s:10:\"edit_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:4:\"read\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:12:\"delete_posts\";b:1;s:22:\"delete_published_posts\";b:1;}}s:11:\"contributor\";a:2:{s:4:\"name\";s:11:\"Contributor\";s:12:\"capabilities\";a:5:{s:10:\"edit_posts\";b:1;s:4:\"read\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:12:\"delete_posts\";b:1;}}s:10:\"subscriber\";a:2:{s:4:\"name\";s:10:\"Subscriber\";s:12:\"capabilities\";a:2:{s:4:\"read\";b:1;s:7:\"level_0\";b:1;}}}',	'yes'),
(95,	'fresh_site',	'0',	'yes'),
(96,	'WPLANG',	'ru_RU',	'yes'),
(97,	'widget_search',	'a:2:{i:2;a:1:{s:5:\"title\";s:0:\"\";}s:12:\"_multiwidget\";i:1;}',	'yes'),
(98,	'widget_recent-posts',	'a:2:{i:2;a:2:{s:5:\"title\";s:0:\"\";s:6:\"number\";i:5;}s:12:\"_multiwidget\";i:1;}',	'yes'),
(99,	'widget_recent-comments',	'a:2:{i:2;a:2:{s:5:\"title\";s:0:\"\";s:6:\"number\";i:5;}s:12:\"_multiwidget\";i:1;}',	'yes'),
(100,	'widget_archives',	'a:2:{i:2;a:3:{s:5:\"title\";s:0:\"\";s:5:\"count\";i:0;s:8:\"dropdown\";i:0;}s:12:\"_multiwidget\";i:1;}',	'yes'),
(101,	'widget_meta',	'a:2:{i:2;a:1:{s:5:\"title\";s:0:\"\";}s:12:\"_multiwidget\";i:1;}',	'yes'),
(102,	'sidebars_widgets',	'a:3:{s:19:\"wp_inactive_widgets\";a:0:{}s:9:\"sidebar-1\";a:6:{i:0;s:8:\"search-2\";i:1;s:14:\"recent-posts-2\";i:2;s:17:\"recent-comments-2\";i:3;s:10:\"archives-2\";i:4;s:12:\"categories-2\";i:5;s:6:\"meta-2\";}s:13:\"array_version\";i:3;}',	'yes'),
(103,	'widget_pages',	'a:1:{s:12:\"_multiwidget\";i:1;}',	'yes'),
(104,	'widget_calendar',	'a:1:{s:12:\"_multiwidget\";i:1;}',	'yes'),
(105,	'widget_media_audio',	'a:1:{s:12:\"_multiwidget\";i:1;}',	'yes'),
(106,	'widget_media_image',	'a:1:{s:12:\"_multiwidget\";i:1;}',	'yes'),
(107,	'widget_media_gallery',	'a:1:{s:12:\"_multiwidget\";i:1;}',	'yes'),
(108,	'widget_media_video',	'a:1:{s:12:\"_multiwidget\";i:1;}',	'yes'),
(109,	'widget_tag_cloud',	'a:1:{s:12:\"_multiwidget\";i:1;}',	'yes'),
(110,	'widget_nav_menu',	'a:1:{s:12:\"_multiwidget\";i:1;}',	'yes'),
(111,	'widget_custom_html',	'a:1:{s:12:\"_multiwidget\";i:1;}',	'yes'),
(112,	'cron',	'a:5:{i:1627493201;a:4:{s:34:\"wp_privacy_delete_old_export_files\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:6:\"hourly\";s:4:\"args\";a:0:{}s:8:\"interval\";i:3600;}}s:16:\"wp_version_check\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}s:17:\"wp_update_plugins\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}s:16:\"wp_update_themes\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}}i:1627493218;a:2:{s:19:\"wp_scheduled_delete\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}s:25:\"delete_expired_transients\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1627493284;a:1:{s:30:\"wp_scheduled_auto_draft_delete\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1627493573;a:1:{s:8:\"do_pings\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}}s:7:\"version\";i:2;}',	'yes'),
(113,	'can_compress_scripts',	'1',	'no'),
(114,	'theme_mods_twentynineteen',	'a:2:{s:18:\"custom_css_post_id\";i:-1;s:16:\"sidebars_widgets\";a:2:{s:4:\"time\";i:1627493734;s:4:\"data\";a:2:{s:19:\"wp_inactive_widgets\";a:0:{}s:9:\"sidebar-1\";a:6:{i:0;s:8:\"search-2\";i:1;s:14:\"recent-posts-2\";i:2;s:17:\"recent-comments-2\";i:3;s:10:\"archives-2\";i:4;s:12:\"categories-2\";i:5;s:6:\"meta-2\";}}}}',	'yes'),
(117,	'theme_mods_teluro',	'a:6:{s:18:\"custom_css_post_id\";i:-1;s:42:\"header_front_page.title.localProps.content\";s:27:\"Inception project 21-school\";s:45:\"header_front_page.subtitle.localProps.content\";s:20:\"by Moud Clam (mclam)\";s:36:\"header_front_page.button_group.value\";s:140:\"%5B%7B%22label%22%3A%22%D0%9A%D0%BD%D0%BE%D0%BF%D0%BA%D0%B0%22%2C%22url%22%3A%22%23%22%2C%22button_type%22%3A%220%22%2C%22index%22%3A1%7D%5D\";s:35:\"header_front_page.button_group.show\";b:0;s:18:\"nav_menu_locations\";a:1:{s:11:\"header-menu\";i:2;}}',	'yes'),
(118,	'current_theme',	'Teluro',	'yes'),
(119,	'theme_switched',	'',	'yes'),
(120,	'theme_switched_via_customizer',	'',	'yes'),
(121,	'customize_stashed_theme_mods',	'a:0:{}',	'no'),
(122,	'nav_menu_options',	'a:1:{s:8:\"auto_add\";a:0:{}}',	'yes'),
(123,	'colibri-wp-page-info-theme-notice-dismissed',	'1',	'yes'),
(124,	'new_admin_email',	'muru@me.com',	'yes')
ON DUPLICATE KEY UPDATE `option_id` = VALUES(`option_id`), `option_name` = VALUES(`option_name`), `option_value` = VALUES(`option_value`), `autoload` = VALUES(`autoload`);

DROP TABLE IF EXISTS `wp_postmeta`;
CREATE TABLE `wp_postmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` bigint(20) unsigned NOT NULL DEFAULT 0,
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`meta_id`),
  KEY `post_id` (`post_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `wp_postmeta` (`meta_id`, `post_id`, `meta_key`, `meta_value`) VALUES
(1,	2,	'_wp_page_template',	'default'),
(2,	3,	'_wp_page_template',	'default'),
(3,	1,	'_wp_trash_meta_status',	'publish'),
(4,	1,	'_wp_trash_meta_time',	'1627493268'),
(5,	1,	'_wp_desired_post_slug',	'%d0%bf%d1%80%d0%b8%d0%b2%d0%b5%d1%82-%d0%bc%d0%b8%d1%80'),
(6,	1,	'_wp_trash_meta_comments_status',	'a:1:{i:1;s:1:\"1\";}'),
(7,	6,	'_edit_lock',	'1627493526:1'),
(8,	6,	'_encloseme',	'1'),
(9,	8,	'_wp_trash_meta_status',	'publish'),
(10,	8,	'_wp_trash_meta_time',	'1627493734'),
(11,	9,	'_edit_lock',	'1627493904:1'),
(12,	9,	'_wp_trash_meta_status',	'publish'),
(13,	9,	'_wp_trash_meta_time',	'1627493910'),
(14,	10,	'_wp_trash_meta_status',	'publish'),
(15,	10,	'_wp_trash_meta_time',	'1627493991'),
(16,	11,	'_edit_lock',	'1627494290:1'),
(17,	12,	'_menu_item_type',	'custom'),
(18,	12,	'_menu_item_menu_item_parent',	'0'),
(19,	12,	'_menu_item_object_id',	'12'),
(20,	12,	'_menu_item_object',	'custom'),
(21,	12,	'_menu_item_target',	''),
(22,	12,	'_menu_item_classes',	'a:1:{i:0;s:0:\"\";}'),
(23,	12,	'_menu_item_xfn',	''),
(24,	12,	'_menu_item_url',	'https://mclam.42.fr/wp-login.php'),
(25,	13,	'_menu_item_type',	'custom'),
(26,	13,	'_menu_item_menu_item_parent',	'0'),
(27,	13,	'_menu_item_object_id',	'13'),
(28,	13,	'_menu_item_object',	'custom'),
(29,	13,	'_menu_item_target',	''),
(30,	13,	'_menu_item_classes',	'a:1:{i:0;s:0:\"\";}'),
(31,	13,	'_menu_item_xfn',	''),
(32,	13,	'_menu_item_url',	'https://mclam.42.fr/wp-signup.php'),
(33,	11,	'_wp_trash_meta_status',	'publish'),
(34,	11,	'_wp_trash_meta_time',	'1627494303'),
(35,	14,	'_edit_lock',	'1627494564:1'),
(36,	15,	'_menu_item_type',	'custom'),
(37,	15,	'_menu_item_menu_item_parent',	'0'),
(38,	15,	'_menu_item_object_id',	'15'),
(39,	15,	'_menu_item_object',	'custom'),
(40,	15,	'_menu_item_target',	''),
(41,	15,	'_menu_item_classes',	'a:1:{i:0;s:0:\"\";}'),
(42,	15,	'_menu_item_xfn',	''),
(43,	15,	'_menu_item_url',	'https://mclam.42.fr/adminer/'),
(44,	16,	'_menu_item_type',	'custom'),
(45,	16,	'_menu_item_menu_item_parent',	'0'),
(46,	16,	'_menu_item_object_id',	'16'),
(47,	16,	'_menu_item_object',	'custom'),
(48,	16,	'_menu_item_target',	''),
(49,	16,	'_menu_item_classes',	'a:1:{i:0;s:0:\"\";}'),
(50,	16,	'_menu_item_xfn',	''),
(51,	16,	'_menu_item_url',	'https://mclam.42.fr/html/'),
(52,	14,	'_wp_trash_meta_status',	'publish'),
(53,	14,	'_wp_trash_meta_time',	'1627494564')
ON DUPLICATE KEY UPDATE `meta_id` = VALUES(`meta_id`), `post_id` = VALUES(`post_id`), `meta_key` = VALUES(`meta_key`), `meta_value` = VALUES(`meta_value`);

DROP TABLE IF EXISTS `wp_posts`;
CREATE TABLE `wp_posts` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_author` bigint(20) unsigned NOT NULL DEFAULT 0,
  `post_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_title` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_excerpt` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'publish',
  `comment_status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'open',
  `ping_status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'open',
  `post_password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `post_name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `to_ping` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `pinged` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_modified_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content_filtered` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_parent` bigint(20) unsigned NOT NULL DEFAULT 0,
  `guid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `menu_order` int(11) NOT NULL DEFAULT 0,
  `post_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'post',
  `post_mime_type` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_count` bigint(20) NOT NULL DEFAULT 0,
  PRIMARY KEY (`ID`),
  KEY `post_name` (`post_name`(191)),
  KEY `type_status_date` (`post_type`,`post_status`,`post_date`,`ID`),
  KEY `post_parent` (`post_parent`),
  KEY `post_author` (`post_author`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `wp_posts` (`ID`, `post_author`, `post_date`, `post_date_gmt`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `ping_status`, `post_password`, `post_name`, `to_ping`, `pinged`, `post_modified`, `post_modified_gmt`, `post_content_filtered`, `post_parent`, `guid`, `menu_order`, `post_type`, `post_mime_type`, `comment_count`) VALUES
(1,	1,	'2021-07-28 20:26:38',	'2021-07-28 17:26:38',	'<!-- wp:paragraph -->\n<p>Welcome to WordPress. This is your first post. Edit or delete it, then start writing!</p>\n<!-- /wp:paragraph -->',	'Привет, мир!',	'',	'trash',	'open',	'open',	'',	'%d0%bf%d1%80%d0%b8%d0%b2%d0%b5%d1%82-%d0%bc%d0%b8%d1%80__trashed',	'',	'',	'2021-07-28 20:27:48',	'2021-07-28 17:27:48',	'',	0,	'https://mclam.42.fr/?p=1',	0,	'post',	'',	1),
(2,	1,	'2021-07-28 20:26:38',	'2021-07-28 17:26:38',	'<!-- wp:paragraph -->\n<p>This is an example page. It\'s different from a blog post because it will stay in one place and will show up in your site navigation (in most themes). Most people start with an About page that introduces them to potential site visitors. It might say something like this:</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:quote -->\n<blockquote class=\"wp-block-quote\"><p>Hi there! I\'m a bike messenger by day, aspiring actor by night, and this is my website. I live in Los Angeles, have a great dog named Jack, and I like pi&#241;a coladas. (And gettin\' caught in the rain.)</p></blockquote>\n<!-- /wp:quote -->\n\n<!-- wp:paragraph -->\n<p>...or something like this:</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:quote -->\n<blockquote class=\"wp-block-quote\"><p>The XYZ Doohickey Company was founded in 1971, and has been providing quality doohickeys to the public ever since. Located in Gotham City, XYZ employs over 2,000 people and does all kinds of awesome things for the Gotham community.</p></blockquote>\n<!-- /wp:quote -->\n\n<!-- wp:paragraph -->\n<p>As a new WordPress user, you should go to <a href=\"https://mclam.42.fr/wp-admin/\">your dashboard</a> to delete this page and create new pages for your content. Have fun!</p>\n<!-- /wp:paragraph -->',	'Пример страницы',	'',	'publish',	'closed',	'open',	'',	'sample-page',	'',	'',	'2021-07-28 20:26:38',	'2021-07-28 17:26:38',	'',	0,	'https://mclam.42.fr/?page_id=2',	0,	'page',	'',	0),
(3,	1,	'2021-07-28 20:26:38',	'2021-07-28 17:26:38',	'<!-- wp:heading --><h2>Who we are</h2><!-- /wp:heading --><!-- wp:paragraph --><p>Our website address is: https://mclam.42.fr.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>What personal data we collect and why we collect it</h2><!-- /wp:heading --><!-- wp:heading {\"level\":3} --><h3>Комментарии</h3><!-- /wp:heading --><!-- wp:paragraph --><p>When visitors leave comments on the site we collect the data shown in the comments form, and also the visitor&#8217;s IP address and browser user agent string to help spam detection.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>An anonymized string created from your email address (also called a hash) may be provided to the Gravatar service to see if you are using it. The Gravatar service privacy policy is available here: https://automattic.com/privacy/. After approval of your comment, your profile picture is visible to the public in the context of your comment.</p><!-- /wp:paragraph --><!-- wp:heading {\"level\":3} --><h3>Медиафайлы</h3><!-- /wp:heading --><!-- wp:paragraph --><p>If you upload images to the website, you should avoid uploading images with embedded location data (EXIF GPS) included. Visitors to the website can download and extract any location data from images on the website.</p><!-- /wp:paragraph --><!-- wp:heading {\"level\":3} --><h3>Contact forms</h3><!-- /wp:heading --><!-- wp:heading {\"level\":3} --><h3>Cookies</h3><!-- /wp:heading --><!-- wp:paragraph --><p>If you leave a comment on our site you may opt-in to saving your name, email address and website in cookies. These are for your convenience so that you do not have to fill in your details again when you leave another comment. These cookies will last for one year.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>If you have an account and you log in to this site, we will set a temporary cookie to determine if your browser accepts cookies. This cookie contains no personal data and is discarded when you close your browser.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>When you log in, we will also set up several cookies to save your login information and your screen display choices. Login cookies last for two days, and screen options cookies last for a year. If you select &quot;Remember Me&quot;, your login will persist for two weeks. If you log out of your account, the login cookies will be removed.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>If you edit or publish an article, an additional cookie will be saved in your browser. This cookie includes no personal data and simply indicates the post ID of the article you just edited. It expires after 1 day.</p><!-- /wp:paragraph --><!-- wp:heading {\"level\":3} --><h3>Embedded content from other websites</h3><!-- /wp:heading --><!-- wp:paragraph --><p>Articles on this site may include embedded content (e.g. videos, images, articles, etc.). Embedded content from other websites behaves in the exact same way as if the visitor has visited the other website.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>These websites may collect data about you, use cookies, embed additional third-party tracking, and monitor your interaction with that embedded content, including tracking your interaction with the embedded content if you have an account and are logged in to that website.</p><!-- /wp:paragraph --><!-- wp:heading {\"level\":3} --><h3>Analytics</h3><!-- /wp:heading --><!-- wp:heading --><h2>Who we share your data with</h2><!-- /wp:heading --><!-- wp:heading --><h2>How long we retain your data</h2><!-- /wp:heading --><!-- wp:paragraph --><p>If you leave a comment, the comment and its metadata are retained indefinitely. This is so we can recognize and approve any follow-up comments automatically instead of holding them in a moderation queue.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>For users that register on our website (if any), we also store the personal information they provide in their user profile. All users can see, edit, or delete their personal information at any time (except they cannot change their username). Website administrators can also see and edit that information.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>What rights you have over your data</h2><!-- /wp:heading --><!-- wp:paragraph --><p>If you have an account on this site, or have left comments, you can request to receive an exported file of the personal data we hold about you, including any data you have provided to us. You can also request that we erase any personal data we hold about you. This does not include any data we are obliged to keep for administrative, legal, or security purposes.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>Where we send your data</h2><!-- /wp:heading --><!-- wp:paragraph --><p>Visitor comments may be checked through an automated spam detection service.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>Your contact information</h2><!-- /wp:heading --><!-- wp:heading --><h2>Additional information</h2><!-- /wp:heading --><!-- wp:heading {\"level\":3} --><h3>How we protect your data</h3><!-- /wp:heading --><!-- wp:heading {\"level\":3} --><h3>What data breach procedures we have in place</h3><!-- /wp:heading --><!-- wp:heading {\"level\":3} --><h3>What third parties we receive data from</h3><!-- /wp:heading --><!-- wp:heading {\"level\":3} --><h3>What automated decision making and/or profiling we do with user data</h3><!-- /wp:heading --><!-- wp:heading {\"level\":3} --><h3>Industry regulatory disclosure requirements</h3><!-- /wp:heading -->',	'Privacy Policy',	'',	'draft',	'closed',	'open',	'',	'privacy-policy',	'',	'',	'2021-07-28 20:26:38',	'2021-07-28 17:26:38',	'',	0,	'https://mclam.42.fr/?page_id=3',	0,	'page',	'',	0),
(4,	1,	'2021-07-28 20:27:01',	'0000-00-00 00:00:00',	'',	'Черновик',	'',	'auto-draft',	'open',	'open',	'',	'',	'',	'',	'2021-07-28 20:27:01',	'0000-00-00 00:00:00',	'',	0,	'https://mclam.42.fr/?p=4',	0,	'post',	'',	0),
(5,	1,	'2021-07-28 20:27:48',	'2021-07-28 17:27:48',	'<!-- wp:paragraph -->\n<p>Welcome to WordPress. This is your first post. Edit or delete it, then start writing!</p>\n<!-- /wp:paragraph -->',	'Привет, мир!',	'',	'inherit',	'closed',	'closed',	'',	'1-revision-v1',	'',	'',	'2021-07-28 20:27:48',	'2021-07-28 17:27:48',	'',	1,	'https://mclam.42.fr/?p=5',	0,	'revision',	'',	0),
(6,	1,	'2021-07-28 20:32:53',	'2021-07-28 17:32:53',	'<!-- wp:paragraph -->\n<p><br></p>\n<!-- /wp:paragraph -->',	'Чеклист',	'',	'publish',	'open',	'open',	'',	'%d0%a7%d0%b5%d0%ba%d0%bb%d0%b8%d1%81%d1%82',	'',	'',	'2021-07-28 20:32:53',	'2021-07-28 17:32:53',	'',	0,	'https://mclam.42.fr/?p=6',	0,	'post',	'',	0),
(7,	1,	'2021-07-28 20:32:53',	'2021-07-28 17:32:53',	'<!-- wp:paragraph -->\n<p><br></p>\n<!-- /wp:paragraph -->',	'Чеклист',	'',	'inherit',	'closed',	'closed',	'',	'6-revision-v1',	'',	'',	'2021-07-28 20:32:53',	'2021-07-28 17:32:53',	'',	6,	'https://mclam.42.fr/?p=7',	0,	'revision',	'',	0),
(8,	1,	'2021-07-28 20:35:34',	'2021-07-28 17:35:34',	'{\n    \"old_sidebars_widgets_data\": {\n        \"value\": {\n            \"wp_inactive_widgets\": [],\n            \"sidebar-1\": [\n                \"search-2\",\n                \"recent-posts-2\",\n                \"recent-comments-2\",\n                \"archives-2\",\n                \"categories-2\",\n                \"meta-2\"\n            ]\n        },\n        \"type\": \"global_variable\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2021-07-28 17:35:34\"\n    }\n}',	'',	'',	'trash',	'closed',	'closed',	'',	'5369cd69-222d-40d8-8778-4202f366a65d',	'',	'',	'2021-07-28 20:35:34',	'2021-07-28 17:35:34',	'',	0,	'https://mclam.42.fr/?p=8',	0,	'customize_changeset',	'',	0),
(9,	1,	'2021-07-28 20:38:30',	'2021-07-28 17:38:30',	'{\n    \"teluro::header_front_page.title.localProps.content\": {\n        \"value\": \"Inception project 21-school\",\n        \"type\": \"theme_mod\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2021-07-28 17:37:54\"\n    },\n    \"teluro::header_front_page.subtitle.localProps.content\": {\n        \"value\": \"by Moud Clam (mclam)\",\n        \"type\": \"theme_mod\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2021-07-28 17:38:30\"\n    }\n}',	'',	'',	'trash',	'closed',	'closed',	'',	'4a4c5994-8733-4b16-9dd3-346aff017055',	'',	'',	'2021-07-28 20:38:30',	'2021-07-28 17:38:30',	'',	0,	'https://mclam.42.fr/?p=9',	0,	'customize_changeset',	'',	0),
(10,	1,	'2021-07-28 20:39:51',	'2021-07-28 17:39:51',	'{\n    \"teluro::header_front_page.button_group.value\": {\n        \"value\": \"%5B%7B%22label%22%3A%22%D0%9A%D0%BD%D0%BE%D0%BF%D0%BA%D0%B0%22%2C%22url%22%3A%22%23%22%2C%22button_type%22%3A%220%22%2C%22index%22%3A1%7D%5D\",\n        \"type\": \"theme_mod\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2021-07-28 17:39:51\"\n    }\n}',	'',	'',	'trash',	'closed',	'closed',	'',	'09274ae9-a135-430e-8ca9-36c8c38e8272',	'',	'',	'2021-07-28 20:39:51',	'2021-07-28 17:39:51',	'',	0,	'https://mclam.42.fr/?p=10',	0,	'customize_changeset',	'',	0),
(11,	1,	'2021-07-28 20:45:03',	'2021-07-28 17:45:03',	'{\n    \"teluro::header_front_page.button_group.show\": {\n        \"value\": false,\n        \"type\": \"theme_mod\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2021-07-28 17:40:54\"\n    },\n    \"nav_menu[-7167322018979177000]\": {\n        \"value\": {\n            \"name\": \"\\u0422\\u0435\\u0431\\u044e\",\n            \"description\": \"\",\n            \"parent\": 0,\n            \"auto_add\": false\n        },\n        \"type\": \"nav_menu\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2021-07-28 17:41:50\"\n    },\n    \"nav_menu_item[-9026345230538414000]\": {\n        \"value\": {\n            \"object_id\": 0,\n            \"object\": \"custom\",\n            \"menu_item_parent\": 0,\n            \"position\": 1,\n            \"type\": \"custom\",\n            \"title\": \"\\u0412\\u0435\\u043b\\u043a\\u0430\\u043c\",\n            \"url\": \"https://mclam.42.fr/wp-login.php\",\n            \"target\": \"\",\n            \"attr_title\": \"\",\n            \"description\": \"\",\n            \"classes\": \"\",\n            \"xfn\": \"\",\n            \"status\": \"publish\",\n            \"original_title\": \"\\u0412\\u0435\\u043b\\u043a\\u0430\\u043c\",\n            \"nav_menu_term_id\": -7167322018979177000,\n            \"_invalid\": false,\n            \"type_label\": \"\\u041f\\u0440\\u043e\\u0438\\u0437\\u0432\\u043e\\u043b\\u044c\\u043d\\u0430\\u044f \\u0441\\u0441\\u044b\\u043b\\u043a\\u0430\"\n        },\n        \"type\": \"nav_menu_item\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2021-07-28 17:43:50\"\n    },\n    \"nav_menu_item[-971421722872245200]\": {\n        \"value\": {\n            \"object_id\": 0,\n            \"object\": \"custom\",\n            \"menu_item_parent\": 0,\n            \"position\": 2,\n            \"type\": \"custom\",\n            \"title\": \"\\u0412 \\u043e\\u0447\\u0435\\u0440\\u0435\\u0434\\u044c!\",\n            \"url\": \"https://mclam.42.fr/wp-signup.php\",\n            \"target\": \"\",\n            \"attr_title\": \"\",\n            \"description\": \"\",\n            \"classes\": \"\",\n            \"xfn\": \"\",\n            \"status\": \"publish\",\n            \"original_title\": \"\\u0412 \\u043e\\u0447\\u0435\\u0440\\u0435\\u0434\\u044c!\",\n            \"nav_menu_term_id\": -7167322018979177000,\n            \"_invalid\": false,\n            \"type_label\": \"\\u041f\\u0440\\u043e\\u0438\\u0437\\u0432\\u043e\\u043b\\u044c\\u043d\\u0430\\u044f \\u0441\\u0441\\u044b\\u043b\\u043a\\u0430\"\n        },\n        \"type\": \"nav_menu_item\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2021-07-28 17:44:50\"\n    }\n}',	'',	'',	'trash',	'closed',	'closed',	'',	'27928276-7e55-431d-98e6-38942d97036a',	'',	'',	'2021-07-28 20:45:03',	'2021-07-28 17:45:03',	'',	0,	'https://mclam.42.fr/?p=11',	0,	'customize_changeset',	'',	0),
(12,	1,	'2021-07-28 20:45:03',	'2021-07-28 17:45:03',	'',	'Велкам',	'',	'publish',	'closed',	'closed',	'',	'%d0%92%d0%b5%d0%bb%d0%ba%d0%b0%d0%bc',	'',	'',	'2021-07-28 20:49:24',	'2021-07-28 17:49:24',	'',	0,	'https://mclam.42.fr/?p=12',	3,	'nav_menu_item',	'',	0),
(13,	1,	'2021-07-28 20:45:03',	'2021-07-28 17:45:03',	'',	'В очередь!',	'',	'publish',	'closed',	'closed',	'',	'%d0%92-%d0%be%d1%87%d0%b5%d1%80%d0%b5%d0%b4%d1%8c',	'',	'',	'2021-07-28 20:49:24',	'2021-07-28 17:49:24',	'',	0,	'https://mclam.42.fr/?p=13',	4,	'nav_menu_item',	'',	0),
(14,	1,	'2021-07-28 20:49:24',	'2021-07-28 17:49:24',	'{\n    \"teluro::nav_menu_locations[header-menu]\": {\n        \"value\": 2,\n        \"type\": \"theme_mod\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2021-07-28 17:46:40\"\n    },\n    \"nav_menu_item[-7858691401107094000]\": {\n        \"value\": {\n            \"object_id\": 0,\n            \"object\": \"custom\",\n            \"menu_item_parent\": 0,\n            \"position\": 2,\n            \"type\": \"custom\",\n            \"title\": \"\\u041d\\u0430\\u0434\\u0437\\u043e\\u0440\",\n            \"url\": \"https://mclam.42.fr/adminer/\",\n            \"target\": \"\",\n            \"attr_title\": \"\",\n            \"description\": \"\",\n            \"classes\": \"\",\n            \"xfn\": \"\",\n            \"status\": \"publish\",\n            \"original_title\": \"\\u041d\\u0430\\u0434\\u0437\\u043e\\u0440\",\n            \"nav_menu_term_id\": 2,\n            \"_invalid\": false,\n            \"type_label\": \"\\u041f\\u0440\\u043e\\u0438\\u0437\\u0432\\u043e\\u043b\\u044c\\u043d\\u0430\\u044f \\u0441\\u0441\\u044b\\u043b\\u043a\\u0430\"\n        },\n        \"type\": \"nav_menu_item\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2021-07-28 17:49:24\"\n    },\n    \"nav_menu_item[12]\": {\n        \"value\": {\n            \"object_id\": 0,\n            \"object\": \"custom\",\n            \"menu_item_parent\": 0,\n            \"position\": 3,\n            \"type\": \"custom\",\n            \"title\": \"\\u0412\\u0435\\u043b\\u043a\\u0430\\u043c\",\n            \"url\": \"https://mclam.42.fr/wp-login.php\",\n            \"target\": \"\",\n            \"attr_title\": \"\",\n            \"description\": \"\",\n            \"classes\": \"\",\n            \"xfn\": \"\",\n            \"status\": \"publish\",\n            \"original_title\": \"\\u0412\\u0435\\u043b\\u043a\\u0430\\u043c\",\n            \"nav_menu_term_id\": 2,\n            \"_invalid\": false,\n            \"type_label\": \"\\u041f\\u0440\\u043e\\u0438\\u0437\\u0432\\u043e\\u043b\\u044c\\u043d\\u0430\\u044f \\u0441\\u0441\\u044b\\u043b\\u043a\\u0430\"\n        },\n        \"type\": \"nav_menu_item\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2021-07-28 17:49:24\"\n    },\n    \"nav_menu_item[13]\": {\n        \"value\": {\n            \"object_id\": 0,\n            \"object\": \"custom\",\n            \"menu_item_parent\": 0,\n            \"position\": 4,\n            \"type\": \"custom\",\n            \"title\": \"\\u0412 \\u043e\\u0447\\u0435\\u0440\\u0435\\u0434\\u044c!\",\n            \"url\": \"https://mclam.42.fr/wp-signup.php\",\n            \"target\": \"\",\n            \"attr_title\": \"\",\n            \"description\": \"\",\n            \"classes\": \"\",\n            \"xfn\": \"\",\n            \"status\": \"publish\",\n            \"original_title\": \"\\u0412 \\u043e\\u0447\\u0435\\u0440\\u0435\\u0434\\u044c!\",\n            \"nav_menu_term_id\": 2,\n            \"_invalid\": false,\n            \"type_label\": \"\\u041f\\u0440\\u043e\\u0438\\u0437\\u0432\\u043e\\u043b\\u044c\\u043d\\u0430\\u044f \\u0441\\u0441\\u044b\\u043b\\u043a\\u0430\"\n        },\n        \"type\": \"nav_menu_item\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2021-07-28 17:49:24\"\n    },\n    \"nav_menu_item[-4481302843381548000]\": {\n        \"value\": {\n            \"object_id\": 0,\n            \"object\": \"custom\",\n            \"menu_item_parent\": 0,\n            \"position\": 1,\n            \"type\": \"custom\",\n            \"title\": \"\\u0425\\u0422\\u041c\\u041b\\u042b\",\n            \"url\": \"https://mclam.42.fr/html/\",\n            \"target\": \"\",\n            \"attr_title\": \"\",\n            \"description\": \"\",\n            \"classes\": \"\",\n            \"xfn\": \"\",\n            \"status\": \"publish\",\n            \"original_title\": \"\\u0425\\u0422\\u041c\\u041b\\u042b\",\n            \"nav_menu_term_id\": 2,\n            \"_invalid\": false,\n            \"type_label\": \"\\u041f\\u0440\\u043e\\u0438\\u0437\\u0432\\u043e\\u043b\\u044c\\u043d\\u0430\\u044f \\u0441\\u0441\\u044b\\u043b\\u043a\\u0430\"\n        },\n        \"type\": \"nav_menu_item\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2021-07-28 17:49:24\"\n    }\n}',	'',	'',	'trash',	'closed',	'closed',	'',	'18b5fa96-5d2c-446b-a65d-c76cb6e1232d',	'',	'',	'2021-07-28 20:49:24',	'2021-07-28 17:49:24',	'',	0,	'https://mclam.42.fr/?p=14',	0,	'customize_changeset',	'',	0),
(15,	1,	'2021-07-28 20:49:24',	'2021-07-28 17:49:24',	'',	'Надзор',	'',	'publish',	'closed',	'closed',	'',	'%d0%9d%d0%b0%d0%b4%d0%b7%d0%be%d1%80',	'',	'',	'2021-07-28 20:49:24',	'2021-07-28 17:49:24',	'',	0,	'https://mclam.42.fr/?p=15',	2,	'nav_menu_item',	'',	0),
(16,	1,	'2021-07-28 20:49:24',	'2021-07-28 17:49:24',	'',	'ХТМЛЫ',	'',	'publish',	'closed',	'closed',	'',	'%d0%a5%d0%a2%d0%9c%d0%9b%d0%ab',	'',	'',	'2021-07-28 20:49:24',	'2021-07-28 17:49:24',	'',	0,	'https://mclam.42.fr/?p=16',	1,	'nav_menu_item',	'',	0)
ON DUPLICATE KEY UPDATE `ID` = VALUES(`ID`), `post_author` = VALUES(`post_author`), `post_date` = VALUES(`post_date`), `post_date_gmt` = VALUES(`post_date_gmt`), `post_content` = VALUES(`post_content`), `post_title` = VALUES(`post_title`), `post_excerpt` = VALUES(`post_excerpt`), `post_status` = VALUES(`post_status`), `comment_status` = VALUES(`comment_status`), `ping_status` = VALUES(`ping_status`), `post_password` = VALUES(`post_password`), `post_name` = VALUES(`post_name`), `to_ping` = VALUES(`to_ping`), `pinged` = VALUES(`pinged`), `post_modified` = VALUES(`post_modified`), `post_modified_gmt` = VALUES(`post_modified_gmt`), `post_content_filtered` = VALUES(`post_content_filtered`), `post_parent` = VALUES(`post_parent`), `guid` = VALUES(`guid`), `menu_order` = VALUES(`menu_order`), `post_type` = VALUES(`post_type`), `post_mime_type` = VALUES(`post_mime_type`), `comment_count` = VALUES(`comment_count`);

DROP TABLE IF EXISTS `wp_termmeta`;
CREATE TABLE `wp_termmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `term_id` bigint(20) unsigned NOT NULL DEFAULT 0,
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`meta_id`),
  KEY `term_id` (`term_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `wp_terms`;
CREATE TABLE `wp_terms` (
  `term_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `slug` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `term_group` bigint(10) NOT NULL DEFAULT 0,
  PRIMARY KEY (`term_id`),
  KEY `slug` (`slug`(191)),
  KEY `name` (`name`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `wp_terms` (`term_id`, `name`, `slug`, `term_group`) VALUES
(1,	'Без рубрики',	'%d0%91%d0%b5%d0%b7-%d1%80%d1%83%d0%b1%d1%80%d0%b8%d0%ba%d0%b8',	0),
(2,	'Тебю',	'%d0%a2%d0%b5%d0%b1%d1%8e',	0)
ON DUPLICATE KEY UPDATE `term_id` = VALUES(`term_id`), `name` = VALUES(`name`), `slug` = VALUES(`slug`), `term_group` = VALUES(`term_group`);

DROP TABLE IF EXISTS `wp_term_relationships`;
CREATE TABLE `wp_term_relationships` (
  `object_id` bigint(20) unsigned NOT NULL DEFAULT 0,
  `term_taxonomy_id` bigint(20) unsigned NOT NULL DEFAULT 0,
  `term_order` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`object_id`,`term_taxonomy_id`),
  KEY `term_taxonomy_id` (`term_taxonomy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `wp_term_relationships` (`object_id`, `term_taxonomy_id`, `term_order`) VALUES
(1,	1,	0),
(6,	1,	0),
(12,	2,	0),
(13,	2,	0),
(15,	2,	0),
(16,	2,	0)
ON DUPLICATE KEY UPDATE `object_id` = VALUES(`object_id`), `term_taxonomy_id` = VALUES(`term_taxonomy_id`), `term_order` = VALUES(`term_order`);

DROP TABLE IF EXISTS `wp_term_taxonomy`;
CREATE TABLE `wp_term_taxonomy` (
  `term_taxonomy_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `term_id` bigint(20) unsigned NOT NULL DEFAULT 0,
  `taxonomy` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent` bigint(20) unsigned NOT NULL DEFAULT 0,
  `count` bigint(20) NOT NULL DEFAULT 0,
  PRIMARY KEY (`term_taxonomy_id`),
  UNIQUE KEY `term_id_taxonomy` (`term_id`,`taxonomy`),
  KEY `taxonomy` (`taxonomy`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `wp_term_taxonomy` (`term_taxonomy_id`, `term_id`, `taxonomy`, `description`, `parent`, `count`) VALUES
(1,	1,	'category',	'',	0,	1),
(2,	2,	'nav_menu',	'',	0,	4)
ON DUPLICATE KEY UPDATE `term_taxonomy_id` = VALUES(`term_taxonomy_id`), `term_id` = VALUES(`term_id`), `taxonomy` = VALUES(`taxonomy`), `description` = VALUES(`description`), `parent` = VALUES(`parent`), `count` = VALUES(`count`);

DROP TABLE IF EXISTS `wp_usermeta`;
CREATE TABLE `wp_usermeta` (
  `umeta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT 0,
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`umeta_id`),
  KEY `user_id` (`user_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `wp_usermeta` (`umeta_id`, `user_id`, `meta_key`, `meta_value`) VALUES
(1,	1,	'nickname',	'wp-manager'),
(2,	1,	'first_name',	''),
(3,	1,	'last_name',	''),
(4,	1,	'description',	''),
(5,	1,	'rich_editing',	'true'),
(6,	1,	'syntax_highlighting',	'true'),
(7,	1,	'comment_shortcuts',	'false'),
(8,	1,	'admin_color',	'fresh'),
(9,	1,	'use_ssl',	'0'),
(10,	1,	'show_admin_bar_front',	'true'),
(11,	1,	'locale',	''),
(12,	1,	'wp_capabilities',	'a:1:{s:13:\"administrator\";b:1;}'),
(13,	1,	'wp_user_level',	'10'),
(14,	1,	'dismissed_wp_pointers',	'wp496_privacy'),
(15,	1,	'show_welcome_panel',	'1'),
(16,	1,	'session_tokens',	'a:1:{s:64:\"9b1f16109ab25e14cf0cee2659ae1c3f1dd871ce79fb6d1fb5e79a83f57014e4\";a:4:{s:10:\"expiration\";i:1627666018;s:2:\"ip\";s:13:\"85.249.45.157\";s:2:\"ua\";s:119:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.1.2 Safari/605.1.15\";s:5:\"login\";i:1627493218;}}'),
(17,	1,	'wp_dashboard_quick_press_last_post_id',	'4'),
(18,	1,	'community-events-location',	'a:1:{s:2:\"ip\";s:11:\"85.249.45.0\";}'),
(19,	2,	'nickname',	'author0'),
(20,	2,	'first_name',	'Антоша'),
(21,	2,	'last_name',	'Чехонте'),
(22,	2,	'description',	''),
(23,	2,	'rich_editing',	'true'),
(24,	2,	'syntax_highlighting',	'true'),
(25,	2,	'comment_shortcuts',	'false'),
(26,	2,	'admin_color',	'fresh'),
(27,	2,	'use_ssl',	'0'),
(28,	2,	'show_admin_bar_front',	'true'),
(29,	2,	'locale',	''),
(30,	2,	'wp_capabilities',	'a:1:{s:6:\"author\";b:1;}'),
(31,	2,	'wp_user_level',	'2'),
(32,	2,	'dismissed_wp_pointers',	'wp496_privacy')
ON DUPLICATE KEY UPDATE `umeta_id` = VALUES(`umeta_id`), `user_id` = VALUES(`user_id`), `meta_key` = VALUES(`meta_key`), `meta_value` = VALUES(`meta_value`);

DROP TABLE IF EXISTS `wp_users`;
CREATE TABLE `wp_users` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_login` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_pass` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_nicename` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_url` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_registered` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_activation_key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_status` int(11) NOT NULL DEFAULT 0,
  `display_name` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`),
  KEY `user_login_key` (`user_login`),
  KEY `user_nicename` (`user_nicename`),
  KEY `user_email` (`user_email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `wp_users` (`ID`, `user_login`, `user_pass`, `user_nicename`, `user_email`, `user_url`, `user_registered`, `user_activation_key`, `user_status`, `display_name`) VALUES
(1,	'wp-manager',	'$P$BldhJzGySjgVW1.Zx3XWOkoyPGdmJ30',	'wp-manager',	'muru@me.com',	'',	'2021-07-28 17:26:38',	'',	0,	'wp-manager'),
(2,	'author0',	'$P$BYs0NeOmhj/DEgQSH0INLIRe0vJ8HB/',	'author0',	'mu@me.com',	'',	'2021-07-28 17:52:24',	'1627494744:$P$BkKZYtiJvC/.OMkF3fk1fYh.zSzbnP1',	0,	'Антоша Чехонте')
ON DUPLICATE KEY UPDATE `ID` = VALUES(`ID`), `user_login` = VALUES(`user_login`), `user_pass` = VALUES(`user_pass`), `user_nicename` = VALUES(`user_nicename`), `user_email` = VALUES(`user_email`), `user_url` = VALUES(`user_url`), `user_registered` = VALUES(`user_registered`), `user_activation_key` = VALUES(`user_activation_key`), `user_status` = VALUES(`user_status`), `display_name` = VALUES(`display_name`);

-- 2021-07-28 17:55:24
