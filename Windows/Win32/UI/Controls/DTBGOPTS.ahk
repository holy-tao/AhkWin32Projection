#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\RECT.ahk

/**
 * Defines the options for the DrawThemeBackgroundEx function.
 * @see https://learn.microsoft.com/windows/win32/api/uxtheme/ns-uxtheme-dtbgopts
 * @namespace Windows.Win32.UI.Controls
 * @version v4.0.30319
 */
class DTBGOPTS extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * Size of the structure. Set this to sizeof(DTBGOPTS).
     * @type {Integer}
     */
    dwSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * Flags that specify the selected options. This member can be one of the following:
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DTBG_CLIPRECT"></a><a id="dtbg_cliprect"></a><dl>
     * <dt><b>DTBG_CLIPRECT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <b>rcClip</b> specifies the rectangle to which drawing is clipped.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DTBG_DRAWSOLID"></a><a id="dtbg_drawsolid"></a><dl>
     * <dt><b>DTBG_DRAWSOLID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Deprecated. Draw transparent and alpha images as solid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DTBG_OMITBORDER"></a><a id="dtbg_omitborder"></a><dl>
     * <dt><b>DTBG_OMITBORDER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Do not draw the border of the part (currently this value is only supported for bgtype=borderfill).
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DTBG_OMITCONTENT"></a><a id="dtbg_omitcontent"></a><dl>
     * <dt><b>DTBG_OMITCONTENT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Do not draw the content area of the part (currently this value is only supported for bgtype=borderfill).
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DTBG_COMPUTINGREGION"></a><a id="dtbg_computingregion"></a><dl>
     * <dt><b>DTBG_COMPUTINGREGION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Deprecated.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DTBG_MIRRORDC"></a><a id="dtbg_mirrordc"></a><dl>
     * <dt><b>DTBG_MIRRORDC</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Assume the <b>hdc</b> is mirrored and flip images as appropriate (currently this value is only supported for bgtype=imagefile).
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DTBG_NOMIRROR"></a><a id="dtbg_nomirror"></a><dl>
     * <dt><b>DTBG_NOMIRROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Do not mirror the output; even in right-to-left (RTL) layout.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DTBG_VALIDBITS"></a><a id="dtbg_validbits"></a><dl>
     * <dt><b>DTBG_VALIDBITS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * DTBG_CLIPRECT | DTBG_DRAWSOLID | DTBG_OMITBORDER | DTBG_OMITCONTENT | DTBG_COMPUTINGREGION | DTBG_MIRRORDC | DTBG_NOMIRROR.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a></b>
     * 
     * A <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a> that specifies the bounding rectangle of the clip region.
     * @type {RECT}
     */
    rcClip{
        get {
            if(!this.HasProp("__rcClip"))
                this.__rcClip := RECT(this.ptr + 8)
            return this.__rcClip
        }
    }
}
