#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\GNSS_SATELLITEINFO.ahk

/**
 * @namespace Windows.Win32.Devices.Geolocation
 * @version v4.0.30319
 */
class GNSS_FIXDATA_SATELLITE extends Win32Struct
{
    static sizeof => 528

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
    SatelliteCount {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Array<GNSS_SATELLITEINFO>}
     */
    SatelliteArray{
        get {
            if(!this.HasProp("__SatelliteArrayProxyArray"))
                this.__SatelliteArrayProxyArray := Win32FixedArray(this.ptr + 16, 8, GNSS_SATELLITEINFO, "")
            return this.__SatelliteArrayProxyArray
        }
    }
}
