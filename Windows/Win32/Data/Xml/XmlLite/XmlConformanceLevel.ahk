#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Data.Xml.XmlLite
 */
class XmlConformanceLevel extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static XmlConformanceLevel_Auto => 0

    /**
     * @type {Integer (Int32)}
     */
    static XmlConformanceLevel_Fragment => 1

    /**
     * @type {Integer (Int32)}
     */
    static XmlConformanceLevel_Document => 2

    /**
     * @type {Integer (Int32)}
     */
    static _XmlConformanceLevel_Last => 2
}
