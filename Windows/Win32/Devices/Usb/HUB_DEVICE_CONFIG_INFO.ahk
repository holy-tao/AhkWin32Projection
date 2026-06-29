#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\USB_HUB_DEVICE_UXD_SETTINGS.ahk
#Include .\USB_ID_STRING.ahk
#Include .\USB_HUB_CAP_FLAGS.ahk

/**
 * @namespace Windows.Win32.Devices.Usb
 */
class HUB_DEVICE_CONFIG_INFO extends Win32Struct {
    static sizeof => 208

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
    Length {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {USB_HUB_CAP_FLAGS}
     */
    HubFlags {
        get {
            if(!this.HasProp("__HubFlags"))
                this.__HubFlags := USB_HUB_CAP_FLAGS(8, this)
            return this.__HubFlags
        }
    }

    /**
     * @type {USB_ID_STRING}
     */
    HardwareIds {
        get {
            if(!this.HasProp("__HardwareIds"))
                this.__HardwareIds := USB_ID_STRING(16, this)
            return this.__HardwareIds
        }
    }

    /**
     * @type {USB_ID_STRING}
     */
    CompatibleIds {
        get {
            if(!this.HasProp("__CompatibleIds"))
                this.__CompatibleIds := USB_ID_STRING(32, this)
            return this.__CompatibleIds
        }
    }

    /**
     * @type {USB_ID_STRING}
     */
    DeviceDescription {
        get {
            if(!this.HasProp("__DeviceDescription"))
                this.__DeviceDescription := USB_ID_STRING(48, this)
            return this.__DeviceDescription
        }
    }

    /**
     * @type {Array<Integer>}
     */
    Reserved {
        get {
            if(!this.HasProp("__ReservedProxyArray"))
                this.__ReservedProxyArray := Win32FixedArray(this.ptr + 64, 19, Primitive, "uint")
            return this.__ReservedProxyArray
        }
    }

    /**
     * @type {USB_HUB_DEVICE_UXD_SETTINGS}
     */
    UxdSettings {
        get {
            if(!this.HasProp("__UxdSettings"))
                this.__UxdSettings := USB_HUB_DEVICE_UXD_SETTINGS(140, this)
            return this.__UxdSettings
        }
    }
}
