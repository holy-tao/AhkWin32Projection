#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Data.Xml.XmlLite
 * @version v4.0.30319
 */
class XmlNodeType extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static XmlNodeType_None => 0

    /**
     * @type {Integer (Int32)}
     */
    static XmlNodeType_Element => 1

    /**
     * @type {Integer (Int32)}
     */
    static XmlNodeType_Attribute => 2

    /**
     * @type {Integer (Int32)}
     */
    static XmlNodeType_Text => 3

    /**
     * @type {Integer (Int32)}
     */
    static XmlNodeType_CDATA => 4

    /**
     * @type {Integer (Int32)}
     */
    static XmlNodeType_ProcessingInstruction => 7

    /**
     * @type {Integer (Int32)}
     */
    static XmlNodeType_Comment => 8

    /**
     * @type {Integer (Int32)}
     */
    static XmlNodeType_DocumentType => 10

    /**
     * @type {Integer (Int32)}
     */
    static XmlNodeType_Whitespace => 13

    /**
     * @type {Integer (Int32)}
     */
    static XmlNodeType_EndElement => 15

    /**
     * @type {Integer (Int32)}
     */
    static XmlNodeType_XmlDeclaration => 17

    /**
     * @type {Integer (Int32)}
     */
    static _XmlNodeType_Last => 17
}
