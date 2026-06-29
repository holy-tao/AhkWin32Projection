#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\FLOAT_LONG.ahk" { FLOAT_LONG }

/**
 * The LINEATTRS structure is used by a driver's line-drawing functions to determine line attributes.
 * @see https://learn.microsoft.com/windows/win32/api/winddi/ns-winddi-lineattrs
 * @namespace Windows.Win32.Devices.Display
 * @architecture X64, Arm64
 */
export default struct LINEATTRS {
    #StructPack 8

    fl : UInt32

    iJoin : UInt32

    iEndCap : UInt32

    /**
     * Specifies a FLOAT_LONG that indicates the width of the line. This width is measured in FLOAT world coordinates for a geometric wide line, but in LONG device coordinates for a cosmetic wide line. For a description of the FLOAT_LONG data type, see <a href="https://docs.microsoft.com/windows-hardware/drivers/display/gdi-data-types">GDI Data Types</a>.
     */
    elWidth : FLOAT_LONG

    /**
     * Specifies a FLOATL that sets the limit as a multiple of the line width that a miter join is allowed to extend from its inside corner to its outer vertex. This prevents very long spikes from occurring when lines of a path meet at very small angles. If the miter limit is exceeded, a bevel join should be used instead. For a description of the FLOATL data type, see <a href="https://docs.microsoft.com/windows-hardware/drivers/display/gdi-data-types">GDI Data Types</a>.
     * 
     * This member is used only by geometric wide lines.
     */
    eMiterLimit : Float32

    /**
     * Specifies the number of entries in the style array pointed to by the <b>pstyle</b> member.
     */
    cstyle : UInt32

    /**
     * Pointer to an array of FLOAT_LONG elements: the style array. If this member is <b>NULL</b>, the line style is solid. For a description of the FLOAT_LONG data type, see <a href="https://docs.microsoft.com/windows-hardware/drivers/display/gdi-data-types">GDI Data Types</a>.
     */
    pstyle : FLOAT_LONG.Ptr

    /**
     * Specifies a FLOAT_LONG that contains a pair of 16-bit values supplied by GDI whenever the driver calls <a href="https://docs.microsoft.com/windows/desktop/api/winddi/nf-winddi-pathobj_benumcliplines">PATHOBJ_bEnumClipLines</a>. These two values, packed into a FLOAT_LONG, specify where in the styling array (at which pixel) to start the first subpath. This value must be updated as part of the output routine if the line is not solid. This member applies to cosmetic lines only
     * 
     * . See also <a href="https://docs.microsoft.com/windows-hardware/drivers/display/styled-cosmetic-lines">Styled Cosmetic Lines</a> for additional information.
     */
    elStyleState : FLOAT_LONG

}
