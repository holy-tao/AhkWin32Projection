#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import ".\SET_WINDOW_POS_FLAGS.ahk" { SET_WINDOW_POS_FLAGS }

/**
 * Contains information about the size and position of a window.
 * @see https://learn.microsoft.com/windows/win32/api/winuser/ns-winuser-windowpos
 * @namespace Windows.Win32.UI.WindowsAndMessaging
 */
export default struct WINDOWPOS {
    #StructPack 8

    /**
     * Type: <b>HWND</b>
     * 
     * A handle to the window.
     */
    hwnd : HWND

    /**
     * Type: <b>HWND</b>
     * 
     * The position of the window in Z order (front-to-back position). This member can be a handle to the window behind which this window is placed, or can be one of the special values listed with the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-setwindowpos">SetWindowPos</a> function.
     */
    hwndInsertAfter : HWND

    /**
     * Type: <b>int</b>
     * 
     * The position of the left edge of the window.
     */
    x : Int32

    /**
     * Type: <b>int</b>
     * 
     * The position of the top edge of the window.
     */
    y : Int32

    /**
     * Type: <b>int</b>
     * 
     * The window width, in pixels.
     */
    cx : Int32

    /**
     * Type: <b>int</b>
     * 
     * The window height, in pixels.
     */
    cy : Int32

    /**
     * Type: <b>UINT</b>
     */
    flags : SET_WINDOW_POS_FLAGS

}
