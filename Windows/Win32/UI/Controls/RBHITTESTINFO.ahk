#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\POINT.ahk

/**
 * Contains information specific to a hit test operation. This structure is used with the RB_HITTEST message.
 * @see https://learn.microsoft.com/windows/win32/api/commctrl/ns-commctrl-rbhittestinfo
 * @namespace Windows.Win32.UI.Controls
 * @version v4.0.30319
 */
class RBHITTESTINFO extends Win32Struct
{
    static sizeof => 16

    static packingSize => 4

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/win32/api/windef/ns-windef-point">POINT</a></b>
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/win32/api/windef/ns-windef-point">POINT</a> structure that describes the point to be hit tested, in client coordinates.
     * @type {POINT}
     */
    pt{
        get {
            if(!this.HasProp("__pt"))
                this.__pt := POINT(0, this)
            return this.__pt
        }
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Member that receives a flag value indicating the rebar band's component located at the point described by <b>pt</b>. This member will be one of the following:
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RBHT_CAPTION"></a><a id="rbht_caption"></a><dl>
     * <dt><b>RBHT_CAPTION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The point was in the rebar band's caption.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RBHT_CHEVRON"></a><a id="rbht_chevron"></a><dl>
     * <dt><b>RBHT_CHEVRON</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The point was in the rebar band's chevron (version 5.80 and greater).
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RBHT_CLIENT"></a><a id="rbht_client"></a><dl>
     * <dt><b>RBHT_CLIENT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The point was in the rebar band's client area. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RBHT_GRABBER"></a><a id="rbht_grabber"></a><dl>
     * <dt><b>RBHT_GRABBER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The point was in the rebar band's gripper. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RBHT_NOWHERE"></a><a id="rbht_nowhere"></a><dl>
     * <dt><b>RBHT_NOWHERE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The point was not in a rebar band. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RBHT_SPLITTER"></a><a id="rbht_splitter"></a><dl>
     * <dt><b>RBHT_SPLITTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The point was in the rebar band's splitter.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    flags {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Type: <b>int</b>
     * 
     * Member that receives the rebar band's index at the point described by <b>pt</b>. This value will be the zero-based index of the band, or -1 if no band was at the hit-tested point.
     * @type {Integer}
     */
    iBand {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }
}
