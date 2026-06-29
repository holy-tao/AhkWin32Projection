#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\POINT.ahk" { POINT }

/**
 * The DRAWPATRECT structure defines a rectangle to be created.
 * @remarks
 * This structure is used with the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/dd162495(v=vs.85)">DRAWPATTERNRECT</a> printer escape.
 * @see https://learn.microsoft.com/windows/win32/api/wingdi/ns-wingdi-drawpatrect
 * @namespace Windows.Win32.Storage.Xps
 */
export default struct DRAWPATRECT {
    #StructPack 4

    /**
     * The upper-left corner of the rectangle, in logical units.
     */
    ptPosition : POINT

    /**
     * The lower-right corner of the rectangle, in logical units.
     */
    ptSize : POINT

    /**
     * The style of the rectangle. It can be one of the following.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td>0</td>
     * <td>Black rectangle.</td>
     * </tr>
     * <tr>
     * <td>1</td>
     * <td>White rectangle.</td>
     * </tr>
     * <tr>
     * <td>2</td>
     * <td>Gray rectangle. Used with <b>wPattern</b>.</td>
     * </tr>
     * </table>
     */
    wStyle : UInt16

    /**
     * Amount of grayness of the rectangle, as a percentage (0-100). A value of 0 means a white rectangle and 100 means a black rectangle. This is only used when <b>wStyle</b> is 2.
     */
    wPattern : UInt16

}
