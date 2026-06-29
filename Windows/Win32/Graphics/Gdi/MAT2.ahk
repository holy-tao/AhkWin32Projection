#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\FIXED.ahk" { FIXED }

/**
 * The MAT2 structure contains the values for a transformation matrix used by the GetGlyphOutline function.
 * @remarks
 * The identity matrix produces a transformation in which the transformed graphical object is identical to the source object. In the identity matrix, the value of <b>eM11</b> is 1, the value of <b>eM12</b> is zero, the value of <b>eM21</b> is zero, and the value of <b>eM22</b> is 1.
 * @see https://learn.microsoft.com/windows/win32/api/wingdi/ns-wingdi-mat2
 * @namespace Windows.Win32.Graphics.Gdi
 */
export default struct MAT2 {
    #StructPack 2

    /**
     * A fixed-point value for the M11 component of a 3 by 3 transformation matrix.
     */
    eM11 : FIXED

    /**
     * A fixed-point value for the M12 component of a 3 by 3 transformation matrix.
     */
    eM12 : FIXED

    /**
     * A fixed-point value for the M21 component of a 3 by 3 transformation matrix.
     */
    eM21 : FIXED

    /**
     * A fixed-point value for the M22 component of a 3 by 3 transformation matrix.
     */
    eM22 : FIXED

}
