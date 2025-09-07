#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\GNSS_FIXDATA_BASIC.ahk
#Include .\GNSS_FIXDATA_ACCURACY.ahk

/**
 * @namespace Windows.Win32.Devices.Geolocation
 * @version v4.0.30319
 */
class GNSS_AGNSS_INJECTPOSITION extends Win32Struct
{
    static sizeof => 128

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
    Age {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {GNSS_FIXDATA_BASIC}
     */
    BasicData{
        get {
            if(!this.HasProp("__BasicData"))
                this.__BasicData := GNSS_FIXDATA_BASIC(this.ptr + 16)
            return this.__BasicData
        }
    }

    /**
     * @type {GNSS_FIXDATA_ACCURACY}
     */
    AccuracyData{
        get {
            if(!this.HasProp("__AccuracyData"))
                this.__AccuracyData := GNSS_FIXDATA_ACCURACY(this.ptr + 64)
            return this.__AccuracyData
        }
    }
}
