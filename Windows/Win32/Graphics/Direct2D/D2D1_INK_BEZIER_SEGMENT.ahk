#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D2D1_INK_POINT.ahk" { D2D1_INK_POINT }

/**
 * Represents a Bezier segment to be used in the creation of an ID2D1Ink object. This structure differs from D2D1_BEZIER_SEGMENT in that it is composed of D2D1_INK_POINTs, which contain a radius in addition to x- and y-coordinates.
 * @see https://learn.microsoft.com/windows/win32/api/d2d1_3/ns-d2d1_3-d2d1_ink_bezier_segment
 * @namespace Windows.Win32.Graphics.Direct2D
 */
export default struct D2D1_INK_BEZIER_SEGMENT {
    #StructPack 4

    /**
     * The first control point for the Bezier segment.
     */
    point1 : D2D1_INK_POINT

    /**
     * The second control point for the Bezier segment.
     */
    point2 : D2D1_INK_POINT

    /**
     * The end point for the Bezier segment.
     */
    point3 : D2D1_INK_POINT

}
