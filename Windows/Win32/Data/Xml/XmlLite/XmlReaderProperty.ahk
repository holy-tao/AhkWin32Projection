#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Data.Xml.XmlLite
 */
class XmlReaderProperty extends Win32Enum {

    /**
     * Native name: XmlReaderProperty_MultiLanguage
     * @type {Integer (Int32)}
     */
    static MultiLanguage => 0

    /**
     * Native name: XmlReaderProperty_ConformanceLevel
     * @type {Integer (Int32)}
     */
    static ConformanceLevel => 1

    /**
     * Native name: XmlReaderProperty_RandomAccess
     * @type {Integer (Int32)}
     */
    static RandomAccess => 2

    /**
     * Native name: XmlReaderProperty_XmlResolver
     * @type {Integer (Int32)}
     */
    static XmlResolver => 3

    /**
     * Native name: XmlReaderProperty_DtdProcessing
     * @type {Integer (Int32)}
     */
    static DtdProcessing => 4

    /**
     * Native name: XmlReaderProperty_ReadState
     * @type {Integer (Int32)}
     */
    static ReadState => 5

    /**
     * Native name: XmlReaderProperty_MaxElementDepth
     * @type {Integer (Int32)}
     */
    static MaxElementDepth => 6

    /**
     * Native name: XmlReaderProperty_MaxEntityExpansion
     * @type {Integer (Int32)}
     */
    static MaxEntityExpansion => 7

    /**
     * Native name: _XmlReaderProperty_Last
     * @type {Integer (Int32)}
     */
    static Last => 7
}
