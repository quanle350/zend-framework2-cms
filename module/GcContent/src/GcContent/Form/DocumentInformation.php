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
 * @subpackage Form
 * @author     Pierre Rambaud (GoT) <pierre.rambaud86@gmail.com>
 * @license    GNU/LGPL http://www.gnu.org/licenses/lgpl-3.0.html
 * @link       http://www.got-cms.com
 */

namespace GcContent\Form;

use Gc\Document\Model as DocumentModel;
use Gc\Form\AbstractForm;
use Gc\Layout;
use Gc\View;
use Zend\Validator;
use Zend\Form\Element;
use Zend\InputFilter\Factory as InputFilterFactory;

/**
 * Document form
 *
 * @category   Gc_Application
 * @package    GcContent
 * @subpackage Form
 */
class DocumentInformation extends AbstractForm
{
    /**
     * Parent id
     *
     * @var integer
     */
    protected $parentId = null;

    /**
     * Document id
     *
     * @var integer
     */
    protected $documentId = null;

    /**
     * Initialize Form
     *
     * @return void
     */
    public function init()
    {
        $inputFilterFactory = new InputFilterFactory();
        $inputFilter        = $inputFilterFactory->createInputFilter(
            array(
                'document-name' => array(
                    'name' => 'document-name',
                    'required' => true,
                    'validators' => array(
                        array('name' => 'not_empty'),
                    ),
                ),
                'document-url_key' => array(
                    'name' => 'document-url_key',
                    'required' => false,
                    'allow_empty' => true,
                    'validators' => array(
                        array('name' => 'regex', 'options' => array(
                            'pattern' => parent::IDENTIFIER_PATTERN
                        )),
                        array(
                            'name' => 'db\\no_record_exists',
                            'options' => array(
                                'table' => 'document',
                                'field' => 'url_key',
                                'adapter' => $this->getAdapter(),
                            ),
                        ),
                    ),
                ),
            )
        );

        $this->setInputFilter($inputFilter);

        $name = new Element\Text('document-name');
        $name->setLabel('Name')
            ->setLabelAttributes(array('class' => 'required control-label'))
            ->setAttribute('id', 'name')
            ->setAttribute('class', 'form-control');

        $urlKey = new Element\Text('document-url_key');
        $urlKey->setLabel('Url key')
            ->setLabelAttributes(array('class' => 'required control-label'))
            ->setAttribute('id', 'url_key')
            ->setAttribute('class', 'form-control');

        $documentType = new Element\Select('document_type');
        $documentType->setLabel('Document Type')
            ->setLabelAttributes(array('class' => 'required control-label'))
            ->setAttribute('id', 'document_type')
            ->setAttribute('class', 'form-control')
            ->setValueOptions(array('' => 'Select document type'));

        $parent = new Element\Hidden('parent');

        $this->add($name);
        $this->add($urlKey);
        $this->add($documentType);
        $this->add($parent);
    }

    /**
     * Check parent validation
     *
     * @return boolean
     */
    public function isValid()
    {
        if ($this->has('parent')) {
            $this->parentId = (int) $this->get('parent')->getValue();
        }

        $condition = sprintf('parent_id = %d', $this->parentId);
        if (!empty($this->documentId)) {
            $condition .= sprintf(' AND id != %d', $this->documentId);
        }

        $inputFilter = $this->getInputFilter();
        $validators  = $inputFilter->get('document-url_key')->getValidatorChain()->getValidators();

        foreach ($validators as $validator) {
            if ($validator['instance'] instanceof Validator\Db\NoRecordExists) {
                $validator['instance']->setExclude($condition);
            }
        }

        return parent::isValid();
    }

    /**
     * Load document form from DocumentModel
     *
     * @param DocumentModel $document Document model
     * @param array         $config   Configuration
     *
     * @return void
     */
    public function load(DocumentModel $document, array $config)
    {
        $this->get('document-name')->setValue($document->getName());
        $this->get('document-url_key')->setValue($document->getUrlKey());

        $status = new Element\Checkbox('document-status');
        $status->setLabel('Publish')
            ->setValue($document->isPublished())
            ->setAttribute('id', 'status')
            ->setAttribute('class', 'input-checkbox')
            ->setCheckedValue((string) DocumentModel::STATUS_ENABLE);

        $this->add($status);

        $showInNav = new Element\Checkbox('document-show_in_nav');
        $showInNav->setLabel('Show in nav')
            ->setValue($document->showInNav())
            ->setAttribute('id', 'show_in_nav')
            ->setAttribute('class', 'input-checkbox')
            ->setCheckedValue((string) DocumentModel::STATUS_ENABLE);

        $this->add($showInNav);

        $canBeCached = new Element\Checkbox('document-can_be_cached');
        $canBeCached->setLabel('Can be cached')
            ->setValue($document->canBeCached())
            ->setAttribute('id', 'can_be_cached')
            ->setAttribute('class', 'input-checkbox')
            ->setCheckedValue((string) DocumentModel::STATUS_ENABLE);

        $this->add($canBeCached);

        array_unshift($config['locales'], '-- Use parent configuration');
        $locale = new Element\Select('document-locale');
        $locale->setLabel('Locale')
            ->setValueOptions($config['locales'])
            ->setValue($document->getLocale())
            ->setAttribute('id', 'locale')
            ->setAttribute('class', 'form-control');

        $this->add($locale);

        $documentType    = $document->getDocumentType();
        $viewsCollection = $documentType->getAvailableViews();
        $select          = $viewsCollection->getSelect();
        $viewSelected    = $document->getViewId();

        $viewModel = View\Model::fromId($document->getDocumentType()->getDefaultViewId());
        if (!empty($viewModel)) {
            $select = $select + array($viewModel->getId() => $viewModel->getName());
            if (empty($viewSelected)) {
                $viewSelected = $viewModel->getId();
            }
        }

        $view = new Element\Select('document-view');
        $view->setValueOptions($select)
            ->setValue((string) $viewSelected)
            ->setAttribute('id', 'view')
            ->setAttribute('class', 'form-control')
            ->setLabel('View');

        $inputFilterFactory = $this->getInputFilter();
        $inputFilterFactory->add(
            array(
                'name' => 'document-view',
                'required' => true,
                'validators' => array(
                    array('name' => 'not_empty'),
                ),
            ),
            'document-view'
        );

        $this->add($view);

        $layoutsCollection = new Layout\Collection();
        $layout            = new Element\Select('document-layout');
        $layout->setValueOptions($layoutsCollection->getSelect())
            ->setValue((string) $document->getLayoutId())
            ->setAttribute('id', 'layout')
            ->setAttribute('class', 'form-control')
            ->setLabel('Layout');

        $inputFilterFactory->add(
            array(
                'name' => 'document-layout',
                'required' => true,
                'validators' => array(
                    array('name' => 'not_empty'),
                ),
            ),
            'document-layout'
        );

        $this->add($layout);
        $this->remove('document_type');
        $this->remove('parent');


        $moreInformation = new Element\Hidden('more_information');
        $moreInformation->setAttribute('content', '');
        $this->add($moreInformation);

        $this->parentId   = $document->getParentId();
        $this->documentId = $document->getId();

        $this->loadValues($document);
    }
}
