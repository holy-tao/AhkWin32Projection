#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\System\StationsAndDesktops\HDESK.ahk" { HDESK }

/**
 * Used to pass desktop information between your GINA DLL and Winlogon.
 * @see https://learn.microsoft.com/windows/win32/api/winwlx/ns-winwlx-wlx_desktop
 * @namespace Windows.Win32.Security.WinWlx
 */
export default struct WLX_DESKTOP {
    #StructPack 8

    /**
     * Specifies the size of the <b>WLX_DESKTOP</b> structure. Set to sizeof(WLX_DESKTOP).
     */
    Size : UInt32

    /**
     * Specifies the valid fields. Specify one of the following.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WLX_DESKTOP_NAME"></a><a id="wlx_desktop_name"></a><dl>
     * <dt><b>WLX_DESKTOP_NAME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates that the name specified in <b>pszDesktopName</b> is valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WLX_DESKTOP_HANDLE"></a><a id="wlx_desktop_handle"></a><dl>
     * <dt><b>WLX_DESKTOP_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates that the handle specified in <b>hDesktop</b> is valid.
     * 
     * </td>
     * </tr>
     * </table>
     */
    Flags : UInt32

    /**
     * A handle to the desktop returned by <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-createdesktopa">CreateDesktop</a> and <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-opendesktopa">OpenDesktop</a>.
     */
    hDesktop : HDESK

    /**
     * Name of the desktop.
     */
    pszDesktopName : PWSTR

}
