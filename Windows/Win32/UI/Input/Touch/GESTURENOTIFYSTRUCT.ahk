#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\POINTS.ahk" { POINTS }
#Import "..\..\..\Foundation\HWND.ahk" { HWND }

/**
 * When transmitted with WM_GESTURENOTIFY messages, passes information about a gesture.
 * @see https://learn.microsoft.com/windows/win32/api/winuser/ns-winuser-gesturenotifystruct
 * @namespace Windows.Win32.UI.Input.Touch
 */
export default struct GESTURENOTIFYSTRUCT {
    #StructPack 8

    /**
     * The size of the structure.
     */
    cbSize : UInt32 := this.Size

    /**
     * Reserved for future use.
     */
    dwFlags : UInt32

    /**
     * The target window for the gesture notification.
     */
    hwndTarget : HWND

    /**
     * The location of the gesture in physical screen coordinates.
     */
    ptsLocation : POINTS

    /**
     * A specific gesture instance with gesture messages starting with <b>GID_START</b> and ending with <b>GID_END</b>.
     */
    dwInstanceID : UInt32

}
