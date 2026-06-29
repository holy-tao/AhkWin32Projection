#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\Foundation\POINT.ahk" { POINT }

/**
 * Contains information about a mouse event passed to a WH_MOUSE hook procedure, MouseProc.
 * @see https://learn.microsoft.com/windows/win32/api/winuser/ns-winuser-mousehookstruct
 * @namespace Windows.Win32.UI.WindowsAndMessaging
 */
export default struct MOUSEHOOKSTRUCT {
    #StructPack 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/win32/api/windef/ns-windef-point">POINT</a></b>
     * 
     * The x- and y-coordinates of the cursor, in screen coordinates.
     */
    pt : POINT

    /**
     * Type: <b>HWND</b>
     * 
     * A handle to the window that will receive the mouse message corresponding to the mouse event.
     */
    hwnd : HWND

    /**
     * Type: <b>UINT</b>
     * 
     * The hit-test value. For a list of hit-test values, see the description of the <a href="https://docs.microsoft.com/windows/desktop/inputdev/wm-nchittest">WM_NCHITTEST</a> message.
     */
    wHitTestCode : UInt32

    /**
     * Type: <b>ULONG_PTR</b>
     * 
     * Additional information associated with the message.
     */
    dwExtraInfo : IntPtr

}
