#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include .\D2D1_COLOR_F.ahk

/**
 * Contains the position and color of a gradient stop.
 * @remarks
 * Gradient stops can be specified in any order if they are at different positions. Two stops may share a position. In this case, the first stop specified is treated as the "low" stop (nearer 0.0f) and subsequent stops are treated as "higher" (nearer 1.0f). This behavior is useful if a caller wants an instant transition in the middle of a stop.
 * 
 * Typically, there are at least two points in a collection, although creation with only one stop is permitted. For example, one point is at position 0.0f, another point is at position 1.0f, and additional points are distributed in the [0, 1] range. Where the gradient progression is beyond the range of [0, 1], the stops are stored, but may affect the gradient. 
 * 
 * When drawn, the [0, 1] range of positions is mapped to the brush, in a brush-dependent way. For details, see <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nn-d2d1-id2d1lineargradientbrush">ID2D1LinearGradientBrush</a> and <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nn-d2d1-id2d1radialgradientbrush">ID2D1RadialGradientBrush</a>. 
 * 
 * Gradient stops with a position outside the [0, 1] range cannot be seen explicitly, but they can still affect the colors produced in the [0, 1] range. For example, a two-stop gradient {{0.0f, Black}, {2.0f, White}} is indistinguishable visually from {{0.0f, Black}, {1.0f, Mid-level gray}}. Also, the colors are clamped before interpolation.
 * @see https://learn.microsoft.com/windows/win32/api/d2d1/ns-d2d1-d2d1_gradient_stop
 * @namespace Windows.Win32.Graphics.Direct2D.Common
 * @version v4.0.30319
 */
class D2D1_GRADIENT_STOP extends Win32Struct
{
    static sizeof => 20

    static packingSize => 4

    /**
     * Type: <b>FLOAT</b>
     * 
     * A value that indicates the relative position of the gradient stop in the brush. This value must be in the [0.0f, 1.0f] range if the gradient stop is to be seen explicitly.
     * @type {Float}
     */
    position {
        get => NumGet(this, 0, "float")
        set => NumPut("float", value, this, 0)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/win32/Direct2D/d2d1-color-f">D2D1_COLOR_F</a></b>
     * 
     * The color of the gradient stop.
     * @type {D2D1_COLOR_F}
     */
    color{
        get {
            if(!this.HasProp("__color"))
                this.__color := D2D1_COLOR_F(4, this)
            return this.__color
        }
    }
}
