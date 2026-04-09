#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.System.Services
 */
class SERVICE_TRIGGER_CUSTOM_STATE_ID extends Win32Struct {
    static sizeof => 8

    static packingSize => 4

    /**
     * @type {Array<Integer>}
     */
    Data {
        get {
            if(!this.HasProp("__DataProxyArray"))
                this.__DataProxyArray := Win32FixedArray(this.ptr + 0, 2, Primitive, "uint")
            return this.__DataProxyArray
        }
    }
}
