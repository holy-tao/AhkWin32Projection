#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Wmi
 */
class WBEMSTATUS_FORMAT extends Win32Enum {

    /**
     * Native name: WBEMSTATUS_FORMAT_NEWLINE
     * @type {Integer (Int32)}
     */
    static NEWLINE => 0

    /**
     * Native name: WBEMSTATUS_FORMAT_NO_NEWLINE
     * @type {Integer (Int32)}
     */
    static NO_NEWLINE => 1
}
