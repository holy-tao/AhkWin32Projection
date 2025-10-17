#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\FILETIME.ahk

/**
 * @namespace Windows.Win32.Devices.Geolocation
 * @version v4.0.30319
 */
class GNSS_GEOFENCES_TRACKINGSTATUS_DATA extends Win32Struct
{
    static sizeof => 536

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
     * @type {NTSTATUS}
     */
    Status {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * @type {FILETIME}
     */
    StatusTimeStamp{
        get {
            if(!this.HasProp("__StatusTimeStamp"))
                this.__StatusTimeStamp := FILETIME(16, this)
            return this.__StatusTimeStamp
        }
    }

    /**
     * @type {Array<Byte>}
     */
    Unused{
        get {
            if(!this.HasProp("__UnusedProxyArray"))
                this.__UnusedProxyArray := Win32FixedArray(this.ptr + 24, 512, Primitive, "char")
            return this.__UnusedProxyArray
        }
    }
}
