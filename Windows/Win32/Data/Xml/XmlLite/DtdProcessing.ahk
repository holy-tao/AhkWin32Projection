#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Data.Xml.XmlLite
 * @version v4.0.30319
 */
class DtdProcessing extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static DtdProcessing_Prohibit => 0

    /**
     * @type {Integer (Int32)}
     */
    static DtdProcessing_Parse => 1

    /**
     * @type {Integer (Int32)}
     */
    static _DtdProcessing_Last => 1
}
