#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WCRUN.ahk" { WCRUN }

/**
 * The FD_GLYPHSET structure is used to define the mappings from Unicode characters to glyph handles.
 * @see https://learn.microsoft.com/windows/win32/api/winddi/ns-winddi-fd_glyphset
 * @namespace Windows.Win32.Devices.Display
 */
export default struct FD_GLYPHSET {
    #StructPack 8

    /**
     * Specifies the size, in bytes, of the structure, including the array of <a href="https://docs.microsoft.com/windows/desktop/api/winddi/ns-winddi-wcrun">WCRUN</a> structures.
     */
    cjThis : UInt32

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
     */
    flAccel : UInt32

    /**
     * Specifies the total number of glyphs in all runs.
     */
    cGlyphsSupported : UInt32

    /**
     * Specifies the number of <a href="https://docs.microsoft.com/windows/desktop/api/winddi/ns-winddi-wcrun">WCRUN</a> structures in the <b>awcrun</b> array.
     */
    cRuns : UInt32

    /**
     * Is an array of <a href="https://docs.microsoft.com/windows/desktop/api/winddi/ns-winddi-wcrun">WCRUN</a> structures.
     */
    awcrun : WCRUN[1]

}
