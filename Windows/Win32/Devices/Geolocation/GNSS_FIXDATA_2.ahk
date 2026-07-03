#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\GNSS_FIXDATA_ACCURACY_2.ahk" { GNSS_FIXDATA_ACCURACY_2 }
#Import ".\GNSS_FIXDATA_BASIC_2.ahk" { GNSS_FIXDATA_BASIC_2 }
#Import ".\GNSS_FIXDATA_SATELLITE.ahk" { GNSS_FIXDATA_SATELLITE }
#Import ".\GNSS_SATELLITEINFO.ahk" { GNSS_SATELLITEINFO }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Foundation\FILETIME.ahk" { FILETIME }
#Import "..\..\Foundation\NTSTATUS.ahk" { NTSTATUS }

/**
 * @namespace Windows.Win32.Devices.Geolocation
 */
export default struct GNSS_FIXDATA_2 {
    #StructPack 8

    Size : UInt32

    Version : UInt32

    FixSessionID : UInt32

    FixTimeStamp : FILETIME

    IsFinalFix : BOOL

    FixStatus : NTSTATUS

    FixLevelOfDetails : UInt32

    BasicData : GNSS_FIXDATA_BASIC_2

    AccuracyData : GNSS_FIXDATA_ACCURACY_2

    SatelliteData : GNSS_FIXDATA_SATELLITE

}
