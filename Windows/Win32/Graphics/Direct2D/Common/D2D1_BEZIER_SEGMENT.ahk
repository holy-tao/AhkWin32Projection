#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include .\D2D_POINT_2F.ahk

/**
 * Represents a cubic bezier segment drawn between two points.
 * @remarks
 * 
 * A cubic Bezier curve is defined by four points: a start point, an end point (<i>point3</i>), and two control points (<i>point1</i> and <i>point2</i>). A Bezier segment does not contain a property for the starting point of the curve; it defines only the end point. The beginning point of the curve is the current point of the path to which the Bezier curve is added.
 * 
 * The two control points of a cubic Bezier curve behave like magnets, attracting portions of what would otherwise be a straight line toward themselves and producing a curve. The first control point, <i>point1</i>, affects the beginning portion of the curve; the second control point, <i>point2</i>, affects the ending portion of the curve. 
 * 
 * <div class="alert"><b>Note</b>  The curve doesn't necessarily pass through either of the control points; each control point moves its portion of the line toward itself, but not through itself.</div>
 * <div> </div>
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//d2d1/ns-d2d1-d2d1_bezier_segment
 * @namespace Windows.Win32.Graphics.Direct2D.Common
 * @version v4.0.30319
 */
class D2D1_BEZIER_SEGMENT extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/win32/Direct2D/d2d1-point-2f">D2D1_POINT_2F</a></b>
     * 
     * The first control point for the Bezier segment.
     * @type {D2D_POINT_2F}
     */
    point1{
        get {
            if(!this.HasProp("__point1"))
                this.__point1 := D2D_POINT_2F(0, this)
            return this.__point1
        }
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/win32/Direct2D/d2d1-point-2f">D2D1_POINT_2F</a></b>
     * 
     * The second control point for the Bezier segment.
     * @type {D2D_POINT_2F}
     */
    point2{
        get {
            if(!this.HasProp("__point2"))
                this.__point2 := D2D_POINT_2F(8, this)
            return this.__point2
        }
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/win32/Direct2D/d2d1-point-2f">D2D1_POINT_2F</a></b>
     * 
     * The end point for the Bezier segment.
     * @type {D2D_POINT_2F}
     */
    point3{
        get {
            if(!this.HasProp("__point3"))
                this.__point3 := D2D_POINT_2F(16, this)
            return this.__point3
        }
    }
}
