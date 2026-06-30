#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\GNSS_NI_NOTIFICATION_TYPE.ahk
#Include .\GNSS_NI_REQUEST_TYPE.ahk
#Include .\GNSS_SUPL_NI_INFO.ahk
#Include .\GNSS_V2UPL_NI_INFO.ahk
#Include .\GNSS_CP_NI_INFO.ahk
#Include ..\..\Foundation\BOOL.ahk
#Include .\GNSS_NI_PLANE_TYPE.ahk

/**
 * @namespace Windows.Win32.Devices.Geolocation
 */
class GNSS_NI_REQUEST_PARAM extends Win32Struct {
    static sizeof => 1340

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
     * @type {Integer}
     */
    RequestId {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {GNSS_NI_REQUEST_TYPE}
     */
    RequestType {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }

    /**
     * @type {GNSS_NI_NOTIFICATION_TYPE}
     */
    NotificationType {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }

    /**
     * @type {GNSS_NI_PLANE_TYPE}
     */
    RequestPlaneType {
        get => NumGet(this, 20, "int")
        set => NumPut("int", value, this, 20)
    }

    /**
     * @type {GNSS_SUPL_NI_INFO}
     */
    SuplNiInfo {
        get {
            if(!this.HasProp("__SuplNiInfo"))
                this.__SuplNiInfo := GNSS_SUPL_NI_INFO(24, this)
            return this.__SuplNiInfo
        }
    }

    /**
     * @type {GNSS_CP_NI_INFO}
     */
    CpNiInfo {
        get {
            if(!this.HasProp("__CpNiInfo"))
                this.__CpNiInfo := GNSS_CP_NI_INFO(24, this)
            return this.__CpNiInfo
        }
    }

    /**
     * @type {GNSS_V2UPL_NI_INFO}
     */
    V2UplNiInfo {
        get {
            if(!this.HasProp("__V2UplNiInfo"))
                this.__V2UplNiInfo := GNSS_V2UPL_NI_INFO(24, this)
            return this.__V2UplNiInfo
        }
    }

    /**
     * @type {Integer}
     */
    ResponseTimeInSec {
        get => NumGet(this, 1332, "uint")
        set => NumPut("uint", value, this, 1332)
    }

    /**
     * @type {BOOL}
     */
    EmergencyLocation {
        get => NumGet(this, 1336, "int")
        set => NumPut("int", value, this, 1336)
    }
}
