#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Represents a point, radius pair that makes up part of a D2D1_INK_BEZIER_SEGMENT.
 * @see https://learn.microsoft.com/windows/win32/api/d2d1_3/ns-d2d1_3-d2d1_ink_point
 * @namespace Windows.Win32.Graphics.Direct2D
 */
export default struct D2D1_INK_POINT {
    #StructPack 4

    /**
     * The x-coordinate of the point.
     */
    x : Float32

    /**
     * The y-coordinate of the point.
     */
    y : Float32

    /**
     * The radius of this point. Corresponds to the width of the ink stroke at this point in the stroke.
     */
    radius : Float32

}
