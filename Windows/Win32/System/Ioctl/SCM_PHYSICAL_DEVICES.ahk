#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\SCM_PHYSICAL_DEVICE_INSTANCE.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class SCM_PHYSICAL_DEVICES extends Win32Struct
{
    static sizeof => 24

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
     * @type {Array<SCM_PHYSICAL_DEVICE_INSTANCE>}
     */
    Devices{
        get {
            if(!this.HasProp("__DevicesProxyArray"))
                this.__DevicesProxyArray := Win32FixedArray(this.ptr + 16, 1, SCM_PHYSICAL_DEVICE_INSTANCE, "")
            return this.__DevicesProxyArray
        }
    }
}
