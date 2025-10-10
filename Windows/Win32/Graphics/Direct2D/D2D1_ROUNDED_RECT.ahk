#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include Common\D2D_RECT_F.ahk

/**
 * Contains the dimensions and corner radii of a rounded rectangle.
 * @remarks
 * 
  * Each corner of the rectangle specified by the <i>rect</i> is replaced with a quarter ellipse, with a radius in each direction specified by <i>radiusX</i> and <i>radiusY</i>.
  * 
  *  If the <i>radiusX</i> is greater than or equal to half the width of the rectangle, and the <i>radiusY</i> is greater than or equal to one-half the height, the rounded rectangle is an ellipse with the same width and height of the <i>rect</i>. 
  * 
  * Even when both <i>radiuX</i> and <i>radiusY</i> are zero, the rounded rectangle is different from a rectangle., When stroked, the corners of the rounded rectangle are roundly joined, not mitered (square).
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//d2d1/ns-d2d1-d2d1_rounded_rect
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class D2D1_ROUNDED_RECT extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/win32/Direct2D/d2d1-rect-f">D2D1_RECT_F</a></b>
     * 
     * The coordinates of the rectangle.
     * @type {D2D_RECT_F}
     */
    rect{
        get {
            if(!this.HasProp("__rect"))
                this.__rect := D2D_RECT_F(this.ptr + 0)
            return this.__rect
        }
    }

    /**
     * Type: <b>FLOAT</b>
     * 
     * The x-radius for the quarter ellipse that is drawn to replace every corner of the rectangle.
     * @type {Float}
     */
    radiusX {
        get => NumGet(this, 16, "float")
        set => NumPut("float", value, this, 16)
    }

    /**
     * Type: <b>FLOAT</b>
     * 
     * The y-radius for the quarter ellipse that is drawn to replace every corner of the rectangle.
     * @type {Float}
     */
    radiusY {
        get => NumGet(this, 20, "float")
        set => NumPut("float", value, this, 20)
    }
}
