#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\FILETIME.ahk

/**
 * @namespace Windows.Win32.Devices.Geolocation
 * @version v4.0.30319
 */
class GNSS_AGNSS_INJECTTIME extends Win32Struct
{
    static sizeof => 20

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
     * @type {FILETIME}
     */
    UtcTime{
        get {
            if(!this.HasProp("__UtcTime"))
                this.__UtcTime := FILETIME(8, this)
            return this.__UtcTime
        }
    }

    /**
     * @type {Integer}
     */
    TimeUncertainty {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }
}
