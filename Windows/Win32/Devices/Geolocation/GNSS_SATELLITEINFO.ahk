#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\BOOL.ahk

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
     * @type {BOOL}
     */
    UsedInPositiong{
        get {
            if(!this.HasProp("__UsedInPositiong"))
                this.__UsedInPositiong := BOOL(this.ptr + 4)
            return this.__UsedInPositiong
        }
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
