#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.System.Rpc
 * @version v4.0.30319
 */
class NDR_SCONTEXT extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * @type {Array<Void>}
     */
    pad{
        get {
            if(!this.HasProp("__padProxyArray"))
                this.__padProxyArray := Win32FixedArray(this.ptr + 0, 8, Primitive, "ptr")
            return this.__padProxyArray
        }
    }

    /**
     * @type {Pointer<Void>}
     */
    userContext {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }
}
