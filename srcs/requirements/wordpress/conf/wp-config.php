<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the
 * installation. You don't have to use the web site, you can
 * copy this file to "wp-config.php" and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * MySQL settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://codex.wordpress.org/Editing_wp-config.php
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define('DB_NAME', 'MYSQL_DATABASE');

/** MySQL database username */
define('DB_USER', 'MYSQL_USER');

/** MySQL database password */
define('DB_PASSWORD', 'MYSQL_PASSWORD');

/** MySQL hostname */
define('DB_HOST', 'WORDPRESS_DATABASE_HOST');

/** Database Charset to use in creating database tables. */
define('DB_CHARSET', 'utf8');

/** The Database Collate type. Don't change this if in doubt. */
define('DB_COLLATE', '');

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',          'x|+0@SopiHBH<^Vp3MNp2NCnku!hPlo:ROu~6[JoD}.7n;]3>*-|RWj:jm,/.apo');
define('SECURE_AUTH_KEY',   'V?s>3wMSD3{LM)]3A2V:>C=wgax#g2}F?o>`ZBm^@oQH=1a:+=3&UM [6uETA4c&');
define('LOGGED_IN_KEY',     'omG6%g`*wXDXS~_/,)KPLKK){NPw/xTt>XS1VvQ[;clURl@`gCp1C}S!$%./l=p*');
define('NONCE_KEY',         'UgI~1]2i7^ -fWW8lJ5{<Tami([jPt+mBC:xR0W]N7n[S,J|uk+0l~w7,<lxP(YU');
define('AUTH_SALT',         '{-IK(C~fksQeseQ$(hWFbKZMFcb+KOv>q~ )[Qm 8Px#n)-.$=S4)krlo%X?|aCa');
define('SECURE_AUTH_SALT',  'QXLQ3Med_OK;aG+]9X^4CqxiHeMB`0~%z4uLU:!iE]b#Y!L+kReKBT&UASK+n!A@');
define('LOGGED_IN_SALT',    '1N+-_8yzCSNlosUrS%6Q;`^b j7qr-|^+X,.8NeDqS.?@-Et_XGW|Yq(FE>CG$?E');
define('NONCE_SALT',        'g#VxF=-+K;fA0Lb?h^k#(|jBC_g$$i&;x)`*gvw(()nT{=cypPZ^8W6ZX-|A,$7(');
#For Redis
define('WP_CACHE_KEY_SALT', 'DOMAIN_NAME');
define('WP_CACHE', true);
$redis_server = array( 'host' => 'redis', 'port' => 6379, );
/**#@-*/

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix  = 'WORDPRESS_TABLE_PREFIX';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the Codex.
 *
 * @link https://codex.wordpress.org/Debugging_in_WordPress
 */
define('WP_DEBUG', WORDPRESS_DEBUG);

/* That's all, stop editing! Happy blogging. */

/** Absolute path to the WordPress directory. */
if ( !defined('ABSPATH') )
	define('ABSPATH', dirname(__FILE__) . '/');

define( 'UPLOADS', 'wp-content/uploads' );

/** Sets up WordPress vars and included files. */
require_once(ABSPATH . 'wp-settings.php');
