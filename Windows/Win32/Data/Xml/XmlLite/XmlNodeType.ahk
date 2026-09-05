#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Data.Xml.XmlLite
 */
class XmlNodeType extends Win32Enum {

    /**
     * Native name: XmlNodeType_None
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * Native name: XmlNodeType_Element
     * @type {Integer (Int32)}
     */
    static Element => 1

    /**
     * Native name: XmlNodeType_Attribute
     * @type {Integer (Int32)}
     */
    static Attribute => 2

    /**
     * Native name: XmlNodeType_Text
     * @type {Integer (Int32)}
     */
    static Text => 3

    /**
     * Native name: XmlNodeType_CDATA
     * @type {Integer (Int32)}
     */
    static CDATA => 4

    /**
     * Native name: XmlNodeType_ProcessingInstruction
     * @type {Integer (Int32)}
     */
    static ProcessingInstruction => 7

    /**
     * Native name: XmlNodeType_Comment
     * @type {Integer (Int32)}
     */
    static Comment => 8

    /**
     * Native name: XmlNodeType_DocumentType
     * @type {Integer (Int32)}
     */
    static DocumentType => 10

    /**
     * Native name: XmlNodeType_Whitespace
     * @type {Integer (Int32)}
     */
    static Whitespace => 13

    /**
     * Native name: XmlNodeType_EndElement
     * @type {Integer (Int32)}
     */
    static EndElement => 15

    /**
     * Native name: XmlNodeType_XmlDeclaration
     * @type {Integer (Int32)}
     */
    static XmlDeclaration => 17

    /**
     * Native name: _XmlNodeType_Last
     * @type {Integer (Int32)}
     */
    static Last => 17
}
