#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import ".\GUITHREADINFO_FLAGS.ahk" { GUITHREADINFO_FLAGS }
#Import "..\..\Foundation\RECT.ahk" { RECT }

/**
 * Contains information about a GUI thread.
 * @remarks
 * This structure is used with the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-getguithreadinfo">GetGUIThreadInfo</a> function to retrieve information about the active window or a specified GUI thread.
 * @see https://learn.microsoft.com/windows/win32/api/winuser/ns-winuser-guithreadinfo
 * @namespace Windows.Win32.UI.WindowsAndMessaging
 */
export default struct GUITHREADINFO {
    #StructPack 8

    /**
     * Type: <b>DWORD</b>
     * 
     * The size of this structure, in bytes. The caller must set this member to <c>sizeof(GUITHREADINFO)</c>.
     */
    cbSize : UInt32 := this.Size

    /**
     * Type: <b>DWORD</b>
     */
    flags : GUITHREADINFO_FLAGS

    /**
     * Type: <b>HWND</b>
     * 
     * A handle to the active window within the thread.
     */
    hwndActive : HWND

    /**
     * Type: <b>HWND</b>
     * 
     * A handle to the window that has the keyboard focus.
     */
    hwndFocus : HWND

    /**
     * Type: <b>HWND</b>
     * 
     * A handle to the window that has captured the mouse.
     */
    hwndCapture : HWND

    /**
     * Type: <b>HWND</b>
     * 
     * A handle to the window that owns any active menus.
     */
    hwndMenuOwner : HWND

    /**
     * Type: <b>HWND</b>
     * 
     * A handle to the window in a move or size loop.
     */
    hwndMoveSize : HWND

    /**
     * Type: <b>HWND</b>
     * 
     * A handle to the window that is displaying the caret.
     */
    hwndCaret : HWND

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a></b>
     * 
     * The caret's bounding rectangle, in client coordinates, relative to the window specified by the <b>hwndCaret</b> member.
     */
    rcCaret : RECT

}
