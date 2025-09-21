#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\SPPHRASEELEMENT.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 * @version v4.0.30319
 */
class SPPATHENTRY extends Win32Struct
{
    static sizeof => 64

    static packingSize => 8

    /**
     * @type {Pointer<Void>}
     */
    hTransition {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {SPPHRASEELEMENT}
     */
    elem{
        get {
            if(!this.HasProp("__elem"))
                this.__elem := SPPHRASEELEMENT(this.ptr + 8)
            return this.__elem
        }
    }
}
