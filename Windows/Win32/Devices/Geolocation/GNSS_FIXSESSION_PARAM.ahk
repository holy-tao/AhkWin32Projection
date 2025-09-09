#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\GNSS_SINGLESHOT_PARAM.ahk
#Include .\GNSS_DISTANCETRACKING_PARAM.ahk
#Include .\GNSS_CONTINUOUSTRACKING_PARAM.ahk
#Include .\GNSS_LKGFIX_PARAM.ahk

/**
 * @namespace Windows.Win32.Devices.Geolocation
 * @version v4.0.30319
 */
class GNSS_FIXSESSION_PARAM extends Win32Struct
{
    static sizeof => 336

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
    FixSessionID {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    SessionType {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }

    /**
     * @type {Integer}
     */
    HorizontalAccuracy {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    HorizontalConfidence {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * @type {Array<UInt32>}
     */
    Reserved{
        get {
            if(!this.HasProp("__ReservedProxyArray"))
                this.__ReservedProxyArray := Win32FixedArray(this.ptr + 24, 9, Primitive, "uint")
            return this.__ReservedProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    FixLevelOfDetails {
        get => NumGet(this, 60, "uint")
        set => NumPut("uint", value, this, 60)
    }

    /**
     * @type {GNSS_SINGLESHOT_PARAM}
     */
    SingleShotParam{
        get {
            if(!this.HasProp("__SingleShotParam"))
                this.__SingleShotParam := GNSS_SINGLESHOT_PARAM(this.ptr + 64)
            return this.__SingleShotParam
        }
    }

    /**
     * @type {GNSS_DISTANCETRACKING_PARAM}
     */
    DistanceParam{
        get {
            if(!this.HasProp("__DistanceParam"))
                this.__DistanceParam := GNSS_DISTANCETRACKING_PARAM(this.ptr + 64)
            return this.__DistanceParam
        }
    }

    /**
     * @type {GNSS_CONTINUOUSTRACKING_PARAM}
     */
    ContinuousParam{
        get {
            if(!this.HasProp("__ContinuousParam"))
                this.__ContinuousParam := GNSS_CONTINUOUSTRACKING_PARAM(this.ptr + 64)
            return this.__ContinuousParam
        }
    }

    /**
     * @type {GNSS_LKGFIX_PARAM}
     */
    LkgFixParam{
        get {
            if(!this.HasProp("__LkgFixParam"))
                this.__LkgFixParam := GNSS_LKGFIX_PARAM(this.ptr + 64)
            return this.__LkgFixParam
        }
    }

    /**
     * @type {Array<Byte>}
     */
    UnusedParam{
        get {
            if(!this.HasProp("__UnusedParamProxyArray"))
                this.__UnusedParamProxyArray := Win32FixedArray(this.ptr + 64, 268, Primitive, "char")
            return this.__UnusedParamProxyArray
        }
    }

    /**
     * @type {Array<Byte>}
     */
    Unused{
        get {
            if(!this.HasProp("__UnusedProxyArray"))
                this.__UnusedProxyArray := Win32FixedArray(this.ptr + 76, 256, Primitive, "char")
            return this.__UnusedProxyArray
        }
    }
}
