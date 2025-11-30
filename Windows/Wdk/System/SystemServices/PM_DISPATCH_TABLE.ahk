#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 * @version v4.0.30319
 */
class PM_DISPATCH_TABLE extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {Integer}
     */
    Signature {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    Version {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Array<Void>}
     */
    Function{
        get {
            if(!this.HasProp("__FunctionProxyArray"))
                this.__FunctionProxyArray := Win32FixedArray(this.ptr + 8, 1, Primitive, "ptr")
            return this.__FunctionProxyArray
        }
    }
}
