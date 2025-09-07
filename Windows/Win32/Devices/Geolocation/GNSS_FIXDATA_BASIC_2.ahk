#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Devices.Geolocation
 * @version v4.0.30319
 */
class GNSS_FIXDATA_BASIC_2 extends Win32Struct
{
    static sizeof => 56

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
     * @type {Float}
     */
    Latitude {
        get => NumGet(this, 8, "double")
        set => NumPut("double", value, this, 8)
    }

    /**
     * @type {Float}
     */
    Longitude {
        get => NumGet(this, 16, "double")
        set => NumPut("double", value, this, 16)
    }

    /**
     * @type {Float}
     */
    Altitude {
        get => NumGet(this, 24, "double")
        set => NumPut("double", value, this, 24)
    }

    /**
     * @type {Float}
     */
    Speed {
        get => NumGet(this, 32, "double")
        set => NumPut("double", value, this, 32)
    }

    /**
     * @type {Float}
     */
    Heading {
        get => NumGet(this, 40, "double")
        set => NumPut("double", value, this, 40)
    }

    /**
     * @type {Float}
     */
    AltitudeEllipsoid {
        get => NumGet(this, 48, "double")
        set => NumPut("double", value, this, 48)
    }
}
