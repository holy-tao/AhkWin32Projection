#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\FILETIME.ahk" { FILETIME }
#Import "..\..\Foundation\NTSTATUS.ahk" { NTSTATUS }

/**
 * @namespace Windows.Win32.Devices.Geolocation
 */
export default struct GNSS_GEOFENCES_TRACKINGSTATUS_DATA {
    #StructPack 4

    Size : UInt32

    Version : UInt32

    Status : NTSTATUS

    StatusTimeStamp : FILETIME

    Unused : Int8[512]

}
