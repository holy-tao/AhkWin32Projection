#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 * @version v4.0.30319
 */
class DEVICE_RELATIONS extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {Integer}
     */
    Count {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Array<DEVICE_OBJECT>}
     */
    Objects{
        get {
            if(!this.HasProp("__ObjectsProxyArray"))
                this.__ObjectsProxyArray := Win32FixedArray(this.ptr + 8, 1, Primitive, "ptr")
            return this.__ObjectsProxyArray
        }
    }
}
