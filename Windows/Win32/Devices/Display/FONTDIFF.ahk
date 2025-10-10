#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\POINTL.ahk

/**
 * The FONTDIFF structure describes all of the characteristics that are different between a base font and one of its simulations.
 * @remarks
 * 
  * If a font has already been emboldened, the only possible remaining simulation is italicization, yielding a bold italic simulation. Similarly, an italicized font can only be emboldened, also yielding a bold italic simulation.
  * 
  * For descriptions of the FSHORT and FWORD data types, see <a href="https://docs.microsoft.com/windows-hardware/drivers/display/gdi-data-types">GDI Data Types</a>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//winddi/ns-winddi-fontdiff
 * @namespace Windows.Win32.Devices.Display
 * @version v4.0.30319
 */
class FONTDIFF extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * 
     * @type {Integer}
     */
    jReserved1 {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }

    /**
     * 
     * @type {Integer}
     */
    jReserved2 {
        get => NumGet(this, 1, "char")
        set => NumPut("char", value, this, 1)
    }

    /**
     * Are reserved for system use.
     * @type {Integer}
     */
    jReserved3 {
        get => NumGet(this, 2, "char")
        set => NumPut("char", value, this, 2)
    }

    /**
     * Specifies the Panose weight.
     * @type {Integer}
     */
    bWeight {
        get => NumGet(this, 3, "char")
        set => NumPut("char", value, this, 3)
    }

    /**
     * Specifies the weight of the font in the range 0 to 1000 (for example, 400 is normal and 700 is bold). This value is provided to the application in the <b>lfWeight</b> member of the Win32 LOGFONT structure.
     * @type {Integer}
     */
    usWinWeight {
        get => NumGet(this, 4, "ushort")
        set => NumPut("ushort", value, this, 4)
    }

    /**
     * Specifies a combination of the following flags:
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td>
     * FM_SEL_BOLD
     * 
     * </td>
     * <td>
     * Set if the characters of the font are bold.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * FM_SEL_ITALIC
     * 
     * </td>
     * <td>
     * Set if the characters of the font are italic.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * FM_SEL_NEGATIVE
     * 
     * </td>
     * <td>
     * Set if the characters of the font have the foreground and background reversed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * FM_SEL_OUTLINED
     * 
     * </td>
     * <td>
     * Set if the characters of the font are hollow.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * FM_SEL_REGULAR
     * 
     * </td>
     * <td>
     * Set if the characters of the font are normal weight.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * FM_SEL_STRIKEOUT
     * 
     * </td>
     * <td>
     * Set if the characters of the font are struck out by default; otherwise strikeouts must be simulated.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * FM_SEL_UNDERSCORE
     * 
     * </td>
     * <td>
     * Set if all the characters of the font are underscored by default; otherwise underscoring must be simulated.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    fsSelection {
        get => NumGet(this, 6, "ushort")
        set => NumPut("ushort", value, this, 6)
    }

    /**
     * Specifies the arithmetic average of the width of all of the 26 lower case letters 'a' through 'z' of the Latin alphabet and the space character. If any of the 26 lowercase letters are not present, then this member should be set equal to the weighted average of all glyphs in the font.
     * @type {Integer}
     */
    fwdAveCharWidth {
        get => NumGet(this, 8, "short")
        set => NumPut("short", value, this, 8)
    }

    /**
     * Specifies the maximum character increment of all glyphs in the font.
     * @type {Integer}
     */
    fwdMaxCharInc {
        get => NumGet(this, 10, "short")
        set => NumPut("short", value, this, 10)
    }

    /**
     * Specifies a <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-pointl">POINTL</a> structure that indicates the direction of the ascender direction of the font. For example, the value for a nonitalicized Latin font is (0,1) while an italicized Latin font might specify a value of (2,5).
     * @type {POINTL}
     */
    ptlCaret{
        get {
            if(!this.HasProp("__ptlCaret"))
                this.__ptlCaret := POINTL(this.ptr + 16)
            return this.__ptlCaret
        }
    }
}
