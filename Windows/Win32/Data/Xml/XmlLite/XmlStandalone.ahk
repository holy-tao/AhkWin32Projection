#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Data.Xml.XmlLite
 * @version v4.0.30319
 */
class XmlStandalone extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static XmlStandalone_Omit => 0

    /**
     * @type {Integer (Int32)}
     */
    static XmlStandalone_Yes => 1

    /**
     * @type {Integer (Int32)}
     */
    static XmlStandalone_No => 2

    /**
     * @type {Integer (Int32)}
     */
    static _XmlStandalone_Last => 2
}
