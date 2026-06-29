#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\LPARAM.ahk" { LPARAM }
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\Foundation\RECT.ahk" { RECT }

/**
 * Contains information about a system appbar message.
 * @see https://learn.microsoft.com/windows/win32/api/shellapi/ns-shellapi-appbardata
 * @namespace Windows.Win32.UI.Shell
 * @architecture X64, Arm64
 */
export default struct APPBARDATA {
    #StructPack 8

    /**
     * Type: <b>DWORD</b>
     * 
     * The size of the structure, in bytes.
     */
    cbSize : UInt32 := this.Size

    /**
     * Type: <b>HWND</b>
     * 
     * The handle to the appbar window. Not all messages use this member. See the individual message page to see if you need to provide an <b>hWind</b> value.
     */
    hWnd : HWND

    /**
     * Type: <b>UINT</b>
     * 
     * An application-defined message identifier. The application uses the specified identifier for notification messages that it sends to the appbar identified by the <b>hWnd</b> member. This member is used when sending the <a href="https://docs.microsoft.com/windows/desktop/shell/abm-new">ABM_NEW</a> message.
     */
    uCallbackMessage : UInt32

    /**
     * Type: <b>UINT</b>
     * 
     * A value that specifies an edge of the screen. This member is used when sending one of these messages:
     *                         
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/shell/conversion-functions-bumper">ABM_GETAUTOHIDEBAR</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/shell/dialogs-bumper">ABM_SETAUTOHIDEBAR</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/shell/abm-getautohidebarex">ABM_GETAUTOHIDEBAREX</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/shell/abm-setautohidebarex">ABM_SETAUTOHIDEBAREX</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/shell/abm-querypos">ABM_QUERYPOS</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/shell/abm-setpos">ABM_SETPOS</a>
     * </li>
     * </ul>
     */
    uEdge : UInt32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a></b>
     * 
     * A <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a> structure whose use varies depending on the message:
     *                     
     *                         
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/shell/abm-gettaskbarpos">ABM_GETTASKBARPOS</a>, <a href="https://docs.microsoft.com/windows/desktop/shell/abm-querypos">ABM_QUERYPOS</a>, <a href="https://docs.microsoft.com/windows/desktop/shell/abm-setpos">ABM_SETPOS</a>: The bounding rectangle, in screen coordinates, of an appbar or the Windows taskbar.</li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/shell/abm-getautohidebarex">ABM_GETAUTOHIDEBAREX</a>, <a href="https://docs.microsoft.com/windows/desktop/shell/abm-setautohidebarex">ABM_SETAUTOHIDEBAREX</a>: The monitor on which the operation is being performed. This information can be retrieved through the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-getmonitorinfoa">GetMonitorInfo</a> function.</li>
     * </ul>
     */
    rc : RECT

    /**
     * Type: <b>LPARAM</b>
     * 
     * A message-dependent value. This member is used with these messages:
     *                         
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/shell/abm-setautohidebar">ABM_SETAUTOHIDEBAR</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/shell/abm-setautohidebarex">ABM_SETAUTOHIDEBAREX</a>
     * </li>
     * <li>
     * <a href="windows/desktop/shell/abm-setstate">ABM_SETSTATE</a>
     * </li>
     * </ul>
     * 
     * 
     * See the individual message pages for details.
     */
    lParam : LPARAM

}
