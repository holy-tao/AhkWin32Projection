#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The TRIVERTEX structure contains color information and position information.
 * @remarks
 * In the <b>TRIVERTEX</b> structure, x and y indicate position in the same manner as in the <a href="https://docs.microsoft.com/windows/win32/api/windef/ns-windef-pointl">POINTL</a> structure contained in the wtypes.h header file. <b>Red</b>, <b>Green</b>, <b>Blue</b>, and <b>Alpha</b> members indicate color information at the point x, y. The color information of each channel is specified as a value from 0x0000 to 0xff00. This allows higher color resolution for an object that has been split into small triangles for display. The <b>TRIVERTEX</b> structure contains information needed by the <i>pVertex</i> parameter of <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-gradientfill">GradientFill</a>.
 * @see https://learn.microsoft.com/windows/win32/api/wingdi/ns-wingdi-trivertex
 * @namespace Windows.Win32.Graphics.Gdi
 */
export default struct TRIVERTEX {
    #StructPack 4

    /**
     * The x-coordinate, in logical units, of the upper-left corner of the rectangle.
     */
    x : Int32

    /**
     * The y-coordinate, in logical units, of the upper-left corner of the rectangle.
     */
    y : Int32

    /**
     * The color information at the point of x, y.
     */
    Red : UInt16

    /**
     * The color information at the point of x, y.
     */
    Green : UInt16

    /**
     * The color information at the point of x, y.
     */
    Blue : UInt16

    /**
     * The color information at the point of x, y.
     */
    Alpha : UInt16

}
