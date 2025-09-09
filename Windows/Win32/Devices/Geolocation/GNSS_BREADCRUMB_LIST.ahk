#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\FILETIME.ahk
#Include .\GNSS_BREADCRUMB_V1.ahk

/**
 * @namespace Windows.Win32.Devices.Geolocation
 * @version v4.0.30319
 */
class GNSS_BREADCRUMB_LIST extends Win32Struct
{
    static sizeof => 416

    static packingSize => 8

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
     * @type {Integer}
     */
    NumCrumbs {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Array<GNSS_BREADCRUMB_V1>}
     */
    v1{
        get {
            if(!this.HasProp("__v1ProxyArray"))
                this.__v1ProxyArray := Win32FixedArray(this.ptr + 16, 50, GNSS_BREADCRUMB_V1, "")
            return this.__v1ProxyArray
        }
    }
}
