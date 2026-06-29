#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\LPARAM.ahk" { LPARAM }
#Import "..\..\Foundation\POINT.ahk" { POINT }
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\Foundation\WPARAM.ahk" { WPARAM }

/**
 * Contains message information from a thread's message queue.
 * @see https://learn.microsoft.com/windows/win32/api/winuser/ns-winuser-msg
 * @namespace Windows.Win32.UI.WindowsAndMessaging
 */
export default struct MSG {
    #StructPack 8

    /**
     * Type: <b>HWND</b>
     * 
     * A handle to the window whose window procedure receives the message. This member is <b>NULL</b> when the message is a thread message.
     */
    hwnd : HWND

    /**
     * Type: <b>UINT</b>
     * 
     * The message identifier. Applications can only use the low word; the high word is reserved by the system.
     */
    message : UInt32

    /**
     * Type: <b>WPARAM</b>
     * 
     * Additional information about the message. The exact meaning depends on the value of the 
     * 					<b>message</b> member.
     */
    wParam : WPARAM

    /**
     * Type: <b>LPARAM</b>
     * 
     * Additional information about the message. The exact meaning depends on the value of the 
     * 					<b>message</b> member.
     */
    lParam : LPARAM

    /**
     * Type: <b>DWORD</b>
     * 
     * The time at which the message was posted.
     */
    time : UInt32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/win32/api/windef/ns-windef-point">POINT</a></b>
     * 
     * The cursor position, in screen coordinates, when the message was posted.
     */
    pt : POINT

}
