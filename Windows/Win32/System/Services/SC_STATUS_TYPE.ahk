#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Services
 * @version v4.0.30319
 */
class SC_STATUS_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static SC_STATUS_PROCESS_INFO => 0
}
