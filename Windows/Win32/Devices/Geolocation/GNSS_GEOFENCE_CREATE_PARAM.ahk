#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\GNSS_GEOREGION.ahk" { GNSS_GEOREGION }
#Import ".\GNSS_GEOFENCE_STATE.ahk" { GNSS_GEOFENCE_STATE }
#Import ".\GNSS_GEOREGIONTYPE.ahk" { GNSS_GEOREGIONTYPE }
#Import ".\GNSS_GEOREGION_CIRCLE.ahk" { GNSS_GEOREGION_CIRCLE }

/**
 * @namespace Windows.Win32.Devices.Geolocation
 */
export default struct GNSS_GEOFENCE_CREATE_PARAM {
    #StructPack 8

    Size : UInt32

    Version : UInt32

    AlertTypes : UInt32

    InitialState : GNSS_GEOFENCE_STATE

    Boundary : GNSS_GEOREGION

    Unused : Int8[512]

}
