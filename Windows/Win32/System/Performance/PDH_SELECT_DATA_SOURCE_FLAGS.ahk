#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Performance
 */
class PDH_SELECT_DATA_SOURCE_FLAGS extends Win32Enum {

    /**
     * Native name: PDH_FLAGS_FILE_BROWSER_ONLY
     * @type {Integer (UInt32)}
     */
    static FILE_BROWSER_ONLY => 1

    /**
     * Native name: PDH_FLAGS_NONE
     * @type {Integer (UInt32)}
     */
    static NONE => 0
}
