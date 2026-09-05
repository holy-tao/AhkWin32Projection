#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Contains values that indicate the drain state of a Remote Desktop Session Host (RD Session Host) server.
 * @see https://learn.microsoft.com/windows/win32/api/tssbx/ne-tssbx-wtssbx_machine_drain
 * @namespace Windows.Win32.System.RemoteDesktop
 */
class WTSSBX_MACHINE_DRAIN extends Win32Enum {

    /**
     * The drain state of the server is unspecified.
     * Native name: WTSSBX_MACHINE_DRAIN_UNSPEC
     * @type {Integer (Int32)}
     */
    static UNSPEC => 0

    /**
     * The server is accepting new user sessions.
     * Native name: WTSSBX_MACHINE_DRAIN_OFF
     * @type {Integer (Int32)}
     */
    static OFF => 1

    /**
     * The server is not accepting new user sessions.
     * Native name: WTSSBX_MACHINE_DRAIN_ON
     * @type {Integer (Int32)}
     */
    static ON => 2
}
