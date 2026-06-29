#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\NTSTATUS.ahk" { NTSTATUS }

/**
 * @namespace Windows.Win32.Devices.Geolocation
 */
export default struct GNSS_GEOFENCE_CREATE_RESPONSE {
    #StructPack 4

    Size : UInt32

    Version : UInt32

    CreationStatus : NTSTATUS

    GeofenceID : UInt32

    Unused : Int8[512]

}
