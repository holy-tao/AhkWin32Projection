#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\GNSS_FIXDATA_BASIC.ahk
#Include .\GNSS_FIXDATA_ACCURACY.ahk

/**
 * @namespace Windows.Win32.Devices.Geolocation
 * @version v4.0.30319
 */
class GNSS_GEOFENCE_ALERT_DATA extends Win32Struct
{
    static sizeof => 640

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
    GeofenceID {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    GeofenceState {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }

    /**
     * @type {GNSS_FIXDATA_BASIC}
     */
    FixBasicData{
        get {
            if(!this.HasProp("__FixBasicData"))
                this.__FixBasicData := GNSS_FIXDATA_BASIC(16, this)
            return this.__FixBasicData
        }
    }

    /**
     * @type {GNSS_FIXDATA_ACCURACY}
     */
    FixAccuracyData{
        get {
            if(!this.HasProp("__FixAccuracyData"))
                this.__FixAccuracyData := GNSS_FIXDATA_ACCURACY(64, this)
            return this.__FixAccuracyData
        }
    }

    /**
     * @type {Array<Byte>}
     */
    Unused{
        get {
            if(!this.HasProp("__UnusedProxyArray"))
                this.__UnusedProxyArray := Win32FixedArray(this.ptr + 128, 512, Primitive, "char")
            return this.__UnusedProxyArray
        }
    }
}
