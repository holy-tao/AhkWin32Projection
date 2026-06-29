#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Represents a rectangle defined by the coordinates of the upper-left corner (left, top) and the coordinates of the lower-right corner (right, bottom).
 * @see https://learn.microsoft.com/windows/win32/api/dcommon/ns-dcommon-d2d_rect_f
 * @namespace Windows.Win32.Graphics.Direct2D.Common
 */
export default struct D2D_RECT_F {
    #StructPack 4

    /**
     * Type: <b>FLOAT</b>
     * 
     * The x-coordinate of the upper-left corner of the rectangle.
     */
    left : Float32

    /**
     * Type: <b>FLOAT</b>
     * 
     * The y-coordinate of the upper-left corner of the rectangle.
     */
    top : Float32

    /**
     * Type: <b>FLOAT</b>
     * 
     * The x-coordinate of the lower-right corner of the rectangle.
     */
    right : Float32

    /**
     * Type: <b>FLOAT</b>
     * 
     * The y-coordinate of the lower-right corner of the rectangle.
     */
    bottom : Float32

}
