#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Devices.Geolocation
 * @version v4.0.30319
 */
class GNSS_CHIPSETINFO extends Win32Struct
{
    static sizeof => 660

    static packingSize => 4

    /**
     * @type {Integer}
     */
    Size {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    Version {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {String}
     */
    ManufacturerID {
        get => StrGet(this.ptr + 8, 24, "UTF-16")
        set => StrPut(value, this.ptr + 8, 24, "UTF-16")
    }

    /**
     * @type {String}
     */
    HardwareID {
        get => StrGet(this.ptr + 58, 24, "UTF-16")
        set => StrPut(value, this.ptr + 58, 24, "UTF-16")
    }

    /**
     * @type {String}
     */
    FirmwareVersion {
        get => StrGet(this.ptr + 108, 19, "UTF-16")
        set => StrPut(value, this.ptr + 108, 19, "UTF-16")
    }

    /**
     * @type {Array<Byte>}
     */
    Unused{
        get {
            if(!this.HasProp("__UnusedProxyArray"))
                this.__UnusedProxyArray := Win32FixedArray(this.ptr + 148, 1, Primitive, "char")
            return this.__UnusedProxyArray
        }
    }
}
