#Requires AutoHotkey v2.0.0 64-bit

/**
 * Contains values that indicate the session mode of a Remote Desktop Session Host (RD Session Host) server.
 * @see https://docs.microsoft.com/windows/win32/api//tssbx/ne-tssbx-wtssbx_machine_session_mode
 * @namespace Windows.Win32.System.RemoteDesktop
 * @version v4.0.30319
 */
class WTSSBX_MACHINE_SESSION_MODE{

    /**
     * The session mode of the server is unspecified.
     * @type {Integer (Int32)}
     */
    static WTSSBX_MACHINE_SESSION_MODE_UNSPEC => 0

    /**
     * The server is in single session mode. It can only accept one session per user.
     * @type {Integer (Int32)}
     */
    static WTSSBX_MACHINE_SESSION_MODE_SINGLE => 1

    /**
     * The server is in multiple session mode. It can accept multiple sessions per user.
     * @type {Integer (Int32)}
     */
    static WTSSBX_MACHINE_SESSION_MODE_MULTIPLE => 2
}
