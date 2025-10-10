#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\D2D1_INK_POINT.ahk

/**
 * Represents a Bezier segment to be used in the creation of an ID2D1Ink object. This structure differs from D2D1_BEZIER_SEGMENT in that it is composed of D2D1_INK_POINTs, which contain a radius in addition to x- and y-coordinates.
 * @see https://docs.microsoft.com/windows/win32/api//d2d1_3/ns-d2d1_3-d2d1_ink_bezier_segment
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class D2D1_INK_BEZIER_SEGMENT extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * The first control point for the Bezier segment.
     * @type {D2D1_INK_POINT}
     */
    point1{
        get {
            if(!this.HasProp("__point1"))
                this.__point1 := D2D1_INK_POINT(this.ptr + 0)
            return this.__point1
        }
    }

    /**
     * The second control point for the Bezier segment.
     * @type {D2D1_INK_POINT}
     */
    point2{
        get {
            if(!this.HasProp("__point2"))
                this.__point2 := D2D1_INK_POINT(this.ptr + 16)
            return this.__point2
        }
    }

    /**
     * The end point for the Bezier segment.
     * @type {D2D1_INK_POINT}
     */
    point3{
        get {
            if(!this.HasProp("__point3"))
                this.__point3 := D2D1_INK_POINT(this.ptr + 32)
            return this.__point3
        }
    }
}
