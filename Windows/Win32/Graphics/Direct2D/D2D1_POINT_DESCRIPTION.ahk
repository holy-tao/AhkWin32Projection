#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include Common\D2D_POINT_2F.ahk

/**
 * Describes a point on a path geometry.
 * @see https://learn.microsoft.com/windows/win32/api/d2d1_1/ns-d2d1_1-d2d1_point_description
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class D2D1_POINT_DESCRIPTION extends Win32Struct
{
    static sizeof => 28

    static packingSize => 4

    /**
     * The end point after walking the path.
     * @type {D2D_POINT_2F}
     */
    point{
        get {
            if(!this.HasProp("__point"))
                this.__point := D2D_POINT_2F(0, this)
            return this.__point
        }
    }

    /**
     * A unit vector indicating the tangent point.
     * @type {D2D_POINT_2F}
     */
    unitTangentVector{
        get {
            if(!this.HasProp("__unitTangentVector"))
                this.__unitTangentVector := D2D_POINT_2F(8, this)
            return this.__unitTangentVector
        }
    }

    /**
     * The index of the segment on which point resides. This index is global to the entire path, not just to a particular figure.
     * @type {Integer}
     */
    endSegment {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * The index of the figure on which point resides.
     * @type {Integer}
     */
    endFigure {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * The length of the section of the path stretching from the start of the path  to the start of <b>endSegment</b>.
     * @type {Float}
     */
    lengthToEndSegment {
        get => NumGet(this, 24, "float")
        set => NumPut("float", value, this, 24)
    }
}
