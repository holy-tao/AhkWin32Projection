#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Data.Xml.MsXml
 * @version v4.0.30319
 */
class DOMNodeType extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static NODE_INVALID => 0

    /**
     * @type {Integer (Int32)}
     */
    static NODE_ELEMENT => 1

    /**
     * @type {Integer (Int32)}
     */
    static NODE_ATTRIBUTE => 2

    /**
     * @type {Integer (Int32)}
     */
    static NODE_TEXT => 3

    /**
     * @type {Integer (Int32)}
     */
    static NODE_CDATA_SECTION => 4

    /**
     * @type {Integer (Int32)}
     */
    static NODE_ENTITY_REFERENCE => 5

    /**
     * @type {Integer (Int32)}
     */
    static NODE_ENTITY => 6

    /**
     * @type {Integer (Int32)}
     */
    static NODE_PROCESSING_INSTRUCTION => 7

    /**
     * @type {Integer (Int32)}
     */
    static NODE_COMMENT => 8

    /**
     * @type {Integer (Int32)}
     */
    static NODE_DOCUMENT => 9

    /**
     * @type {Integer (Int32)}
     */
    static NODE_DOCUMENT_TYPE => 10

    /**
     * @type {Integer (Int32)}
     */
    static NODE_DOCUMENT_FRAGMENT => 11

    /**
     * @type {Integer (Int32)}
     */
    static NODE_NOTATION => 12
}
