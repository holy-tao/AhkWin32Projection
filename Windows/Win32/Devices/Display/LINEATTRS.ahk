#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\FLOAT_LONG.ahk

/**
 * The LINEATTRS structure is used by a driver's line-drawing functions to determine line attributes.
 * @see https://learn.microsoft.com/windows/win32/api/winddi/ns-winddi-lineattrs
 * @namespace Windows.Win32.Devices.Display
 * @version v4.0.30319
 */
class LINEATTRS extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * 
     * @type {Integer}
     */
    fl {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * 
     * @type {Integer}
     */
    iJoin {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * 
     * @type {Integer}
     */
    iEndCap {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Specifies a FLOAT_LONG that indicates the width of the line. This width is measured in FLOAT world coordinates for a geometric wide line, but in LONG device coordinates for a cosmetic wide line. For a description of the FLOAT_LONG data type, see <a href="https://docs.microsoft.com/windows-hardware/drivers/display/gdi-data-types">GDI Data Types</a>.
     * @type {FLOAT_LONG}
     */
    elWidth{
        get {
            if(!this.HasProp("__elWidth"))
                this.__elWidth := FLOAT_LONG(this.ptr + 16)
            return this.__elWidth
        }
    }

    /**
     * Specifies a FLOATL that sets the limit as a multiple of the line width that a miter join is allowed to extend from its inside corner to its outer vertex. This prevents very long spikes from occurring when lines of a path meet at very small angles. If the miter limit is exceeded, a bevel join should be used instead. For a description of the FLOATL data type, see <a href="https://docs.microsoft.com/windows-hardware/drivers/display/gdi-data-types">GDI Data Types</a>.
     * 
     * This member is used only by geometric wide lines.
     * @type {Integer}
     */
    eMiterLimit {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * Specifies the number of entries in the style array pointed to by the <b>pstyle</b> member.
     * @type {Integer}
     */
    cstyle {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * Pointer to an array of FLOAT_LONG elements: the style array. If this member is <b>NULL</b>, the line style is solid. For a description of the FLOAT_LONG data type, see <a href="https://docs.microsoft.com/windows-hardware/drivers/display/gdi-data-types">GDI Data Types</a>.
     * @type {Pointer<FLOAT_LONG>}
     */
    pstyle {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * Specifies a FLOAT_LONG that contains a pair of 16-bit values supplied by GDI whenever the driver calls <a href="https://docs.microsoft.com/windows/desktop/api/winddi/nf-winddi-pathobj_benumcliplines">PATHOBJ_bEnumClipLines</a>. These two values, packed into a FLOAT_LONG, specify where in the styling array (at which pixel) to start the first subpath. This value must be updated as part of the output routine if the line is not solid. This member applies to cosmetic lines only
     * 
     * . See also <a href="https://docs.microsoft.com/windows-hardware/drivers/display/styled-cosmetic-lines">Styled Cosmetic Lines</a> for additional information.
     * @type {FLOAT_LONG}
     */
    elStyleState{
        get {
            if(!this.HasProp("__elStyleState"))
                this.__elStyleState := FLOAT_LONG(this.ptr + 40)
            return this.__elStyleState
        }
    }
}
