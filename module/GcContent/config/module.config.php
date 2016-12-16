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

use Gc\Document\Model as DocumentModel;

return array(
    'controllers' => array(
        'invokables' => array(
            'ContentController' => 'GcContent\Controller\IndexController',
            'DocumentController' => 'GcContent\Controller\DocumentController',
            'MediaController' => 'GcContent\Controller\MediaController',
            'TranslationController' => 'GcContent\Controller\TranslationController',
        ),
    ),
    'view_manager' => array(
        'template_path_stack' => array(
            'content' => __DIR__ . '/../views',
        ),
    ),
    'router' => array(
        'routes' => array(
            'content' => array(
                'type'    => 'Literal',
                'options' => array(
                    'route'    => '/admin/content',
                    'defaults' =>
                    array (
                        'module'     => 'gccontent',
                        'controller' => 'ContentController',
                        'action'     => 'index',
                    ),
                ),
                'may_terminate' => true,
                'child_routes' => array(
                    'translation' => array(
                        'type'    => 'Literal',
                        'options' => array(
                            'route'    => '/translation',
                            'defaults' =>
                            array (
                                'module'     => 'gccontent',
                                'controller' => 'TranslationController',
                                'action'     => 'index',
                            ),
                        ),
                        'may_terminate' => true,
                        'child_routes' => array(
                            'create' => array(
                                'type'    => 'Literal',
                                'options' => array(
                                    'route'    => '/create',
                                    'defaults' =>
                                    array (
                                        'module'     => 'gccontent',
                                        'controller' => 'TranslationController',
                                        'action'     => 'create',
                                    ),
                                ),
                            ),
                            'download' => array(
                                'type'    => 'Literal',
                                'options' => array(
                                    'route'    => '/download',
                                    'defaults' =>
                                    array (
                                        'module'     => 'gccontent',
                                        'controller' => 'TranslationController',
                                        'action'     => 'download',
                                    ),
                                ),
                            ),
                            'upload' => array(
                                'type'    => 'Literal',
                                'options' => array(
                                    'route'    => '/upload',
                                    'defaults' =>
                                    array (
                                        'module'     => 'gccontent',
                                        'controller' => 'TranslationController',
                                        'action'     => 'upload',
                                    ),
                                ),
                            ),
                            'search' => array(
                                'type'    => 'Segment',
                                'options' => array(
                                    'route'    => '/search/:query',
                                    'defaults' =>
                                    array (
                                        'module'     => 'gccontent',
                                        'controller' => 'TranslationController',
                                        'action'     => 'search',
                                    ),
                                ),
                            ),
                        )
                    ),
                    'document' => array(
                        'type'    => 'Literal',
                        'options' => array(
                            'route'    => '/document',
                        ),
                        'may_terminate' => true,
                        'child_routes' => array(
                            'create' => array(
                                'type'    => 'Literal',
                                'options' => array(
                                    'route'    => '/create',
                                    'defaults' =>
                                    array (
                                        'module'     => 'gccontent',
                                        'controller' => 'DocumentController',
                                        'action'     => 'create',
                                    ),
                                ),
                            ),
                            'create-w-parent' => array(
                                'type'    => 'Segment',
                                'options' => array(
                                    'route'    => '/create/parent/:id',
                                    'defaults' =>
                                    array (
                                        'module'     => 'gccontent',
                                        'controller' => 'DocumentController',
                                        'action'     => 'create',
                                    ),
                                ),
                            ),
                            'edit' => array(
                                'type'    => 'Segment',
                                'options' => array(
                                    'route'    => '/edit/:id',
                                    'defaults' =>
                                    array (
                                        'module'     => 'gccontent',
                                        'controller' => 'DocumentController',
                                        'action'     => 'edit',
                                    ),
                                ),
                            ),
                            'delete' => array(
                                'type'    => 'Segment',
                                'options' => array(
                                    'route'    => '/delete/:id',
                                    'defaults' =>
                                    array (
                                        'module'     => 'gccontent',
                                        'controller' => 'DocumentController',
                                        'action'     => 'delete',
                                    ),
                                ),
                            ),
                            'copy' => array(
                                'type'    => 'Segment',
                                'options' => array(
                                    'route'    => '/copy/:id',
                                    'defaults' =>
                                    array (
                                        'module'     => 'gccontent',
                                        'controller' => 'DocumentController',
                                        'action'     => 'copy',
                                    ),
                                ),
                            ),
                            'cut' => array(
                                'type'    => 'Segment',
                                'options' => array(
                                    'route'    => '/cut/:id',
                                    'defaults' =>
                                    array (
                                        'module'     => 'gccontent',
                                        'controller' => 'DocumentController',
                                        'action'     => 'cut',
                                    ),
                                ),
                            ),
                            'paste' => array(
                                'type'    => 'Segment',
                                'options' => array(
                                    'route'    => '/paste/:id',
                                    'defaults' =>
                                    array (
                                        'module'     => 'gccontent',
                                        'controller' => 'DocumentController',
                                        'action'     => 'paste',
                                    ),
                                ),
                            ),
                            'refresh-treeview' => array(
                                'type'    => 'Segment',
                                'options' => array(
                                    'route'    => '/refresh-treeview/:id',
                                    'defaults' =>
                                    array (
                                        'module'     => 'gccontent',
                                        'controller' => 'DocumentController',
                                        'action'     => 'refresh-treeview',
                                    ),
                                ),
                            ),
                            'sort' => array(
                                'type'    => 'Segment',
                                'options' => array(
                                    'route'    => '/sort',
                                    'defaults' =>
                                    array (
                                        'module'     => 'gccontent',
                                        'controller' => 'DocumentController',
                                        'action'     => 'sort-order',
                                    ),
                                ),
                            ),
                            'publish' => array(
                                'type'    => 'Segment',
                                'options' => array(
                                'route'    => '/publish/:id',
                                'defaults' =>
                                    array (
                                        'module'     => 'gccontent',
                                        'controller' => 'DocumentController',
                                        'action'     => 'status',
                                        'status'     => DocumentModel::STATUS_ENABLE,
                                    ),
                                ),
                            ),
                            'unpublish' => array(
                                'type'    => 'Segment',
                                'options' => array(
                                'route'    => '/unpublish/:id',
                                'defaults' =>
                                    array (
                                        'module'     => 'gccontent',
                                        'controller' => 'DocumentController',
                                        'action'     => 'status',
                                        'status'     => DocumentModel::STATUS_DISABLE,
                                    ),
                                ),
                            ),
                        ),
                    ),
                    'media' => array(
                        'type'    => 'Segment',
                        'options' => array(
                            'route'    => '/media',
                            'defaults' =>
                            array (
                                'module'     => 'gccontent',
                                'controller' => 'MediaController',
                                'action'     => 'index',
                            ),
                        ),
                        'may_terminate' => true,
                        'child_routes' => array(
                            'connector' => array(
                                'type'    => 'Segment',
                                'options' => array(
                                    'route'    => '/connector',
                                    'defaults' =>
                                    array (
                                        'module'     => 'gccontent',
                                        'controller' => 'MediaController',
                                        'action'     => 'connector',
                                    ),
                                ),
                            ),
                            'upload' => array(
                                'type'    => 'Segment',
                                'options' => array(
                                    'route'    => '/upload/document/:document_id/property/:property_id',
                                    'defaults' =>
                                    array (
                                        'module'     => 'gccontent',
                                        'controller' => 'MediaController',
                                        'action'     => 'upload',
                                    ),
                                ),
                            ),
                            'remove' => array(
                                'type'    => 'Segment',
                                'options' => array(
                                    'route'    => '/remove/document/:document_id/property/:property_id/:file/',
                                    'defaults' =>
                                    array (
                                        'module'     => 'gccontent',
                                        'controller' => 'MediaController',
                                        'action'     => 'remove',
                                    ),
                                ),
                            ),
                        )
                    ),
                )
            ),
        ),
    )
);
