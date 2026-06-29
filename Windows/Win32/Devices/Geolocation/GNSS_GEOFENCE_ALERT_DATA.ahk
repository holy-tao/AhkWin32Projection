#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\GNSS_GEOFENCE_STATE.ahk" { GNSS_GEOFENCE_STATE }
#Import ".\GNSS_FIXDATA_ACCURACY.ahk" { GNSS_FIXDATA_ACCURACY }
#Import ".\GNSS_FIXDATA_BASIC.ahk" { GNSS_FIXDATA_BASIC }

/**
 * @namespace Windows.Win32.Devices.Geolocation
 */
export default struct GNSS_GEOFENCE_ALERT_DATA {
    #StructPack 8

    Size : UInt32

    Version : UInt32

    GeofenceID : UInt32

    GeofenceState : GNSS_GEOFENCE_STATE

    FixBasicData : GNSS_FIXDATA_BASIC

    FixAccuracyData : GNSS_FIXDATA_ACCURACY

    Unused : Int8[512]

}
