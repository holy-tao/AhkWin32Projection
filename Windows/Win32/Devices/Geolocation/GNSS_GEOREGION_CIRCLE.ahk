#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Devices.Geolocation
 * @version v4.0.30319
 */
class GNSS_GEOREGION_CIRCLE extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * @type {Float}
     */
    Latitude {
        get => NumGet(this, 0, "double")
        set => NumPut("double", value, this, 0)
    }

    /**
     * @type {Float}
     */
    Longitude {
        get => NumGet(this, 8, "double")
        set => NumPut("double", value, this, 8)
    }

    /**
     * @type {Float}
     */
    RadiusInMeters {
        get => NumGet(this, 16, "double")
        set => NumPut("double", value, this, 16)
    }
}
