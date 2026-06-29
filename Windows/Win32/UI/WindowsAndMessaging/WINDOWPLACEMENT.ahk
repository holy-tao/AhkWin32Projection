#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\POINT.ahk" { POINT }
#Import ".\WINDOWPLACEMENT_FLAGS.ahk" { WINDOWPLACEMENT_FLAGS }
#Import "..\..\Foundation\RECT.ahk" { RECT }

/**
 * Contains information about the placement of a window on the screen.
 * @remarks
 * If the window is a top-level window that does not have the <b>WS_EX_TOOLWINDOW</b> window style, then the coordinates represented by the following members are in workspace coordinates: <b>ptMinPosition</b>, <b>ptMaxPosition</b>, and <b>rcNormalPosition</b>. Otherwise, these members are in screen coordinates.
 * 
 * Workspace coordinates differ from screen coordinates in that they take the locations and sizes of application toolbars (including the taskbar) into account. Workspace coordinate (0,0) is the upper-left corner of the workspace area, the area of the screen not being used by application toolbars.
 * 
 * The coordinates used in a <b>WINDOWPLACEMENT</b> structure should be used only by the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-getwindowplacement">GetWindowPlacement</a> and <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-setwindowplacement">SetWindowPlacement</a> functions. Passing workspace coordinates to functions which expect screen coordinates (such as <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-setwindowpos">SetWindowPos</a>) will result in the window appearing in the wrong location. For example, if the taskbar is at the top of the screen, saving window coordinates using <b>GetWindowPlacement</b> and restoring them using <b>SetWindowPos</b> causes the window to appear to "creep" up the screen.
 * @see https://learn.microsoft.com/windows/win32/api/winuser/ns-winuser-windowplacement
 * @namespace Windows.Win32.UI.WindowsAndMessaging
 */
export default struct WINDOWPLACEMENT {
    #StructPack 4

    /**
     * Type: <b>UINT</b>
     * 
     * The length of the structure, in bytes. Before calling the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-getwindowplacement">GetWindowPlacement</a> or <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-setwindowplacement">SetWindowPlacement</a> functions, set this member to <c>sizeof(WINDOWPLACEMENT)</c>. 
     *                     
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-getwindowplacement">GetWindowPlacement</a> and <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-setwindowplacement">SetWindowPlacement</a> fail if this member is not set correctly.
     */
    length : UInt32

    /**
     * Type: <b>UINT</b>
     */
    flags : WINDOWPLACEMENT_FLAGS

    /**
     * Type: <b>UINT</b>
     * 
     * The current show state of the window. It can be any of the values that can be specified in the <i>nCmdShow</i> parameter for the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-showwindow">ShowWindow</a> function.
     */
    showCmd : UInt32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/win32/api/windef/ns-windef-point">POINT</a></b>
     * 
     * The coordinates of the window's upper-left corner when the window is minimized.
     */
    ptMinPosition : POINT

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/win32/api/windef/ns-windef-point">POINT</a></b>
     * 
     * The coordinates of the window's upper-left corner when the window is maximized.
     */
    ptMaxPosition : POINT

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a></b>
     * 
     * The window's coordinates when the window is in the restored position.
     */
    rcNormalPosition : RECT

}
