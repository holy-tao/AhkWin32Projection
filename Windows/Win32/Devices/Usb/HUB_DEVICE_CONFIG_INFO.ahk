#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\USB_HUB_CAP_FLAGS.ahk
#Include ..\..\Foundation\PWSTR.ahk
#Include .\USB_ID_STRING.ahk
#Include .\USB_HUB_DEVICE_UXD_SETTINGS.ahk

/**
 * @namespace Windows.Win32.Devices.Usb
 * @version v4.0.30319
 */
class HUB_DEVICE_CONFIG_INFO extends Win32Struct
{
    static sizeof => 192

    static packingSize => 1

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
    Length {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {USB_HUB_CAP_FLAGS}
     */
    HubFlags{
        get {
            if(!this.HasProp("__HubFlags"))
                this.__HubFlags := USB_HUB_CAP_FLAGS(this.ptr + 8)
            return this.__HubFlags
        }
    }

    /**
     * @type {USB_ID_STRING}
     */
    HardwareIds{
        get {
            if(!this.HasProp("__HardwareIds"))
                this.__HardwareIds := USB_ID_STRING(this.ptr + 16)
            return this.__HardwareIds
        }
    }

    /**
     * @type {USB_ID_STRING}
     */
    CompatibleIds{
        get {
            if(!this.HasProp("__CompatibleIds"))
                this.__CompatibleIds := USB_ID_STRING(this.ptr + 32)
            return this.__CompatibleIds
        }
    }

    /**
     * @type {USB_ID_STRING}
     */
    DeviceDescription{
        get {
            if(!this.HasProp("__DeviceDescription"))
                this.__DeviceDescription := USB_ID_STRING(this.ptr + 48)
            return this.__DeviceDescription
        }
    }

    /**
     * @type {Array<UInt32>}
     */
    Reserved{
        get {
            if(!this.HasProp("__ReservedProxyArray"))
                this.__ReservedProxyArray := Win32FixedArray(this.ptr + 64, 4, Primitive, "uint")
            return this.__ReservedProxyArray
        }
    }

    /**
     * @type {USB_HUB_DEVICE_UXD_SETTINGS}
     */
    UxdSettings{
        get {
            if(!this.HasProp("__UxdSettings"))
                this.__UxdSettings := USB_HUB_DEVICE_UXD_SETTINGS(this.ptr + 140)
            return this.__UxdSettings
        }
    }
}
