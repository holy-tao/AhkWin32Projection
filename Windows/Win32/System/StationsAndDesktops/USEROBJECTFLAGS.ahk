#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * Contains information about a window station or desktop handle.
 * @see https://learn.microsoft.com/windows/win32/api/winuser/ns-winuser-userobjectflags
 * @namespace Windows.Win32.System.StationsAndDesktops
 */
export default struct USEROBJECTFLAGS {
    #StructPack 4

    /**
     * If this member is TRUE, new processes inherit the handle. Otherwise, the handle is not inherited.
     */
    fInherit : BOOL

    /**
     * Reserved for future use. This member must be FALSE.
     */
    fReserved : BOOL

    /**
     * For window stations, this member can contain the following window station attribute.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WSF_VISIBLE"></a><a id="wsf_visible"></a><dl>
     * <dt><b>WSF_VISIBLE</b></dt>
     * <dt>0x0001L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Window station has visible display surfaces.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * For desktops, the <b>dwFlags</b> member can contain the following value.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DF_ALLOWOTHERACCOUNTHOOK"></a><a id="df_allowotheraccounthook"></a><dl>
     * <dt><b>DF_ALLOWOTHERACCOUNTHOOK</b></dt>
     * <dt>0x0001L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Allows processes running in other accounts on the desktop to set hooks in this process.
     * 
     * </td>
     * </tr>
     * </table>
     */
    dwFlags : UInt32

}
