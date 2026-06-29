#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * A vector of 3 FLOAT values (x, y, z).
 * @see https://learn.microsoft.com/windows/win32/api/dcommon/ns-dcommon-d2d_vector_3f
 * @namespace Windows.Win32.Graphics.Direct2D.Common
 */
export default struct D2D_VECTOR_3F {
    #StructPack 4

    /**
     * The x value of the vector.
     */
    x : Float32

    /**
     * The y value of the vector.
     */
    y : Float32

    /**
     * The z value of the vector.
     */
    z : Float32

}
