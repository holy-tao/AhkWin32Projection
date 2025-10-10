#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include Common\D2D_POINT_2F.ahk

/**
 * Contains the center point, x-radius, and y-radius of an ellipse.
 * @see https://docs.microsoft.com/windows/win32/api//d2d1/ns-d2d1-d2d1_ellipse
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class D2D1_ELLIPSE extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/win32/Direct2D/d2d1-point-2f">D2D1_POINT_2F</a></b>
     * 
     * The center point of the ellipse.
     * @type {D2D_POINT_2F}
     */
    point{
        get {
            if(!this.HasProp("__point"))
                this.__point := D2D_POINT_2F(this.ptr + 0)
            return this.__point
        }
    }

    /**
     * Type: <b>FLOAT</b>
     * 
     * The X-radius of the ellipse.
     * @type {Float}
     */
    radiusX {
        get => NumGet(this, 8, "float")
        set => NumPut("float", value, this, 8)
    }

    /**
     * Type: <b>FLOAT</b>
     * 
     * The Y-radius of the ellipse.
     * @type {Float}
     */
    radiusY {
        get => NumGet(this, 12, "float")
        set => NumPut("float", value, this, 12)
    }
}
