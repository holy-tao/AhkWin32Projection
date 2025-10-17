#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include Common\D2D_RECT_F.ahk

/**
 * Describes features of an effect.
 * @remarks
 * 
  * > [!NOTE]
  * > You shouldn't rely heavily on the input rectangles returned by this structure. They can change due to subtle changes in effect implementations, and due to optimization changes in the effect rendering system.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//d2d1_1/ns-d2d1_1-d2d1_effect_input_description
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class D2D1_EFFECT_INPUT_DESCRIPTION extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * The effect whose input connection is being specified.
     * @type {Pointer<ID2D1Effect>}
     */
    effect {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * The input index of the effect that is being considered.
     * @type {Integer}
     */
    inputIndex {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * The amount of data that would be available on the input. This can be used to query this information when the data is not yet available.
     * @type {D2D_RECT_F}
     */
    inputRectangle{
        get {
            if(!this.HasProp("__inputRectangle"))
                this.__inputRectangle := D2D_RECT_F(16, this)
            return this.__inputRectangle
        }
    }
}
