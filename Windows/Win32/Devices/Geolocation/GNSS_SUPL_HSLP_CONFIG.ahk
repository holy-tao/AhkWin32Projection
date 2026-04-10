#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Devices.Geolocation
 */
class GNSS_SUPL_HSLP_CONFIG extends Win32Struct {
    static sizeof => 1044

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
    SuplHslp {
        get => StrGet(this.ptr + 8, 259, "UTF-8")
        set => StrPut(value, this.ptr + 8, 259, "UTF-8")
    }

    /**
     * @type {String}
     */
    SuplHslpFromImsi {
        get => StrGet(this.ptr + 268, 259, "UTF-8")
        set => StrPut(value, this.ptr + 268, 259, "UTF-8")
    }

    /**
     * @type {Integer}
     */
    Reserved {
        get => NumGet(this, 528, "uint")
        set => NumPut("uint", value, this, 528)
    }

    /**
     * @type {Array<Integer>}
     */
    Unused {
        get {
            if(!this.HasProp("__UnusedProxyArray"))
                this.__UnusedProxyArray := Win32FixedArray(this.ptr + 532, 512, Primitive, "char")
            return this.__UnusedProxyArray
        }
    }
}
