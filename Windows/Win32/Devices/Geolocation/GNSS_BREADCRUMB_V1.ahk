#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\FILETIME.ahk

/**
 * @namespace Windows.Win32.Devices.Geolocation
 * @version v4.0.30319
 */
class GNSS_BREADCRUMB_V1 extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * @type {FILETIME}
     */
    FixTimeStamp{
        get {
            if(!this.HasProp("__FixTimeStamp"))
                this.__FixTimeStamp := FILETIME(this.ptr + 0)
            return this.__FixTimeStamp
        }
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
     * @type {Integer}
     */
    HorizontalAccuracy {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * @type {Integer}
     */
    Speed {
        get => NumGet(this, 28, "ushort")
        set => NumPut("ushort", value, this, 28)
    }

    /**
     * @type {Integer}
     */
    SpeedAccuracy {
        get => NumGet(this, 30, "ushort")
        set => NumPut("ushort", value, this, 30)
    }

    /**
     * @type {Integer}
     */
    Altitude {
        get => NumGet(this, 32, "short")
        set => NumPut("short", value, this, 32)
    }

    /**
     * @type {Integer}
     */
    AltitudeAccuracy {
        get => NumGet(this, 34, "ushort")
        set => NumPut("ushort", value, this, 34)
    }

    /**
     * @type {Integer}
     */
    Heading {
        get => NumGet(this, 36, "short")
        set => NumPut("short", value, this, 36)
    }

    /**
     * @type {Integer}
     */
    HeadingAccuracy {
        get => NumGet(this, 38, "char")
        set => NumPut("char", value, this, 38)
    }

    /**
     * @type {Integer}
     */
    FixSuccess {
        get => NumGet(this, 39, "char")
        set => NumPut("char", value, this, 39)
    }
}
