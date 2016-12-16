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
 * @category Gc_Tests
 * @package  Library
 * @author   Pierre Rambaud (GoT) <pierre.rambaud86@gmail.com>
 * @license  GNU/LGPL http://www.gnu.org/licenses/lgpl-3.0.html
 * @link     http://www.got-cms.com
 */

namespace Gc\View\Helper;

use Gc\Document\Model as DocumentModel;
use Gc\Module\Model as ModuleModel;
use Gc\Registry;
use Zend\View\Renderer\PhpRenderer;

/**
 * Generated by PHPUnit_SkeletonGenerator 1.2.0 on 2013-03-06 at 19:50:45.
 *
 * @group Gc
 * @category Gc_Tests
 * @package  Library
 */
class ModulePluginTest extends \PHPUnit_Framework_TestCase
{
    /**
     * @var ModulePlugin
     */
    protected $object;

    /**
     * @var ModuleModel
     */
    protected $module;

    /**
     * @var PhpRenderer
     */
    protected $renderer;

    /**
     * Sets up the fixture, for example, opens a network connection.
     * This method is called before a test is executed.
     *
     * @return void
     */
    protected function setUp()
    {
        $serviceManager = Registry::get('Application')->getServiceManager();
        $this->renderer = new PhpRenderer();
        $renderer       = $serviceManager->get('Zend\View\Renderer\PhpRenderer');
        $this->renderer->setHelperPluginManager($renderer->getHelperPluginManager());

        $serviceManager->setAllowOverride(true);
        $serviceManager->setService(
            'currentDocument',
            DocumentModel::fromArray(
                array(
                    'id' => 1,
                )
            )
        );
        $serviceManager->setAllowOverride(false);
        $this->object = $this->renderer->plugin('modulePlugin');
        $this->module = ModuleModel::fromArray(
            array(
                'name' => 'Blog',
            )
        );
        $this->module->save();
    }

    /**
     * Tears down the fixture, for example, closes a network connection.
     * This method is called after a test is executed.
     *
     * @return void
     */
    protected function tearDown()
    {
        $this->module->delete();
        unset($this->module);
        unset($this->renderer);
        unset($this->object);
    }

    /**
     * Test
     *
     * @return void
     */
    public function testInvoke()
    {
        $this->assertFalse($this->object->__invoke('null', 'nothing'));
        $this->assertInternalType('string', $this->object->__invoke('Blog', 'CommentForm'));
    }

    /**
     * Test
     *
     * @return void
     */
    public function testGetParameter()
    {
        $this->object->__invoke('Blog', 'CommentForm', array('test' => 'test'));
        $this->assertEquals('test', $this->object->getParam('test'));
        $this->assertNull($this->object->getParam('fake-test'));
    }

    /**
     * Test
     *
     * @return void
     */
    public function testValidatePlugin()
    {
        $this->assertTrue($this->object->validatePlugin($this->object->get('Blog', 'CommentForm')));
    }

    /**
     * Test
     *
     * @return void
     */
    public function testValidatePluginWithException()
    {
        $this->setExpectedException('Exception');
        $this->assertNull($this->object->validatePlugin('fakePlugin'));
    }

    /**
     * Test
     *
     * @return void
     */
    public function testGet()
    {
        $this->assertFalse($this->object->get('nothing', 'pluginfake'));
        $this->assertTrue($this->object->validatePlugin($this->object->get('Blog', 'CommentForm')));
        $this->assertTrue($this->object->validatePlugin($this->object->get('Blog', 'CommentForm')));
    }

    /**
     * Test
     *
     * @return void
     */
    public function testCanCreate()
    {
        $this->object->get('Blog', 'CommentForm');
        $this->assertTrue($this->object->canCreate('Blog', 'CommentForm'));
        $this->assertTrue($this->object->canCreate(array('Blog', 'CommentForm')));
    }

    /**
     * Test
     *
     * @return void
     */
    public function testCreate()
    {
        $this->assertTrue($this->object->validatePlugin($this->object->create('Blog', 'CommentForm')));
        $this->assertTrue($this->object->validatePlugin($this->object->create(array('Blog', 'CommentForm'))));
        $this->assertFalse($this->object->create('Fake', 'Plugin'));
    }

    /**
     * Test
     *
     * @return void
     */
    public function testHas()
    {
        $this->object->get('Blog', 'CommentForm');
        $this->assertTrue($this->object->has('Blog', 'CommentForm'));
        $this->assertTrue($this->object->has(array('Blog', 'CommentForm')));
    }
}