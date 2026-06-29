#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\GNSS_BREADCRUMBING_ALERT_DATA.ahk" { GNSS_BREADCRUMBING_ALERT_DATA }
#Import ".\GNSS_FIXDATA_SATELLITE.ahk" { GNSS_FIXDATA_SATELLITE }
#Import ".\GNSS_SATELLITEINFO.ahk" { GNSS_SATELLITEINFO }
#Import ".\GNSS_GEOFENCE_STATE.ahk" { GNSS_GEOFENCE_STATE }
#Import ".\GNSS_AGNSS_REQUEST_PARAM.ahk" { GNSS_AGNSS_REQUEST_PARAM }
#Import ".\GNSS_NI_NOTIFICATION_TYPE.ahk" { GNSS_NI_NOTIFICATION_TYPE }
#Import ".\GNSS_CP_NI_INFO.ahk" { GNSS_CP_NI_INFO }
#Import ".\GNSS_FIXDATA.ahk" { GNSS_FIXDATA }
#Import ".\GNSS_V2UPL_NI_INFO.ahk" { GNSS_V2UPL_NI_INFO }
#Import ".\GNSS_NMEA_DATA.ahk" { GNSS_NMEA_DATA }
#Import ".\GNSS_NI_REQUEST_TYPE.ahk" { GNSS_NI_REQUEST_TYPE }
#Import ".\GNSS_GEOFENCES_TRACKINGSTATUS_DATA.ahk" { GNSS_GEOFENCES_TRACKINGSTATUS_DATA }
#Import ".\GNSS_FIXDATA_BASIC.ahk" { GNSS_FIXDATA_BASIC }
#Import ".\GNSS_NI_REQUEST_PARAM.ahk" { GNSS_NI_REQUEST_PARAM }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\GNSS_EVENT_TYPE.ahk" { GNSS_EVENT_TYPE }
#Import ".\GNSS_DRIVER_REQUEST_DATA.ahk" { GNSS_DRIVER_REQUEST_DATA }
#Import ".\GNSS_ERRORINFO.ahk" { GNSS_ERRORINFO }
#Import ".\GNSS_DRIVER_REQUEST.ahk" { GNSS_DRIVER_REQUEST }
#Import "..\..\Foundation\NTSTATUS.ahk" { NTSTATUS }
#Import ".\GNSS_GEOFENCE_ALERT_DATA.ahk" { GNSS_GEOFENCE_ALERT_DATA }
#Import ".\GNSS_FIXDATA_ACCURACY.ahk" { GNSS_FIXDATA_ACCURACY }
#Import ".\GNSS_NI_PLANE_TYPE.ahk" { GNSS_NI_PLANE_TYPE }
#Import ".\GNSS_SUPL_NI_INFO.ahk" { GNSS_SUPL_NI_INFO }
#Import ".\GNSS_AGNSS_REQUEST_TYPE.ahk" { GNSS_AGNSS_REQUEST_TYPE }
#Import "..\..\Foundation\FILETIME.ahk" { FILETIME }
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }
#Import "..\..\Foundation\CHAR.ahk" { CHAR }

/**
 * @namespace Windows.Win32.Devices.Geolocation
 */
export default struct GNSS_EVENT {
    #StructPack 8

    Size : UInt32

    Version : UInt32

    EventType : GNSS_EVENT_TYPE

    EventDataSize : UInt32

    Unused : Int8[512]

    FixData : GNSS_FIXDATA

    static __New() {
        DefineProp(this.Prototype, 'AgnssRequest', { type: GNSS_AGNSS_REQUEST_PARAM, offset: 528 })
        DefineProp(this.Prototype, 'NiRequest', { type: GNSS_NI_REQUEST_PARAM, offset: 528 })
        DefineProp(this.Prototype, 'ErrorInformation', { type: GNSS_ERRORINFO, offset: 528 })
        DefineProp(this.Prototype, 'NmeaData', { type: GNSS_NMEA_DATA, offset: 528 })
        DefineProp(this.Prototype, 'GeofenceAlertData', { type: GNSS_GEOFENCE_ALERT_DATA, offset: 528 })
        DefineProp(this.Prototype, 'BreadcrumbAlertData', { type: GNSS_BREADCRUMBING_ALERT_DATA, offset: 528 })
        DefineProp(this.Prototype, 'GeofencesTrackingStatus', { type: GNSS_GEOFENCES_TRACKINGSTATUS_DATA, offset: 528 })
        DefineProp(this.Prototype, 'DriverRequestData', { type: GNSS_DRIVER_REQUEST_DATA, offset: 528 })
        DefineProp(this.Prototype, 'CustomData', { type: Int8[1], offset: 528 })
        this.DeleteProp("__New")
    }
}
