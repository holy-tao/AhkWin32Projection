#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\GNSS_SATELLITEINFO.ahk" { GNSS_SATELLITEINFO }

/**
 * @namespace Windows.Win32.Devices.Geolocation
 */
export default struct GNSS_FIXDATA_SATELLITE {
    #StructPack 8

    Size : UInt32

    Version : UInt32

    SatelliteCount : UInt32

    SatelliteArray : GNSS_SATELLITEINFO[64]

}
