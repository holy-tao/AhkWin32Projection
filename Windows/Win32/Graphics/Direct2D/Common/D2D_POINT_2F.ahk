#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Represents an x-coordinate and y-coordinate pair, expressed as floating-point values, in two-dimensional space.
 * @see https://learn.microsoft.com/windows/win32/api/dcommon/ns-dcommon-d2d_point_2f
 * @namespace Windows.Win32.Graphics.Direct2D.Common
 */
export default struct D2D_POINT_2F {
    #StructPack 4

    /**
     * Type: <b>FLOAT</b>
     * 
     * The x-coordinate of the point.
     */
    x : Float32

    /**
     * Type: <b>FLOAT</b>
     * 
     * The y-coordinate of the point.
     */
    y : Float32

}
