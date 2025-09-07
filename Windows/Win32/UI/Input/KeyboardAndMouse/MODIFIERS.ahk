#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.UI.Input.KeyboardAndMouse
 * @version v4.0.30319
 */
class MODIFIERS extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {Pointer<VK_TO_BIT>}
     */
    pVkToBit {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    wMaxModBits {
        get => NumGet(this, 8, "ushort")
        set => NumPut("ushort", value, this, 8)
    }

    /**
     * @type {Array<Byte>}
     */
    ModNumber{
        get {
            if(!this.HasProp("__ModNumberProxyArray"))
                this.__ModNumberProxyArray := Win32FixedArray(this.ptr + 10, 1, Primitive, "char")
            return this.__ModNumberProxyArray
        }
    }
}
