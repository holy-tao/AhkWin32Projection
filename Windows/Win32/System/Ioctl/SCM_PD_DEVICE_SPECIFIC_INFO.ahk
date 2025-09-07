#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\SCM_PD_DEVICE_SPECIFIC_PROPERTY.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class SCM_PD_DEVICE_SPECIFIC_INFO extends Win32Struct
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
    NumberOfProperties {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Array<SCM_PD_DEVICE_SPECIFIC_PROPERTY>}
     */
    DeviceSpecificProperties{
        get {
            if(!this.HasProp("__DeviceSpecificPropertiesProxyArray"))
                this.__DeviceSpecificPropertiesProxyArray := Win32FixedArray(this.ptr + 16, 8, SCM_PD_DEVICE_SPECIFIC_PROPERTY, "")
            return this.__DeviceSpecificPropertiesProxyArray
        }
    }
}
