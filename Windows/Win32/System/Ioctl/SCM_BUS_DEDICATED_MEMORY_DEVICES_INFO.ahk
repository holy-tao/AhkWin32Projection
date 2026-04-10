#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\SCM_BUS_DEDICATED_MEMORY_DEVICE_INFO.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 */
class SCM_BUS_DEDICATED_MEMORY_DEVICES_INFO extends Win32Struct {
    static sizeof => 40

    static packingSize => 8

    /**
     * @type {Integer}
     */
    Version {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    Size {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    DeviceCount {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {SCM_BUS_DEDICATED_MEMORY_DEVICE_INFO}
     */
    Devices {
        get {
            if(!this.HasProp("__DevicesProxyArray"))
                this.__DevicesProxyArray := Win32FixedArray(this.ptr + 16, 1, SCM_BUS_DEDICATED_MEMORY_DEVICE_INFO, "")
            return this.__DevicesProxyArray
        }
    }
}
