#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Describes the stroke that outlines a shape.
 * @remarks
 * 
  * The following illustration shows different <i>dashOffset</i> values for the same custom dash style.
  * 
  * <img alt="Illustration of four dashes with the same style and different dashOffset values" src="./images/StrokeStyle_DashOffset.png"/>
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//d2d1/ns-d2d1-d2d1_stroke_style_properties
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class D2D1_STROKE_STYLE_PROPERTIES extends Win32Struct
{
    static sizeof => 28

    static packingSize => 4

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/win32/api/d2d1/ne-d2d1-d2d1_cap_style">D2D1_CAP_STYLE</a></b>
     * 
     * The cap applied to the start of all the open figures in a stroked geometry.
     * @type {Integer}
     */
    startCap {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/win32/api/d2d1/ne-d2d1-d2d1_cap_style">D2D1_CAP_STYLE</a></b>
     * 
     * The cap applied to the end of all the open figures in a stroked geometry.
     * @type {Integer}
     */
    endCap {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/win32/api/d2d1/ne-d2d1-d2d1_cap_style">D2D1_CAP_STYLE</a></b>
     * 
     * The shape  at either end of each dash segment.
     * @type {Integer}
     */
    dashCap {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/win32/api/d2d1/ne-d2d1-d2d1_line_join">D2D1_LINE_JOIN</a></b>
     * 
     * A value that describes how segments are joined. This value is ignored for a vertex if the segment flags specify that the segment should have a smooth join.
     * @type {Integer}
     */
    lineJoin {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }

    /**
     * Type: <b>FLOAT</b>
     * 
     * The limit of the thickness of the join on a mitered corner. This value is always treated as though it is greater than or equal to 1.0f.
     * @type {Float}
     */
    miterLimit {
        get => NumGet(this, 16, "float")
        set => NumPut("float", value, this, 16)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/win32/api/d2d1/ne-d2d1-d2d1_dash_style">D2D1_DASH_STYLE</a></b>
     * 
     * A value that specifies whether the stroke has a dash pattern and, if so, the dash style.
     * @type {Integer}
     */
    dashStyle {
        get => NumGet(this, 20, "int")
        set => NumPut("int", value, this, 20)
    }

    /**
     * Type: <b>FLOAT</b>
     * 
     * A value that specifies an offset in the dash sequence.   A positive dash offset value  shifts the dash pattern, in units of  stroke width, toward the start of the stroked geometry.  A negative dash offset value  shifts the dash pattern, in units of  stroke width, toward the end of the stroked geometry.
     * @type {Float}
     */
    dashOffset {
        get => NumGet(this, 24, "float")
        set => NumPut("float", value, this, 24)
    }
}
