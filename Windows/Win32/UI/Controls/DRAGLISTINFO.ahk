#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DRAGLISTINFO_NOTIFICATION_FLAGS.ahk" { DRAGLISTINFO_NOTIFICATION_FLAGS }
#Import "..\..\Foundation\POINT.ahk" { POINT }
#Import "..\..\Foundation\HWND.ahk" { HWND }

/**
 * Contains information about a drag event. The pointer to DRAGLISTINFO is passed as the lParam parameter of the drag list message.
 * @see https://learn.microsoft.com/windows/win32/api/commctrl/ns-commctrl-draglistinfo
 * @namespace Windows.Win32.UI.Controls
 */
export default struct DRAGLISTINFO {
    #StructPack 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     */
    uNotification : DRAGLISTINFO_NOTIFICATION_FLAGS

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HWND</a></b>
     * 
     * A handle to the drag list box.
     */
    hWnd : HWND

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/win32/api/windef/ns-windef-point">POINT</a></b>
     * 
     * A <a href="https://docs.microsoft.com/windows/win32/api/windef/ns-windef-point">POINT</a> structure that contains the current x- and y-coordinates of the mouse cursor.
     */
    ptCursor : POINT

}
