#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\CHAR.ahk" { CHAR }

/**
 * @namespace Windows.Win32.Devices.Geolocation
 */
export default struct GNSS_NMEA_DATA {
    #StructPack 4

    Size : UInt32

    Version : UInt32

    NmeaSentences : CHAR[256]

}
