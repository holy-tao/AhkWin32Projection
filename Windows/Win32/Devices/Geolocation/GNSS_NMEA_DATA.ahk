#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Devices.Geolocation
 */
class GNSS_NMEA_DATA extends Win32Struct {
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
     * @type {String}
     */
    NmeaSentences {
        get => StrGet(this.ptr + 8, 255, "UTF-8")
        set => StrPut(value, this.ptr + 8, 255, "UTF-8")
    }
}
