#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Security
 * @version v4.0.30319
 */
class ACCESS_REASONS extends Win32Struct
{
    static sizeof => 128

    static packingSize => 4

    /**
     * @type {Array<UInt32>}
     */
    Data{
        get {
            if(!this.HasProp("__DataProxyArray"))
                this.__DataProxyArray := Win32FixedArray(this.ptr + 0, 4, Primitive, "uint")
            return this.__DataProxyArray
        }
    }
}
