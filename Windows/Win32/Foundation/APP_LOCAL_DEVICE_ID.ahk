#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Foundation
 * @version v4.0.30319
 */
class APP_LOCAL_DEVICE_ID extends Win32Struct
{
    static sizeof => 32

    static packingSize => 1

    /**
     * @type {Array<Byte>}
     */
    value{
        get {
            if(!this.HasProp("__valueProxyArray"))
                this.__valueProxyArray := Win32FixedArray(this.ptr + 0, 1, Primitive, "char")
            return this.__valueProxyArray
        }
    }
}
