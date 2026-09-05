#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Data.Xml.XmlLite
 */
class XmlConformanceLevel extends Win32Enum {

    /**
     * Native name: XmlConformanceLevel_Auto
     * @type {Integer (Int32)}
     */
    static Auto => 0

    /**
     * Native name: XmlConformanceLevel_Fragment
     * @type {Integer (Int32)}
     */
    static Fragment => 1

    /**
     * Native name: XmlConformanceLevel_Document
     * @type {Integer (Int32)}
     */
    static Document => 2

    /**
     * Native name: _XmlConformanceLevel_Last
     * @type {Integer (Int32)}
     */
    static Last => 2
}
