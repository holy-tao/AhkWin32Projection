#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\RUN.ahk" { RUN }
#Import ".\POINTFIX.ahk" { POINTFIX }

/**
 * The CLIPLINE structure gives the driver access to a portion of a line between two clip regions used for drawing.
 * @remarks
 * The CLIPLINE structure is used by <a href="https://docs.microsoft.com/windows/desktop/api/winddi/nf-winddi-pathobj_benumcliplines">PATHOBJ_bEnumClipLines</a>. The CLIPLINE structure contains the original, unclipped control points of the line segment.
 * 
 * See <a href="https://docs.microsoft.com/windows-hardware/drivers/display/gdi-data-types">GDI Data Types</a> for a description of the POINTFIX structure.
 * @see https://learn.microsoft.com/windows/win32/api/winddi/ns-winddi-clipline
 * @namespace Windows.Win32.Devices.Display
 */
export default struct CLIPLINE {
    #StructPack 4

    /**
     * Specifies a POINTFIX structure that contains the starting point of the line.
     */
    ptfxA : POINTFIX

    /**
     * Specifies a POINTFIX structure that contains the end point of the line.
     */
    ptfxB : POINTFIX

    /**
     * Is a pair of 16-bit values supplied by GDI whenever the driver calls <a href="https://docs.microsoft.com/windows/desktop/api/winddi/nf-winddi-pathobj_benumcliplines">PATHOBJ_bEnumClipLines</a>. These two values are packed into a LONG and specify the style offset back to the first pixel of the line segment. This is the first pixel that would be rendered if the line were not clipped. This value allows the styling for the remainder of the line to be computed. Refer to <a href="https://docs.microsoft.com/windows-hardware/drivers/display/styled-cosmetic-lines">Styled Cosmetic Lines</a> for additional information.
     */
    lStyleState : Int32

    /**
     * Specifies the number of RUN structures in the <b>arun</b> array.
     */
    c : UInt32

    /**
     * Is an array of <a href="https://docs.microsoft.com/windows/desktop/api/winddi/ns-winddi-run">RUN</a> structures. The RUN structures describe the start and stop portions of the clip line.
     */
    arun : RUN[1]

}
