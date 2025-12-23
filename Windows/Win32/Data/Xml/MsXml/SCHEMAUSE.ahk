#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Data.Xml.MsXml
 * @version v4.0.30319
 */
class SCHEMAUSE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static SCHEMAUSE_OPTIONAL => 0

    /**
     * @type {Integer (Int32)}
     */
    static SCHEMAUSE_PROHIBITED => 1

    /**
     * @type {Integer (Int32)}
     */
    static SCHEMAUSE_REQUIRED => 2
}
