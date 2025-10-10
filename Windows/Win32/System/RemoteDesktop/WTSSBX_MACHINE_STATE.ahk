#Requires AutoHotkey v2.0.0 64-bit

/**
 * Contains values that indicate the current state of a server.
 * @see https://docs.microsoft.com/windows/win32/api//tssbx/ne-tssbx-wtssbx_machine_state
 * @namespace Windows.Win32.System.RemoteDesktop
 * @version v4.0.30319
 */
class WTSSBX_MACHINE_STATE{

    /**
     * The server state is unspecified.
     * @type {Integer (Int32)}
     */
    static WTSSBX_MACHINE_STATE_UNSPEC => 0

    /**
     * The server state is ready.
     * @type {Integer (Int32)}
     */
    static WTSSBX_MACHINE_STATE_READY => 1

    /**
     * The server is synchronizing with RD Connection Broker.
     * @type {Integer (Int32)}
     */
    static WTSSBX_MACHINE_STATE_SYNCHRONIZING => 2
}
