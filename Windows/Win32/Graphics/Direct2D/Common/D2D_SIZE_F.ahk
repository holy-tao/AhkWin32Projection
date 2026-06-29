#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Stores an ordered pair of floating-point values, typically the width and height of a rectangle.
 * @see https://learn.microsoft.com/windows/win32/api/dcommon/ns-dcommon-d2d_size_f
 * @namespace Windows.Win32.Graphics.Direct2D.Common
 */
export default struct D2D_SIZE_F {
    #StructPack 4

    /**
     * Type: <b>FLOAT</b>
     * 
     * The horizontal component of this size.
     */
    width : Float32

    /**
     * Type: <b>FLOAT</b>
     * 
     * The vertical component of this size.
     */
    height : Float32

}
