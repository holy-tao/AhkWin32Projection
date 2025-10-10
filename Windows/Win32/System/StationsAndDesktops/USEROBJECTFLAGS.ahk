#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains information about a window station or desktop handle.
 * @see https://docs.microsoft.com/windows/win32/api//winuser/ns-winuser-userobjectflags
 * @namespace Windows.Win32.System.StationsAndDesktops
 * @version v4.0.30319
 */
class USEROBJECTFLAGS extends Win32Struct
{
    static sizeof => 12

    static packingSize => 4

    /**
     * If this member is TRUE, new processes inherit the handle. Otherwise, the handle is not inherited.
     * @type {Integer}
     */
    fInherit {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * Reserved for future use. This member must be FALSE.
     * @type {Integer}
     */
    fReserved {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

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
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}
