#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Contains values that indicate the connection state of a user session.
 * @see https://docs.microsoft.com/windows/win32/api//tssbx/ne-tssbx-wtssbx_session_state
 * @namespace Windows.Win32.System.RemoteDesktop
 * @version v4.0.30319
 */
class WTSSBX_SESSION_STATE extends Win32Enum{

    /**
     * The session state is unspecified.
     * @type {Integer (Int32)}
     */
    static WTSSBX_SESSION_STATE_UNSPEC => 0

    /**
     * The user session is active.
     * @type {Integer (Int32)}
     */
    static WTSSBX_SESSION_STATE_ACTIVE => 1

    /**
     * The user session is disconnected.
     * @type {Integer (Int32)}
     */
    static WTSSBX_SESSION_STATE_DISCONNECTED => 2
}
