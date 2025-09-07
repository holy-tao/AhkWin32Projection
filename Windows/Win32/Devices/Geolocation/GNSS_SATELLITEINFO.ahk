#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Devices.Geolocation
 * @version v4.0.30319
 */
class GNSS_SATELLITEINFO extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * @type {Integer}
     */
    SatelliteId {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    UsedInPositiong {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * @type {Float}
     */
    Elevation {
        get => NumGet(this, 8, "double")
        set => NumPut("double", value, this, 8)
    }

    /**
     * @type {Float}
     */
    Azimuth {
        get => NumGet(this, 16, "double")
        set => NumPut("double", value, this, 16)
    }

    /**
     * @type {Float}
     */
    SignalToNoiseRatio {
        get => NumGet(this, 24, "double")
        set => NumPut("double", value, this, 24)
    }
}
