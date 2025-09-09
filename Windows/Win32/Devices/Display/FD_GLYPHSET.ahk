#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\WCRUN.ahk

/**
 * The FD_GLYPHSET structure is used to define the mappings from Unicode characters to glyph handles.
 * @see https://learn.microsoft.com/windows/win32/api/winddi/ns-winddi-fd_glyphset
 * @namespace Windows.Win32.Devices.Display
 * @version v4.0.30319
 */
class FD_GLYPHSET extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * Specifies the size, in bytes, of the structure, including the array of <a href="https://docs.microsoft.com/windows/desktop/api/winddi/ns-winddi-wcrun">WCRUN</a> structures.
     * @type {Integer}
     */
    cjThis {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Specifies accelerator flags. This member must be the following value:
     * 
     * <table>
     * <tr>
     * <th>Flags</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td>
     * GS_8BIT_HANDLES
     * 
     * </td>
     * <td>
     * All handles are 8-bit quantities.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * GS_16BIT_HANDLES
     * 
     * </td>
     * <td>
     * All handles are 16-bit quantities. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * GS_UNICODE_HANDLES
     * 
     * </td>
     * <td>
     * For all runs in this structure, the handle is obtained by zero extending the Unicode code point.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    flAccel {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Specifies the total number of glyphs in all runs.
     * @type {Integer}
     */
    cGlyphsSupported {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Specifies the number of <a href="https://docs.microsoft.com/windows/desktop/api/winddi/ns-winddi-wcrun">WCRUN</a> structures in the <b>awcrun</b> array.
     * @type {Integer}
     */
    cRuns {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * Is an array of <a href="https://docs.microsoft.com/windows/desktop/api/winddi/ns-winddi-wcrun">WCRUN</a> structures.
     * @type {Array<WCRUN>}
     */
    awcrun{
        get {
            if(!this.HasProp("__awcrunProxyArray"))
                this.__awcrunProxyArray := Win32FixedArray(this.ptr + 16, 1, WCRUN, "")
            return this.__awcrunProxyArray
        }
    }
}
