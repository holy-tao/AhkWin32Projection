#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
class DEBUGGING_DEVICE_IN_USE_INFORMATION extends Win32Struct {
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {Integer}
     */
    DeviceCount {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Array<Pointer>}
     */
    Device {
        get {
            if(!this.HasProp("__DeviceProxyArray"))
                this.__DeviceProxyArray := Win32FixedArray(this.ptr + 8, 1, Primitive, "ptr")
            return this.__DeviceProxyArray
        }
    }
}
