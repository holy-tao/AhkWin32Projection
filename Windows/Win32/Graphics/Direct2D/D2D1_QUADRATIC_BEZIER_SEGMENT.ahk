#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "Common\D2D_POINT_2F.ahk" { D2D_POINT_2F }

/**
 * Contains the control point and end point for a quadratic Bezier segment.
 * @see https://learn.microsoft.com/windows/win32/api/d2d1/ns-d2d1-d2d1_quadratic_bezier_segment
 * @namespace Windows.Win32.Graphics.Direct2D
 */
export default struct D2D1_QUADRATIC_BEZIER_SEGMENT {
    #StructPack 4

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/win32/Direct2D/d2d1-point-2f">D2D1_POINT_2F</a></b>
     * 
     * The control point of the quadratic Bezier segment.
     */
    point1 : D2D_POINT_2F

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/win32/Direct2D/d2d1-point-2f">D2D1_POINT_2F</a></b>
     * 
     * The end point of the quadratic Bezier segment.
     */
    point2 : D2D_POINT_2F

}
