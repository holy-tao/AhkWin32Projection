#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Data.Xml.XmlLite
 */
class XmlStandalone extends Win32Enum {

    /**
     * Native name: XmlStandalone_Omit
     * @type {Integer (Int32)}
     */
    static Omit => 0

    /**
     * Native name: XmlStandalone_Yes
     * @type {Integer (Int32)}
     */
    static Yes => 1

    /**
     * Native name: XmlStandalone_No
     * @type {Integer (Int32)}
     */
    static No => 2

    /**
     * Native name: _XmlStandalone_Last
     * @type {Integer (Int32)}
     */
    static Last => 2
}
