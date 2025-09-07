#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk

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
     * @type {Integer}
     */
    DeviceCapabilitiesA {
        get => NumGet(this, 264, "uint")
        set => NumPut("uint", value, this, 264)
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
    pszVendorDescription{
        get {
            if(!this.HasProp("__pszVendorDescription"))
                this.__pszVendorDescription := PWSTR(this.ptr + 272)
            return this.__pszVendorDescription
        }
    }

    /**
     * @type {PWSTR}
     */
    pszDeviceDescription{
        get {
            if(!this.HasProp("__pszDeviceDescription"))
                this.__pszDeviceDescription := PWSTR(this.ptr + 280)
            return this.__pszDeviceDescription
        }
    }

    /**
     * @type {PWSTR}
     */
    pszPortName{
        get {
            if(!this.HasProp("__pszPortName"))
                this.__pszPortName := PWSTR(this.ptr + 288)
            return this.__pszPortName
        }
    }

    /**
     * @type {PWSTR}
     */
    pszPropProvider{
        get {
            if(!this.HasProp("__pszPropProvider"))
                this.__pszPropProvider := PWSTR(this.ptr + 296)
            return this.__pszPropProvider
        }
    }

    /**
     * @type {PWSTR}
     */
    pszLocalName{
        get {
            if(!this.HasProp("__pszLocalName"))
                this.__pszLocalName := PWSTR(this.ptr + 304)
            return this.__pszLocalName
        }
    }
}
