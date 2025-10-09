#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\FILETIME.ahk
#Include .\GNSS_FIXDATA_BASIC.ahk
#Include .\GNSS_FIXDATA_ACCURACY.ahk
#Include .\GNSS_SATELLITEINFO.ahk
#Include .\GNSS_FIXDATA_SATELLITE.ahk
#Include .\GNSS_FIXDATA.ahk
#Include .\GNSS_AGNSS_REQUEST_PARAM.ahk
#Include .\GNSS_SUPL_NI_INFO.ahk
#Include .\GNSS_CP_NI_INFO.ahk
#Include .\GNSS_V2UPL_NI_INFO.ahk
#Include .\GNSS_NI_REQUEST_PARAM.ahk
#Include .\GNSS_ERRORINFO.ahk
#Include .\GNSS_NMEA_DATA.ahk
#Include .\GNSS_GEOFENCE_ALERT_DATA.ahk
#Include .\GNSS_BREADCRUMBING_ALERT_DATA.ahk
#Include .\GNSS_GEOFENCES_TRACKINGSTATUS_DATA.ahk
#Include .\GNSS_DRIVER_REQUEST_DATA.ahk

/**
 * @namespace Windows.Win32.Devices.Geolocation
 * @version v4.0.30319
 */
class GNSS_EVENT extends Win32Struct
{
    static sizeof => 2136

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
    EventType {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    EventDataSize {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * @type {Array<Byte>}
     */
    Unused{
        get {
            if(!this.HasProp("__UnusedProxyArray"))
                this.__UnusedProxyArray := Win32FixedArray(this.ptr + 16, 512, Primitive, "char")
            return this.__UnusedProxyArray
        }
    }

    /**
     * @type {GNSS_FIXDATA}
     */
    FixData{
        get {
            if(!this.HasProp("__FixData"))
                this.__FixData := GNSS_FIXDATA(this.ptr + 528)
            return this.__FixData
        }
    }

    /**
     * @type {GNSS_AGNSS_REQUEST_PARAM}
     */
    AgnssRequest{
        get {
            if(!this.HasProp("__AgnssRequest"))
                this.__AgnssRequest := GNSS_AGNSS_REQUEST_PARAM(this.ptr + 528)
            return this.__AgnssRequest
        }
    }

    /**
     * @type {GNSS_NI_REQUEST_PARAM}
     */
    NiRequest{
        get {
            if(!this.HasProp("__NiRequest"))
                this.__NiRequest := GNSS_NI_REQUEST_PARAM(this.ptr + 528)
            return this.__NiRequest
        }
    }

    /**
     * @type {GNSS_ERRORINFO}
     */
    ErrorInformation{
        get {
            if(!this.HasProp("__ErrorInformation"))
                this.__ErrorInformation := GNSS_ERRORINFO(this.ptr + 528)
            return this.__ErrorInformation
        }
    }

    /**
     * @type {GNSS_NMEA_DATA}
     */
    NmeaData{
        get {
            if(!this.HasProp("__NmeaData"))
                this.__NmeaData := GNSS_NMEA_DATA(this.ptr + 528)
            return this.__NmeaData
        }
    }

    /**
     * @type {GNSS_GEOFENCE_ALERT_DATA}
     */
    GeofenceAlertData{
        get {
            if(!this.HasProp("__GeofenceAlertData"))
                this.__GeofenceAlertData := GNSS_GEOFENCE_ALERT_DATA(this.ptr + 528)
            return this.__GeofenceAlertData
        }
    }

    /**
     * @type {GNSS_BREADCRUMBING_ALERT_DATA}
     */
    BreadcrumbAlertData{
        get {
            if(!this.HasProp("__BreadcrumbAlertData"))
                this.__BreadcrumbAlertData := GNSS_BREADCRUMBING_ALERT_DATA(this.ptr + 528)
            return this.__BreadcrumbAlertData
        }
    }

    /**
     * @type {GNSS_GEOFENCES_TRACKINGSTATUS_DATA}
     */
    GeofencesTrackingStatus{
        get {
            if(!this.HasProp("__GeofencesTrackingStatus"))
                this.__GeofencesTrackingStatus := GNSS_GEOFENCES_TRACKINGSTATUS_DATA(this.ptr + 528)
            return this.__GeofencesTrackingStatus
        }
    }

    /**
     * @type {GNSS_DRIVER_REQUEST_DATA}
     */
    DriverRequestData{
        get {
            if(!this.HasProp("__DriverRequestData"))
                this.__DriverRequestData := GNSS_DRIVER_REQUEST_DATA(this.ptr + 528)
            return this.__DriverRequestData
        }
    }

    /**
     * @type {Array<Byte>}
     */
    CustomData{
        get {
            if(!this.HasProp("__CustomDataProxyArray"))
                this.__CustomDataProxyArray := Win32FixedArray(this.ptr + 528, 1, Primitive, "char")
            return this.__CustomDataProxyArray
        }
    }
}
