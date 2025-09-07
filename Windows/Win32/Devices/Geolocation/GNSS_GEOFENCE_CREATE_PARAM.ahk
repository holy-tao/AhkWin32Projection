#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\GNSS_GEOREGION_CIRCLE.ahk
#Include .\GNSS_GEOREGION.ahk

/**
 * @namespace Windows.Win32.Devices.Geolocation
 * @version v4.0.30319
 */
class GNSS_GEOFENCE_CREATE_PARAM extends Win32Struct
{
    static sizeof => 568

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
    AlertTypes {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    InitialState {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }

    /**
     * @type {GNSS_GEOREGION}
     */
    Boundary{
        get {
            if(!this.HasProp("__Boundary"))
                this.__Boundary := GNSS_GEOREGION(this.ptr + 16)
            return this.__Boundary
        }
    }

    /**
     * @type {Array<Byte>}
     */
    Unused{
        get {
            if(!this.HasProp("__UnusedProxyArray"))
                this.__UnusedProxyArray := Win32FixedArray(this.ptr + 56, 1, Primitive, "char")
            return this.__UnusedProxyArray
        }
    }
}
