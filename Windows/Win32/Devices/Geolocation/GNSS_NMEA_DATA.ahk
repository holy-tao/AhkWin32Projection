#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Devices.Geolocation
 * @version v4.0.30319
 */
class GNSS_NMEA_DATA extends Win32Struct
{
    static sizeof => 264

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
    NmeaSentences{
        get {
            if(!this.HasProp("__NmeaSentencesProxyArray"))
                this.__NmeaSentencesProxyArray := Win32FixedArray(this.ptr + 8, 256, Primitive, "char")
            return this.__NmeaSentencesProxyArray
        }
    }
}
