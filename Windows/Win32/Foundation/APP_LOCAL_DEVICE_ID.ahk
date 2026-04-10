#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Foundation
 */
class APP_LOCAL_DEVICE_ID extends Win32Struct {
    static sizeof => 32

    static packingSize => 1

    /**
     * @type {Array<Integer>}
     */
    value {
        get {
            if(!this.HasProp("__valueProxyArray"))
                this.__valueProxyArray := Win32FixedArray(this.ptr + 0, 32, Primitive, "char")
            return this.__valueProxyArray
        }
    }
}
