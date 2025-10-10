#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Used to pass desktop information between your GINA DLL and Winlogon.
 * @see https://docs.microsoft.com/windows/win32/api//winwlx/ns-winwlx-wlx_desktop
 * @namespace Windows.Win32.Security.WinWlx
 * @version v4.0.30319
 */
class WLX_DESKTOP extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * Specifies the size of the <b>WLX_DESKTOP</b> structure. Set to sizeof(WLX_DESKTOP).
     * @type {Integer}
     */
    Size {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

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
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * A handle to the desktop returned by <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-createdesktopa">CreateDesktop</a> and <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-opendesktopa">OpenDesktop</a>.
     * @type {Pointer<Void>}
     */
    hDesktop {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Name of the desktop.
     * @type {Pointer<Char>}
     */
    pszDesktopName {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }
}
