#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\POINT.ahk

/**
 * The DRAWPATRECT structure defines a rectangle to be created.
 * @remarks
 * This structure is used with the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/dd162495(v=vs.85)">DRAWPATTERNRECT</a> printer escape.
 * @see https://learn.microsoft.com/windows/win32/api/wingdi/ns-wingdi-drawpatrect
 * @namespace Windows.Win32.Storage.Xps
 * @version v4.0.30319
 */
class DRAWPATRECT extends Win32Struct
{
    static sizeof => 20

    static packingSize => 4

    /**
     * The upper-left corner of the rectangle, in logical units.
     * @type {POINT}
     */
    ptPosition{
        get {
            if(!this.HasProp("__ptPosition"))
                this.__ptPosition := POINT(0, this)
            return this.__ptPosition
        }
    }

    /**
     * The lower-right corner of the rectangle, in logical units.
     * @type {POINT}
     */
    ptSize{
        get {
            if(!this.HasProp("__ptSize"))
                this.__ptSize := POINT(8, this)
            return this.__ptSize
        }
    }

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
     * @type {Integer}
     */
    wStyle {
        get => NumGet(this, 16, "ushort")
        set => NumPut("ushort", value, this, 16)
    }

    /**
     * Amount of grayness of the rectangle, as a percentage (0-100). A value of 0 means a white rectangle and 100 means a black rectangle. This is only used when <b>wStyle</b> is 2.
     * @type {Integer}
     */
    wPattern {
        get => NumGet(this, 18, "ushort")
        set => NumPut("ushort", value, this, 18)
    }
}
