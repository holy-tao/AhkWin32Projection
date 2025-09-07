#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Describes the stroke that outlines a shape. (D2D1_STROKE_STYLE_PROPERTIES1)
 * @see https://learn.microsoft.com/windows/win32/api/d2d1_1/ns-d2d1_1-d2d1_stroke_style_properties1
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class D2D1_STROKE_STYLE_PROPERTIES1 extends Win32Struct
{
    static sizeof => 32

    static packingSize => 4

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1/ne-d2d1-d2d1_cap_style">D2D1_CAP_STYLE</a></b>
     * 
     * The cap to use at the start of each open figure.
     * @type {Integer}
     */
    startCap {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1/ne-d2d1-d2d1_cap_style">D2D1_CAP_STYLE</a></b>
     * 
     * The cap to use at the end of each open figure.
     * @type {Integer}
     */
    endCap {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1/ne-d2d1-d2d1_cap_style">D2D1_CAP_STYLE</a></b>
     * 
     * The cap to use at the start and end of each dash.
     * @type {Integer}
     */
    dashCap {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1/ne-d2d1-d2d1_line_join">D2D1_LINE_JOIN</a></b>
     * 
     * The line join to use.
     * @type {Integer}
     */
    lineJoin {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }

    /**
     * Type: <b>FLOAT</b>
     * 
     * The limit beyond which miters are either clamped or converted to bevels.
     * @type {Float}
     */
    miterLimit {
        get => NumGet(this, 16, "float")
        set => NumPut("float", value, this, 16)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1/ne-d2d1-d2d1_dash_style">D2D1_DASH_STYLE</a></b>
     * 
     * The type of dash to use.
     * @type {Integer}
     */
    dashStyle {
        get => NumGet(this, 20, "int")
        set => NumPut("int", value, this, 20)
    }

    /**
     * Type: <b>FLOAT</b>
     * 
     * The location of the first dash, relative to the start of the figure.
     * @type {Float}
     */
    dashOffset {
        get => NumGet(this, 24, "float")
        set => NumPut("float", value, this, 24)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1_1/ne-d2d1_1-d2d1_stroke_transform_type">D2D1_STROKE_TRANSFORM_TYPE</a></b>
     * 
     * The rule that determines what render target properties affect the nib of the stroke.
     * @type {Integer}
     */
    transformType {
        get => NumGet(this, 28, "int")
        set => NumPut("int", value, this, 28)
    }
}
