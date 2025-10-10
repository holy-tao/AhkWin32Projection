#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include Common\D2D_MATRIX_3X2_F.ahk

/**
 * Describes the drawing state of a device context.
 * @see https://docs.microsoft.com/windows/win32/api//d2d1_1/ns-d2d1_1-d2d1_drawing_state_description1
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class D2D1_DRAWING_STATE_DESCRIPTION1 extends Win32Struct
{
    static sizeof => 56

    static packingSize => 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1/ne-d2d1-d2d1_antialias_mode">D2D1_ANTIALIAS_MODE</a></b>
     * 
     * The antialiasing mode for subsequent nontext drawing operations.
     * @type {Integer}
     */
    antialiasMode {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1/ne-d2d1-d2d1_text_antialias_mode">D2D1_TEXT_ANTIALIAS_MODE</a></b>
     * 
     * The antialiasing mode for subsequent text and glyph drawing operations.
     * @type {Integer}
     */
    textAntialiasMode {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/Direct2D/d2d1-tag">D2D1_TAG</a></b>
     * 
     * A label for subsequent drawing operations.
     * @type {Integer}
     */
    tag1 {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/Direct2D/d2d1-tag">D2D1_TAG</a></b>
     * 
     * A label for subsequent drawing operations.
     * @type {Integer}
     */
    tag2 {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/Direct2D/d2d1-matrix-3x2-f">D2D1_MATRIX_3X2_F</a></b>
     * 
     * The transformation to apply to subsequent drawing operations.
     * @type {D2D_MATRIX_3X2_F}
     */
    transform{
        get {
            if(!this.HasProp("__transform"))
                this.__transform := D2D_MATRIX_3X2_F(this.ptr + 24)
            return this.__transform
        }
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1_1/ne-d2d1_1-d2d1_primitive_blend">D2D1_PRIMITIVE_BLEND</a></b>
     * 
     * The blend mode for the device context to apply to subsequent drawing operations.
     * @type {Integer}
     */
    primitiveBlend {
        get => NumGet(this, 48, "int")
        set => NumPut("int", value, this, 48)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1_1/ne-d2d1_1-d2d1_unit_mode">D2D1_UNIT_MODE</a></b>
     * 
     * D2D1_UNIT_MODE
     * @type {Integer}
     */
    unitMode {
        get => NumGet(this, 52, "int")
        set => NumPut("int", value, this, 52)
    }
}
