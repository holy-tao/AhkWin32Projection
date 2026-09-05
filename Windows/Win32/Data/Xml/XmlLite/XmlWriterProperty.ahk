#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Data.Xml.XmlLite
 */
class XmlWriterProperty extends Win32Enum {

    /**
     * Native name: XmlWriterProperty_MultiLanguage
     * @type {Integer (Int32)}
     */
    static MultiLanguage => 0

    /**
     * Native name: XmlWriterProperty_Indent
     * @type {Integer (Int32)}
     */
    static Indent => 1

    /**
     * Native name: XmlWriterProperty_ByteOrderMark
     * @type {Integer (Int32)}
     */
    static ByteOrderMark => 2

    /**
     * Native name: XmlWriterProperty_OmitXmlDeclaration
     * @type {Integer (Int32)}
     */
    static OmitXmlDeclaration => 3

    /**
     * Native name: XmlWriterProperty_ConformanceLevel
     * @type {Integer (Int32)}
     */
    static ConformanceLevel => 4

    /**
     * Native name: XmlWriterProperty_CompactEmptyElement
     * @type {Integer (Int32)}
     */
    static CompactEmptyElement => 5

    /**
     * Native name: _XmlWriterProperty_Last
     * @type {Integer (Int32)}
     */
    static Last => 5
}
