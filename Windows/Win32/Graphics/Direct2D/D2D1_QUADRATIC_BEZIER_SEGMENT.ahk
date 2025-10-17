#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include Common\D2D_POINT_2F.ahk

/**
 * Contains the control point and end point for a quadratic Bezier segment.
 * @see https://docs.microsoft.com/windows/win32/api//d2d1/ns-d2d1-d2d1_quadratic_bezier_segment
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class D2D1_QUADRATIC_BEZIER_SEGMENT extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/win32/Direct2D/d2d1-point-2f">D2D1_POINT_2F</a></b>
     * 
     * The control point of the quadratic Bezier segment.
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
     * The end point of the quadratic Bezier segment.
     * @type {D2D_POINT_2F}
     */
    point2{
        get {
            if(!this.HasProp("__point2"))
                this.__point2 := D2D_POINT_2F(8, this)
            return this.__point2
        }
    }
}
