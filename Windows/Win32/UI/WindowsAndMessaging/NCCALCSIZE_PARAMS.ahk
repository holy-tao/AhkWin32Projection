#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WINDOWPOS.ahk" { WINDOWPOS }
#Import "..\..\Foundation\RECT.ahk" { RECT }

/**
 * Contains information that an application can use while processing the WM_NCCALCSIZE message to calculate the size, position, and valid contents of the client area of a window.
 * @see https://learn.microsoft.com/windows/win32/api/winuser/ns-winuser-nccalcsize_params
 * @namespace Windows.Win32.UI.WindowsAndMessaging
 */
export default struct NCCALCSIZE_PARAMS {
    #StructPack 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a>[3]</b>
     * 
     * An array of rectangles. The meaning of the array of rectangles changes during the processing of the <a href="https://docs.microsoft.com/windows/desktop/winmsg/wm-nccalcsize">WM_NCCALCSIZE</a> message.
     * 
     * When the window procedure receives the <a href="https://docs.microsoft.com/windows/desktop/winmsg/wm-nccalcsize">WM_NCCALCSIZE</a> message, the first rectangle contains the new coordinates of a window that has been moved or resized, that is, it is the proposed new window coordinates. The second contains the coordinates of the window before it was moved or resized. The third contains the coordinates of the window's client area before the window was moved or resized. If the window is a child window, the coordinates are relative to the client area of the parent window. If the window is a top-level window, the coordinates are relative to the screen origin.
     * 
     * When the window procedure returns, the first rectangle contains the coordinates of the new client rectangle resulting from the move or resize.  The second rectangle contains the valid destination rectangle, and the third rectangle contains the valid source rectangle.  The last two rectangles are used in conjunction with the return value of the <a href="https://docs.microsoft.com/windows/desktop/winmsg/wm-nccalcsize">WM_NCCALCSIZE</a> message to determine the area of the window to be preserved.
     */
    rgrc : RECT[3]

    /**
     * Type: <b>PWINDOWPOS</b>
     * 
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winuser/ns-winuser-windowpos">WINDOWPOS</a> structure that contains the size and position values specified in the operation that moved or resized the window.
     */
    lppos : WINDOWPOS.Ptr

}
