#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Contains values that indicate the connection state of a user session.
 * @see https://learn.microsoft.com/windows/win32/api/tssbx/ne-tssbx-wtssbx_session_state
 * @namespace Windows.Win32.System.RemoteDesktop
 */
class WTSSBX_SESSION_STATE extends Win32Enum {

    /**
     * The session state is unspecified.
     * Native name: WTSSBX_SESSION_STATE_UNSPEC
     * @type {Integer (Int32)}
     */
    static UNSPEC => 0

    /**
     * The user session is active.
     * Native name: WTSSBX_SESSION_STATE_ACTIVE
     * @type {Integer (Int32)}
     */
    static ACTIVE => 1

    /**
     * The user session is disconnected.
     * Native name: WTSSBX_SESSION_STATE_DISCONNECTED
     * @type {Integer (Int32)}
     */
    static DISCONNECTED => 2
}
