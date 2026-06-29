#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The WCRUN structure describes a run of Unicode characters.
 * @remarks
 * GDI relies on the runs being arranged in increasing order by code points. A binary search is made through the list of runs.
 * 
 * The <a href="https://docs.microsoft.com/windows/desktop/api/winddi/ns-winddi-fd_glyphset">FD_GLYPHSET</a> structure contains a WCRUN structure as one of its members.
 * @see https://learn.microsoft.com/windows/win32/api/winddi/ns-winddi-wcrun
 * @namespace Windows.Win32.Devices.Display
 */
export default struct WCRUN {
    #StructPack 8

    /**
     * Specifies the first character in the run.
     */
    wcLow : Int8

    /**
     * Specifies the count of characters in the run.
     */
    cGlyphs : UInt16

    /**
     * Pointer to an array of glyph handles that correspond to this run. If this member is <b>NULL</b>, then each character in this run can be converted to a glyph handle by a cast, as in the following example:
     * 
     * 
     * ```
     * HGLYPH hg = (HGLYPH) wc;
     * ```
     */
    phg : IntPtr

}
