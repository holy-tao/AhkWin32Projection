#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.RemoteDesktop
 */
class SESSION_TIMEOUT_ACTION_TYPE extends Win32Enum {

    /**
     * Native name: SESSION_TIMEOUT_ACTION_DISCONNECT
     * @type {Integer (Int32)}
     */
    static DISCONNECT => 0

    /**
     * Native name: SESSION_TIMEOUT_ACTION_SILENT_REAUTH
     * @type {Integer (Int32)}
     */
    static SILENT_REAUTH => 1
}
