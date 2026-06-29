#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\COLORREF.ahk" { COLORREF }

/**
 * Specifies display properties for a text ink object (tInk).
 * @remarks
 * The <b>iHeight</b>, <b>iFontAssent</b> and <b>iFontDescent</b> fields are in <b>HIMETRIC</b> units.
 * 
 * Applying italics to a text ink object slants the ink to the right.
 * @see https://learn.microsoft.com/windows/win32/api/msinkaut/ns-msinkaut-inkmetric
 * @namespace Windows.Win32.UI.TabletPC
 */
export default struct INKMETRIC {
    #StructPack 4

    /**
     * Ink height.
     */
    iHeight : Int32

    /**
     * Assent height.
     */
    iFontAscent : Int32

    /**
     * Descent height.
     */
    iFontDescent : Int32

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
     */
    dwFlags : UInt32

    /**
     * Ink color.
     */
    color : COLORREF

}
