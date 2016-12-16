@ECHO OFF
setlocal DISABLEDELAYEDEXPANSION
SET BIN_TARGET=%~dp0/../vendor/packagist/yuicompressor-bin/bin/yuicompressor.jar
php "%BIN_TARGET%" %*
