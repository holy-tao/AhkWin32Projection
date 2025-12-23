#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Wmi
 * @version v4.0.30319
 */
class WBEMSTATUS_FORMAT extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static WBEMSTATUS_FORMAT_NEWLINE => 0

    /**
     * @type {Integer (Int32)}
     */
    static WBEMSTATUS_FORMAT_NO_NEWLINE => 1
}
