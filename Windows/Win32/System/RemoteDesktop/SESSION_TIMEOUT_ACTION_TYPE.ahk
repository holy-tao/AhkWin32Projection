#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.RemoteDesktop
 * @version v4.0.30319
 */
class SESSION_TIMEOUT_ACTION_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static SESSION_TIMEOUT_ACTION_DISCONNECT => 0

    /**
     * @type {Integer (Int32)}
     */
    static SESSION_TIMEOUT_ACTION_SILENT_REAUTH => 1
}
