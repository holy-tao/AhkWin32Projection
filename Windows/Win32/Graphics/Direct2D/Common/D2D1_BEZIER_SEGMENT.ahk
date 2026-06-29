#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D2D_POINT_2F.ahk" { D2D_POINT_2F }

/**
 * Represents a cubic bezier segment drawn between two points.
 * @remarks
 * A cubic Bezier curve is defined by four points: a start point, an end point (<i>point3</i>), and two control points (<i>point1</i> and <i>point2</i>). A Bezier segment does not contain a property for the starting point of the curve; it defines only the end point. The beginning point of the curve is the current point of the path to which the Bezier curve is added.
 * 
 * The two control points of a cubic Bezier curve behave like magnets, attracting portions of what would otherwise be a straight line toward themselves and producing a curve. The first control point, <i>point1</i>, affects the beginning portion of the curve; the second control point, <i>point2</i>, affects the ending portion of the curve. 
 * 
 * <div class="alert"><b>Note</b>  The curve doesn't necessarily pass through either of the control points; each control point moves its portion of the line toward itself, but not through itself.</div>
 * <div> </div>
 * @see https://learn.microsoft.com/windows/win32/api/d2d1/ns-d2d1-d2d1_bezier_segment
 * @namespace Windows.Win32.Graphics.Direct2D.Common
 */
export default struct D2D1_BEZIER_SEGMENT {
    #StructPack 4

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/win32/Direct2D/d2d1-point-2f">D2D1_POINT_2F</a></b>
     * 
     * The first control point for the Bezier segment.
     */
    point1 : D2D_POINT_2F

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/win32/Direct2D/d2d1-point-2f">D2D1_POINT_2F</a></b>
     * 
     * The second control point for the Bezier segment.
     */
    point2 : D2D_POINT_2F

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/win32/Direct2D/d2d1-point-2f">D2D1_POINT_2F</a></b>
     * 
     * The end point for the Bezier segment.
     */
    point3 : D2D_POINT_2F

}
