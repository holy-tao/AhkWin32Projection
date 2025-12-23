#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Shell.PropertiesSystem
 * @version v4.0.30319
 */
class PROPDESC_DISPLAYTYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static PDDT_STRING => 0

    /**
     * @type {Integer (Int32)}
     */
    static PDDT_NUMBER => 1

    /**
     * @type {Integer (Int32)}
     */
    static PDDT_BOOLEAN => 2

    /**
     * @type {Integer (Int32)}
     */
    static PDDT_DATETIME => 3

    /**
     * @type {Integer (Int32)}
     */
    static PDDT_ENUMERATED => 4
}
