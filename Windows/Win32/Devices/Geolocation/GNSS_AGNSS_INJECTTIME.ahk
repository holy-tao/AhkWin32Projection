#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\FILETIME.ahk" { FILETIME }

/**
 * @namespace Windows.Win32.Devices.Geolocation
 */
export default struct GNSS_AGNSS_INJECTTIME {
    #StructPack 4

    Size : UInt32

    Version : UInt32

    UtcTime : FILETIME

    TimeUncertainty : UInt32

}
