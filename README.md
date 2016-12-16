# zend_framework2_cms
demo zend framework 2 cms (gotcms)


http://gocms.lc/admin
user:admin
pass:Osd2@123

Data : gocms\data\gocms.sql

PHP.INI :
extension=php_fileinfo.dll 
extension=php_intl.dll


Example of VirtualHost:

<VirtualHost *:80>
    ServerAdmin admin@gocms.lc
    ServerName gocms.lc
    ServerAlias www.gocms.lc
    DocumentRoot "D:\xampp\htdocs\gocms\public"
    <Directory "D:\xampp\htdocs\gocms\public">
        Options Indexes FollowSymLinks MultiViews
        AllowOverride None
        Order allow,deny
        Allow from all
        RewriteEngine On
        RewriteCond %{REQUEST_FILENAME} -s [OR]
        RewriteCond %{REQUEST_FILENAME} -l [OR]
        RewriteCond %{REQUEST_FILENAME} -d
        RewriteRule ^.*$ - [NC,L]
        RewriteRule ^.*$ index.php [NC,L]
    </Directory>
</VirtualHost>

Make sure read and write access are available by apache user/group for these directories:

    config/autoload
    public/frontend
    public/media
    data/cache

Required

    An HTTP server
    Php version >= 5.3.23
    XML support
    FileInfo support
    Mbstring support
    Json support
    Curl support
    PDO support
    A database supported by PDO.
        MySQL
        PostgreSQL


