#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\GNSS_NI_PLANE_TYPE.ahk" { GNSS_NI_PLANE_TYPE }
#Import ".\GNSS_NI_REQUEST_TYPE.ahk" { GNSS_NI_REQUEST_TYPE }
#Import ".\GNSS_V2UPL_NI_INFO.ahk" { GNSS_V2UPL_NI_INFO }
#Import ".\GNSS_SUPL_NI_INFO.ahk" { GNSS_SUPL_NI_INFO }
#Import ".\GNSS_CP_NI_INFO.ahk" { GNSS_CP_NI_INFO }
#Import ".\GNSS_NI_NOTIFICATION_TYPE.ahk" { GNSS_NI_NOTIFICATION_TYPE }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }
#Import "..\..\Foundation\CHAR.ahk" { CHAR }

/**
 * @namespace Windows.Win32.Devices.Geolocation
 */
export default struct GNSS_NI_REQUEST_PARAM {
    #StructPack 4

    Size : UInt32

    Version : UInt32

    RequestId : UInt32

    RequestType : GNSS_NI_REQUEST_TYPE

    NotificationType : GNSS_NI_NOTIFICATION_TYPE

    RequestPlaneType : GNSS_NI_PLANE_TYPE

    SuplNiInfo : GNSS_SUPL_NI_INFO

    ResponseTimeInSec : UInt32

    EmergencyLocation : BOOL

    static __New() {
        DefineProp(this.Prototype, 'CpNiInfo', { type: GNSS_CP_NI_INFO, offset: 24 })
        DefineProp(this.Prototype, 'V2UplNiInfo', { type: GNSS_V2UPL_NI_INFO, offset: 24 })
        this.DeleteProp("__New")
    }
}
