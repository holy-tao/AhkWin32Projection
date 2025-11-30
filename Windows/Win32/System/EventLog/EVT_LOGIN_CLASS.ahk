#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines the types of connection methods you can use to connect to the remote computer.
 * @see https://docs.microsoft.com/windows/win32/api//winevt/ne-winevt-evt_login_class
 * @namespace Windows.Win32.System.EventLog
 * @version v4.0.30319
 */
class EVT_LOGIN_CLASS extends Win32Enum{

    /**
     * Use Remote Procedure Call (RPC) login.
     * @type {Integer (Int32)}
     */
    static EvtRpcLogin => 1
}
