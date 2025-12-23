#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Contains values that indicate the drain state of a Remote Desktop Session Host (RD Session Host) server.
 * @see https://learn.microsoft.com/windows/win32/api/tssbx/ne-tssbx-wtssbx_machine_drain
 * @namespace Windows.Win32.System.RemoteDesktop
 * @version v4.0.30319
 */
class WTSSBX_MACHINE_DRAIN extends Win32Enum{

    /**
     * The drain state of the server is unspecified.
     * @type {Integer (Int32)}
     */
    static WTSSBX_MACHINE_DRAIN_UNSPEC => 0

    /**
     * The server is accepting new user sessions.
     * @type {Integer (Int32)}
     */
    static WTSSBX_MACHINE_DRAIN_OFF => 1

    /**
     * The server is not accepting new user sessions.
     * @type {Integer (Int32)}
     */
    static WTSSBX_MACHINE_DRAIN_ON => 2
}
