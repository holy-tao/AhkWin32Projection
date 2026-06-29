#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\NTSTATUS.ahk" { NTSTATUS }
#Import ".\GNSS_FIXDATA_ACCURACY.ahk" { GNSS_FIXDATA_ACCURACY }
#Import "..\..\Foundation\FILETIME.ahk" { FILETIME }
#Import ".\GNSS_FIXDATA_SATELLITE.ahk" { GNSS_FIXDATA_SATELLITE }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\GNSS_SATELLITEINFO.ahk" { GNSS_SATELLITEINFO }
#Import ".\GNSS_FIXDATA_BASIC.ahk" { GNSS_FIXDATA_BASIC }

/**
 * @namespace Windows.Win32.Devices.Geolocation
 */
export default struct GNSS_FIXDATA {
    #StructPack 8

    Size : UInt32

    Version : UInt32

    FixSessionID : UInt32

    FixTimeStamp : FILETIME

    IsFinalFix : BOOL

    FixStatus : NTSTATUS

    FixLevelOfDetails : UInt32

    BasicData : GNSS_FIXDATA_BASIC

    AccuracyData : GNSS_FIXDATA_ACCURACY

    SatelliteData : GNSS_FIXDATA_SATELLITE

}
