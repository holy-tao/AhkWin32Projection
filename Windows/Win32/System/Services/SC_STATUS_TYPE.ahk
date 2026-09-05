#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Services
 */
class SC_STATUS_TYPE extends Win32Enum {

    /**
     * Native name: SC_STATUS_PROCESS_INFO
     * @type {Integer (Int32)}
     */
    static PROCESS_INFO => 0
}
