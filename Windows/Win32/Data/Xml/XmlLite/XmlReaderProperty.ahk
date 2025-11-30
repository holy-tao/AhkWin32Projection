#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Data.Xml.XmlLite
 * @version v4.0.30319
 */
class XmlReaderProperty extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static XmlReaderProperty_MultiLanguage => 0

    /**
     * @type {Integer (Int32)}
     */
    static XmlReaderProperty_ConformanceLevel => 1

    /**
     * @type {Integer (Int32)}
     */
    static XmlReaderProperty_RandomAccess => 2

    /**
     * @type {Integer (Int32)}
     */
    static XmlReaderProperty_XmlResolver => 3

    /**
     * @type {Integer (Int32)}
     */
    static XmlReaderProperty_DtdProcessing => 4

    /**
     * @type {Integer (Int32)}
     */
    static XmlReaderProperty_ReadState => 5

    /**
     * @type {Integer (Int32)}
     */
    static XmlReaderProperty_MaxElementDepth => 6

    /**
     * @type {Integer (Int32)}
     */
    static XmlReaderProperty_MaxEntityExpansion => 7

    /**
     * @type {Integer (Int32)}
     */
    static _XmlReaderProperty_Last => 7
}
