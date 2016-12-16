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
 * @subpackage Datatype
 * @author     Pierre Rambaud (GoT) <pierre.rambaud86@gmail.com>
 * @license    GNU/LGPL http://www.gnu.org/licenses/lgpl-3.0.html
 * @link       http://www.got-cms.com
 */

namespace Gc\Datatype;

use Gc\Db\AbstractTable;
use Zend\Db\Sql\Select;

/**
 * Collection of Datatype Model
 *
 * @category   Gc
 * @package    Library
 * @subpackage Datatype
 */
class Collection extends AbstractTable
{
    /**
     * Collection of \Gc\Datatype\Model
     *
     * @var array
     */
    protected $datatypes;

    /**
     * Table name
     *
     * @var string
     */
    protected $name = 'datatype';

    /**
     * Initialize datatype collection
     *
     * @return void
     */
    public function init()
    {
        $this->setDatatypes();
    }

    /**
     * Set datatype collection
     *
     * @return \Gc\Datatype\Collection
     */
    protected function setDatatypes()
    {
        $rows = $this->fetchAll(
            $this->select(
                function (Select $select) {
                    $select->order('name');
                }
            )
        );

        $datatypes = array();
        foreach ($rows as $row) {
            $datatypes[] = Model::fromArray((array) $row);
        }

        $this->datatypes = $datatypes;

        return $this;
    }

    /**
     * Get datatypes
     *
     * @return array
     */
    public function getDatatypes()
    {
        return $this->datatypes;
    }

    /**
     * Return array of datatypes for input select
     *
     * @return array
     */
    public function getSelect()
    {
        $select    = array();
        $datatypes = $this->getDatatypes();

        foreach ($datatypes as $datatype) {
            $select[$datatype->getId()] = $datatype->getName();
        }

        return $select;
    }
}
