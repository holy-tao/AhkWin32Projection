#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Provides information about the session change notification. A service receives this structure in its HandlerEx function in response to a session change event.
 * @see https://learn.microsoft.com/windows/win32/api/winuser/ns-winuser-wtssession_notification
 * @namespace Windows.Win32.System.RemoteDesktop
 */
export default struct WTSSESSION_NOTIFICATION {
    #StructPack 4

    /**
     * Size, in bytes, of this structure.
     */
    cbSize : UInt32 := this.Size

    /**
     * Session identifier that triggered the session change event.
     */
    dwSessionId : UInt32

}
