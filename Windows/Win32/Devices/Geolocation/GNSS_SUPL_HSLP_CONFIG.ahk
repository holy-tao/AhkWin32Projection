#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Devices.Geolocation
 * @version v4.0.30319
 */
class GNSS_SUPL_HSLP_CONFIG extends Win32Struct
{
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
     * @type {Array<SByte>}
     */
    SuplHslp{
        get {
            if(!this.HasProp("__SuplHslpProxyArray"))
                this.__SuplHslpProxyArray := Win32FixedArray(this.ptr + 8, 260, Primitive, "char")
            return this.__SuplHslpProxyArray
        }
    }

    /**
     * @type {Array<SByte>}
     */
    SuplHslpFromImsi{
        get {
            if(!this.HasProp("__SuplHslpFromImsiProxyArray"))
                this.__SuplHslpFromImsiProxyArray := Win32FixedArray(this.ptr + 268, 260, Primitive, "char")
            return this.__SuplHslpFromImsiProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    Reserved {
        get => NumGet(this, 528, "uint")
        set => NumPut("uint", value, this, 528)
    }

    /**
     * @type {Array<Byte>}
     */
    Unused{
        get {
            if(!this.HasProp("__UnusedProxyArray"))
                this.__UnusedProxyArray := Win32FixedArray(this.ptr + 532, 512, Primitive, "char")
            return this.__UnusedProxyArray
        }
    }
}
