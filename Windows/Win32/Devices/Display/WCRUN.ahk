#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The WCRUN structure describes a run of Unicode characters.
 * @remarks
 * 
  * GDI relies on the runs being arranged in increasing order by code points. A binary search is made through the list of runs.
  * 
  * The <a href="https://docs.microsoft.com/windows/desktop/api/winddi/ns-winddi-fd_glyphset">FD_GLYPHSET</a> structure contains a WCRUN structure as one of its members.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//winddi/ns-winddi-wcrun
 * @namespace Windows.Win32.Devices.Display
 * @version v4.0.30319
 */
class WCRUN extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Specifies the first character in the run.
     * @type {Integer}
     */
    wcLow {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }

    /**
     * Specifies the count of characters in the run.
     * @type {Integer}
     */
    cGlyphs {
        get => NumGet(this, 2, "ushort")
        set => NumPut("ushort", value, this, 2)
    }

    /**
     * Pointer to an array of glyph handles that correspond to this run. If this member is <b>NULL</b>, then each character in this run can be converted to a glyph handle by a cast, as in the following example:
     * 
     * 
     * ```
     * HGLYPH hg = (HGLYPH) wc;
     * ```
     * @type {Pointer<UInt32>}
     */
    phg {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
