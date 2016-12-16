<?php
/**
 * This source file is part of GotCms.
 *
 * GotCms is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * GotCms is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License along
 * with GotCms. If not, see <http://www.gnu.org/licenses/lgpl-3.0.html>.
 *
 * PHP Version >=5.3
 *
 * @category   Gc_Application
 * @package    GcContent
 * @subpackage Config
 * @author     Pierre Rambaud (GoT) <pierre.rambaud86@gmail.com>
 * @license    GNU/LGPL http://www.gnu.org/licenses/lgpl-3.0.html
 * @link       http://www.got-cms.com
 */

return array(
    'Content\Controller\IndexController'       => __DIR__ . '/src/Content/Controller/IndexController.php',
    'Content\Controller\DocumentController'    => __DIR__ . '/src/Content/Controller/DocumentController.php',
    'Content\Controller\MediaController'       => __DIR__ . '/src/Content/Controller/MediaController.php',
    'Content\Controller\TranslationController' => __DIR__ . '/src/Content/Controller/TranslationController.php',
    'Content\Module'                           => __DIR__ . '/Module.php',
    'Content\Form\Document'                    => __DIR__ . '/src/Content/Form/Document.php',
    'Content\Form\Translation'                 => __DIR__ . '/src/Content/Form/Translation.php',
);
