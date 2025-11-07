#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\HIMAGELIST.ahk
#Include ..\..\Foundation\SIZE.ahk

/**
 * Contains information that defines a split button (BS_SPLITBUTTON and BS_DEFSPLITBUTTON styles). Used with the BCM_GETSPLITINFO and BCM_SETSPLITINFO messages.
 * @remarks
 * 
 * The glyph is the image that appears on the part of the button that activates the dropdown list. By default, this is an inverted triangle. Multiple images can be added to the image list to provide different glyphs for different states of the button, such as hot and pressed.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//commctrl/ns-commctrl-button_splitinfo
 * @namespace Windows.Win32.UI.Controls
 * @version v4.0.30319
 */
class BUTTON_SPLITINFO extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * A set of flags that specify which members of this structure contain data to be set or which members are being requested. Set this member to one or more of the following flags.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="BCSIF_GLYPH"></a><a id="bcsif_glyph"></a><dl>
     * <dt><b>BCSIF_GLYPH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <b>himlGlyph</b> is valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="BCSIF_IMAGE"></a><a id="bcsif_image"></a><dl>
     * <dt><b>BCSIF_IMAGE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <b>himlGlyph</b> is valid. Use when <b>uSplitStyle</b> is set to BCSS_IMAGE.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="BCSIF_SIZE"></a><a id="bcsif_size"></a><dl>
     * <dt><b>BCSIF_SIZE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <b>size</b> is valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="BCSIF_STYLE"></a><a id="bcsif_style"></a><dl>
     * <dt><b>BCSIF_STYLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <b>uSplitStyle</b> is valid.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    mask {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b>HIMAGELIST</b>
     * 
     * A handle to the image list. The provider retains ownership of the image list and is ultimately responsible for its disposal.
     * @type {HIMAGELIST}
     */
    himlGlyph{
        get {
            if(!this.HasProp("__himlGlyph"))
                this.__himlGlyph := HIMAGELIST(8, this)
            return this.__himlGlyph
        }
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The split button style. Value must be one or more of the following flags.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="BCSS_ALIGNLEFT"></a><a id="bcss_alignleft"></a><dl>
     * <dt><b>BCSS_ALIGNLEFT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Align the image or glyph horizontally with the left margin.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="BCSS_IMAGE"></a><a id="bcss_image"></a><dl>
     * <dt><b>BCSS_IMAGE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Draw an icon image as the glyph.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="BCSS_NOSPLIT"></a><a id="bcss_nosplit"></a><dl>
     * <dt><b>BCSS_NOSPLIT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No split.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="BCSS_STRETCH"></a><a id="bcss_stretch"></a><dl>
     * <dt><b>BCSS_STRETCH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Stretch glyph, but try to retain aspect ratio.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    uSplitStyle {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/previous-versions/dd145106(v=vs.85)">SIZE</a></b>
     * 
     * A <a href="https://docs.microsoft.com/previous-versions/dd145106(v=vs.85)">SIZE</a> structure that specifies the size of the glyph in <b>himlGlyph</b>.
     * @type {SIZE}
     */
    size{
        get {
            if(!this.HasProp("__size"))
                this.__size := SIZE(24, this)
            return this.__size
        }
    }
}
