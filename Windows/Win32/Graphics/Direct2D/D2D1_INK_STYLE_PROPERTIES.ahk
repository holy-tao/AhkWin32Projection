#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include Common\D2D_MATRIX_3X2_F.ahk

/**
 * Defines the general pen tip shape and the transform used in an ID2D1InkStyle object.
 * @see https://docs.microsoft.com/windows/win32/api//d2d1_3/ns-d2d1_3-d2d1_ink_style_properties
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class D2D1_INK_STYLE_PROPERTIES extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * The pre-transform shape of the nib (pen tip) used to draw a given ink object.
     * @type {Integer}
     */
    nibShape {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * The transform applied to the nib.  Note that the translation components of the transform matrix are ignored for the purposes of rendering.
     * @type {D2D_MATRIX_3X2_F}
     */
    nibTransform{
        get {
            if(!this.HasProp("__nibTransform"))
                this.__nibTransform := D2D_MATRIX_3X2_F(this.ptr + 8)
            return this.__nibTransform
        }
    }
}
