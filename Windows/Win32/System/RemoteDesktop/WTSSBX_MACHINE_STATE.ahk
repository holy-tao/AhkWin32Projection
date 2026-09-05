#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Contains values that indicate the current state of a server.
 * @see https://learn.microsoft.com/windows/win32/api/tssbx/ne-tssbx-wtssbx_machine_state
 * @namespace Windows.Win32.System.RemoteDesktop
 */
class WTSSBX_MACHINE_STATE extends Win32Enum {

    /**
     * The server state is unspecified.
     * Native name: WTSSBX_MACHINE_STATE_UNSPEC
     * @type {Integer (Int32)}
     */
    static UNSPEC => 0

    /**
     * The server state is ready.
     * Native name: WTSSBX_MACHINE_STATE_READY
     * @type {Integer (Int32)}
     */
    static READY => 1

    /**
     * The server is synchronizing with RD Connection Broker.
     * Native name: WTSSBX_MACHINE_STATE_SYNCHRONIZING
     * @type {Integer (Int32)}
     */
    static SYNCHRONIZING => 2
}
