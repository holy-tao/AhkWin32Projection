#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Data.Xml.MsXml
 */
class DOMNodeType extends Win32Enum {

    /**
     * Native name: NODE_INVALID
     * @type {Integer (Int32)}
     */
    static INVALID => 0

    /**
     * Native name: NODE_ELEMENT
     * @type {Integer (Int32)}
     */
    static ELEMENT => 1

    /**
     * Native name: NODE_ATTRIBUTE
     * @type {Integer (Int32)}
     */
    static ATTRIBUTE => 2

    /**
     * Native name: NODE_TEXT
     * @type {Integer (Int32)}
     */
    static TEXT => 3

    /**
     * Native name: NODE_CDATA_SECTION
     * @type {Integer (Int32)}
     */
    static CDATA_SECTION => 4

    /**
     * Native name: NODE_ENTITY_REFERENCE
     * @type {Integer (Int32)}
     */
    static ENTITY_REFERENCE => 5

    /**
     * Native name: NODE_ENTITY
     * @type {Integer (Int32)}
     */
    static ENTITY => 6

    /**
     * Native name: NODE_PROCESSING_INSTRUCTION
     * @type {Integer (Int32)}
     */
    static PROCESSING_INSTRUCTION => 7

    /**
     * Native name: NODE_COMMENT
     * @type {Integer (Int32)}
     */
    static COMMENT => 8

    /**
     * Native name: NODE_DOCUMENT
     * @type {Integer (Int32)}
     */
    static DOCUMENT => 9

    /**
     * Native name: NODE_DOCUMENT_TYPE
     * @type {Integer (Int32)}
     */
    static DOCUMENT_TYPE => 10

    /**
     * Native name: NODE_DOCUMENT_FRAGMENT
     * @type {Integer (Int32)}
     */
    static DOCUMENT_FRAGMENT => 11

    /**
     * Native name: NODE_NOTATION
     * @type {Integer (Int32)}
     */
    static NOTATION => 12
}
