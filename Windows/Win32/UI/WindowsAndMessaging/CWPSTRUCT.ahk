#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\LPARAM.ahk" { LPARAM }
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\Foundation\WPARAM.ahk" { WPARAM }

/**
 * Defines the message parameters passed to a WH_CALLWNDPROC hook procedure, CallWndProc.
 * @see https://learn.microsoft.com/windows/win32/api/winuser/ns-winuser-cwpstruct
 * @namespace Windows.Win32.UI.WindowsAndMessaging
 */
export default struct CWPSTRUCT {
    #StructPack 8

    /**
     * Type: <b>LPARAM</b>
     * 
     * Additional information about the message. The exact meaning depends on the 
     * 					<b>message</b> value.
     */
    lParam : LPARAM

    /**
     * Type: <b>WPARAM</b>
     * 
     * Additional information about the message. The exact meaning depends on the 
     * 					<b>message</b> value.
     */
    wParam : WPARAM

    /**
     * Type: <b>UINT</b>
     * 
     * The message.
     */
    message : UInt32

    /**
     * Type: <b>HWND</b>
     * 
     * A handle to the window to receive the message.
     */
    hwnd : HWND

}
