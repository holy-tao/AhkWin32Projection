#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\BOOL.ahk
#Include .\GNSS_SUPL_VERSION.ahk

/**
 * @namespace Windows.Win32.Devices.Geolocation
 * @version v4.0.30319
 */
class GNSS_DEVICE_CAPABILITY extends Win32Struct
{
    static sizeof => 608

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
     * @type {BOOL}
     */
    SupportMultipleFixSessions{
        get {
            if(!this.HasProp("__SupportMultipleFixSessions"))
                this.__SupportMultipleFixSessions := BOOL(this.ptr + 8)
            return this.__SupportMultipleFixSessions
        }
    }

    /**
     * @type {BOOL}
     */
    SupportMultipleAppSessions{
        get {
            if(!this.HasProp("__SupportMultipleAppSessions"))
                this.__SupportMultipleAppSessions := BOOL(this.ptr + 12)
            return this.__SupportMultipleAppSessions
        }
    }

    /**
     * @type {BOOL}
     */
    RequireAGnssInjection{
        get {
            if(!this.HasProp("__RequireAGnssInjection"))
                this.__RequireAGnssInjection := BOOL(this.ptr + 16)
            return this.__RequireAGnssInjection
        }
    }

    /**
     * @type {Integer}
     */
    AgnssFormatSupported {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * @type {Integer}
     */
    AgnssFormatPreferred {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * @type {BOOL}
     */
    SupportDistanceTracking{
        get {
            if(!this.HasProp("__SupportDistanceTracking"))
                this.__SupportDistanceTracking := BOOL(this.ptr + 28)
            return this.__SupportDistanceTracking
        }
    }

    /**
     * @type {BOOL}
     */
    SupportContinuousTracking{
        get {
            if(!this.HasProp("__SupportContinuousTracking"))
                this.__SupportContinuousTracking := BOOL(this.ptr + 32)
            return this.__SupportContinuousTracking
        }
    }

    /**
     * @type {Integer}
     */
    Reserved1 {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }

    /**
     * @type {BOOL}
     */
    Reserved2{
        get {
            if(!this.HasProp("__Reserved2"))
                this.__Reserved2 := BOOL(this.ptr + 40)
            return this.__Reserved2
        }
    }

    /**
     * @type {BOOL}
     */
    Reserved3{
        get {
            if(!this.HasProp("__Reserved3"))
                this.__Reserved3 := BOOL(this.ptr + 44)
            return this.__Reserved3
        }
    }

    /**
     * @type {BOOL}
     */
    Reserved4{
        get {
            if(!this.HasProp("__Reserved4"))
                this.__Reserved4 := BOOL(this.ptr + 48)
            return this.__Reserved4
        }
    }

    /**
     * @type {BOOL}
     */
    Reserved5{
        get {
            if(!this.HasProp("__Reserved5"))
                this.__Reserved5 := BOOL(this.ptr + 52)
            return this.__Reserved5
        }
    }

    /**
     * @type {Integer}
     */
    GeofencingSupport {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }

    /**
     * @type {BOOL}
     */
    Reserved6{
        get {
            if(!this.HasProp("__Reserved6"))
                this.__Reserved6 := BOOL(this.ptr + 60)
            return this.__Reserved6
        }
    }

    /**
     * @type {BOOL}
     */
    Reserved7{
        get {
            if(!this.HasProp("__Reserved7"))
                this.__Reserved7 := BOOL(this.ptr + 64)
            return this.__Reserved7
        }
    }

    /**
     * @type {BOOL}
     */
    SupportCpLocation{
        get {
            if(!this.HasProp("__SupportCpLocation"))
                this.__SupportCpLocation := BOOL(this.ptr + 68)
            return this.__SupportCpLocation
        }
    }

    /**
     * @type {BOOL}
     */
    SupportUplV2{
        get {
            if(!this.HasProp("__SupportUplV2"))
                this.__SupportUplV2 := BOOL(this.ptr + 72)
            return this.__SupportUplV2
        }
    }

    /**
     * @type {BOOL}
     */
    SupportSuplV1{
        get {
            if(!this.HasProp("__SupportSuplV1"))
                this.__SupportSuplV1 := BOOL(this.ptr + 76)
            return this.__SupportSuplV1
        }
    }

    /**
     * @type {BOOL}
     */
    SupportSuplV2{
        get {
            if(!this.HasProp("__SupportSuplV2"))
                this.__SupportSuplV2 := BOOL(this.ptr + 80)
            return this.__SupportSuplV2
        }
    }

    /**
     * @type {GNSS_SUPL_VERSION}
     */
    SupportedSuplVersion{
        get {
            if(!this.HasProp("__SupportedSuplVersion"))
                this.__SupportedSuplVersion := GNSS_SUPL_VERSION(this.ptr + 88)
            return this.__SupportedSuplVersion
        }
    }

    /**
     * @type {Integer}
     */
    MaxGeofencesSupported {
        get => NumGet(this, 96, "uint")
        set => NumPut("uint", value, this, 96)
    }

    /**
     * @type {BOOL}
     */
    SupportMultipleSuplRootCert{
        get {
            if(!this.HasProp("__SupportMultipleSuplRootCert"))
                this.__SupportMultipleSuplRootCert := BOOL(this.ptr + 100)
            return this.__SupportMultipleSuplRootCert
        }
    }

    /**
     * @type {Integer}
     */
    GnssBreadCrumbPayloadVersion {
        get => NumGet(this, 104, "uint")
        set => NumPut("uint", value, this, 104)
    }

    /**
     * @type {Integer}
     */
    MaxGnssBreadCrumbFixes {
        get => NumGet(this, 108, "uint")
        set => NumPut("uint", value, this, 108)
    }

    /**
     * @type {Array<Byte>}
     */
    Unused{
        get {
            if(!this.HasProp("__UnusedProxyArray"))
                this.__UnusedProxyArray := Win32FixedArray(this.ptr + 112, 496, Primitive, "char")
            return this.__UnusedProxyArray
        }
    }
}
