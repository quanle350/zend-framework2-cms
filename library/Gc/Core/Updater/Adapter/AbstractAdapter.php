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
 * @category   Gc
 * @package    Library
 * @subpackage Core
 * @author     Pierre Rambaud (GoT) <pierre.rambaud86@gmail.com>
 * @license    GNU/LGPL http://www.gnu.org/licenses/lgpl-3.0.html
 * @link       http://www.got-cms.com
 */

namespace Gc\Core\Updater\Adapter;

use Gc\Core\Object;
use Gc\Version;

/**
 * Abstract adapter for updater
 *
 * @category   Gc
 * @package    Library
 * @subpackage Core
 */
abstract class AbstractAdapter extends Object
{
    /**
     * Messages list
     *
     * @var array
     */
    protected $messages = array();

    /**
     * Update
     *
     * @return boolean
     */
    abstract public function update();

    /**
     * Upgrade
     *
     * @return boolean
     */
    abstract public function upgrade();

    /**
     * Upgrade
     *
     * @param string $version Version
     *
     * @return boolean
     */
    abstract public function rollback($version);

    /**
     * GetLatest version
     *
     * @return string
     */
    public function getLatestVersion()
    {
        return Version::getLatest();
    }

    /**
     * Add message
     *
     * @param string $message Message
     *
     * @return AbstractAdapter
     */
    public function addMessage($message)
    {
        $this->messages[] = $message;

        return $this;
    }

    /**
     * Return messages stack
     *
     * @return array
     */
    public function getMessages()
    {
        return $this->messages;
    }
}
