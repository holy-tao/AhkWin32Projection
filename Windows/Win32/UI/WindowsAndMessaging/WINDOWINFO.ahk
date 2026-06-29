#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WINDOW_STYLE.ahk" { WINDOW_STYLE }
#Import "..\..\Foundation\RECT.ahk" { RECT }
#Import ".\WINDOW_EX_STYLE.ahk" { WINDOW_EX_STYLE }

/**
 * Contains window information.
 * @see https://learn.microsoft.com/windows/win32/api/winuser/ns-winuser-windowinfo
 * @namespace Windows.Win32.UI.WindowsAndMessaging
 */
export default struct WINDOWINFO {
    #StructPack 4

    /**
     * Type: <b>DWORD</b>
     * 
     * The size of the structure, in bytes. The caller must set this member to <c>sizeof(WINDOWINFO)</c>.
     */
    cbSize : UInt32 := this.Size

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a></b>
     * 
     * The coordinates of the window.
     */
    rcWindow : RECT

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a></b>
     * 
     * The coordinates of the client area.
     */
    rcClient : RECT

    /**
     * Type: <b>DWORD</b>
     * 
     * The window styles. For a table of window styles, see <a href="https://docs.microsoft.com/windows/desktop/winmsg/window-styles">Window Styles</a>.
     */
    dwStyle : WINDOW_STYLE

    /**
     * Type: <b>DWORD</b>
     * 
     * The extended window styles. For a table of extended window styles, see <a href="https://docs.microsoft.com/windows/desktop/winmsg/extended-window-styles">Extended Window Styles</a>.
     */
    dwExStyle : WINDOW_EX_STYLE

    /**
     * Type: <b>DWORD</b>
     * 
     * The window status. If this member is <b>WS_ACTIVECAPTION</b> (0x0001), the window is active. Otherwise, this member is zero.
     */
    dwWindowStatus : UInt32

    /**
     * Type: <b>UINT</b>
     * 
     * The width of the window border, in pixels.
     */
    cxWindowBorders : UInt32

    /**
     * Type: <b>UINT</b>
     * 
     * The height of the window border, in pixels.
     */
    cyWindowBorders : UInt32

    /**
     * Type: <b>ATOM</b>
     * 
     * The window class atom (see <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-registerclassa">RegisterClass</a>).
     */
    atomWindowType : UInt16

    /**
     * Type: <b>WORD</b>
     * 
     * The Windows version of the application that created the window.
     */
    wCreatorVersion : UInt16

}
