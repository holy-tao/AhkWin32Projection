#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Specifies display properties for a text ink object (tInk).
 * @remarks
 * The <b>iHeight</b>, <b>iFontAssent</b> and <b>iFontDescent</b> fields are in <b>HIMETRIC</b> units.
 * 
 * Applying italics to a text ink object slants the ink to the right.
 * @see https://learn.microsoft.com/windows/win32/api/msinkaut/ns-msinkaut-inkmetric
 * @namespace Windows.Win32.UI.TabletPC
 * @version v4.0.30319
 */
class INKMETRIC extends Win32Struct
{
    static sizeof => 20

    static packingSize => 4

    /**
     * Ink height.
     * @type {Integer}
     */
    iHeight {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * Assent height.
     * @type {Integer}
     */
    iFontAscent {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * Descent height.
     * @type {Integer}
     */
    iFontDescent {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * Ink metric flags.
     * 
     * <table>
     * <tr>
     * <th>Ink Metric Flags </th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="IMF_FONT_SELECTED_IN_HDC"></a><a id="imf_font_selected_in_hdc"></a><dl>
     * <dt><b>IMF_FONT_SELECTED_IN_HDC</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Use the ambient properties of the surrounding text.
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="IMF_ITALIC"></a><a id="imf_italic"></a><dl>
     * <dt><b>IMF_ITALIC</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Apply the italic style.
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="IMF_BOLD"></a><a id="imf_bold"></a><dl>
     * <dt><b>IMF_BOLD</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Apply the bold style.
     * 
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * Ink color.
     * @type {COLORREF}
     */
    color {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }
}
