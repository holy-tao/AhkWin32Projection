#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug
 * @version v4.0.30319
 */
class RTL_VIRTUAL_UNWIND_HANDLER_TYPE extends Win32Enum{

    /**
     * @type {Integer (UInt32)}
     */
    static UNW_FLAG_NHANDLER => 0

    /**
     * @type {Integer (UInt32)}
     */
    static UNW_FLAG_EHANDLER => 1

    /**
     * @type {Integer (UInt32)}
     */
    static UNW_FLAG_UHANDLER => 2

    /**
     * @type {Integer (UInt32)}
     */
    static UNW_FLAG_CHAININFO => 4
}
