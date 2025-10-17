#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\STI_DEV_CAPS.ahk

/**
 * @namespace Windows.Win32.Devices.Fax
 * @version v4.0.30319
 */
class STI_DEVICE_INFORMATIONW extends Win32Struct
{
    static sizeof => 312

    static packingSize => 8

    /**
     * @type {Integer}
     */
    dwSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    DeviceType {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {String}
     */
    szDeviceInternalName {
        get => StrGet(this.ptr + 8, 127, "UTF-16")
        set => StrPut(value, this.ptr + 8, 127, "UTF-16")
    }

    /**
     * @type {STI_DEV_CAPS}
     */
    DeviceCapabilitiesA{
        get {
            if(!this.HasProp("__DeviceCapabilitiesA"))
                this.__DeviceCapabilitiesA := STI_DEV_CAPS(264, this)
            return this.__DeviceCapabilitiesA
        }
    }

    /**
     * @type {Integer}
     */
    dwHardwareConfiguration {
        get => NumGet(this, 268, "uint")
        set => NumPut("uint", value, this, 268)
    }

    /**
     * @type {PWSTR}
     */
    pszVendorDescription {
        get => NumGet(this, 272, "ptr")
        set => NumPut("ptr", value, this, 272)
    }

    /**
     * @type {PWSTR}
     */
    pszDeviceDescription {
        get => NumGet(this, 280, "ptr")
        set => NumPut("ptr", value, this, 280)
    }

    /**
     * @type {PWSTR}
     */
    pszPortName {
        get => NumGet(this, 288, "ptr")
        set => NumPut("ptr", value, this, 288)
    }

    /**
     * @type {PWSTR}
     */
    pszPropProvider {
        get => NumGet(this, 296, "ptr")
        set => NumPut("ptr", value, this, 296)
    }

    /**
     * @type {PWSTR}
     */
    pszLocalName {
        get => NumGet(this, 304, "ptr")
        set => NumPut("ptr", value, this, 304)
    }
}
