#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow
 */
class BDA_RATING_PINRESET extends Win32Struct {
    static sizeof => 2

    static packingSize => 1

    /**
     * @type {Integer}
     */
    bPinLength {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }

    /**
     * @type {Array<Integer>}
     */
    argbNewPin {
        get {
            if(!this.HasProp("__argbNewPinProxyArray"))
                this.__argbNewPinProxyArray := Win32FixedArray(this.ptr + 1, 1, Primitive, "char")
            return this.__argbNewPinProxyArray
        }
    }
}
