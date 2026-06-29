#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\FILETIME.ahk" { FILETIME }
#Import ".\GNSS_BREADCRUMB_V1.ahk" { GNSS_BREADCRUMB_V1 }

/**
 * @namespace Windows.Win32.Devices.Geolocation
 */
export default struct GNSS_BREADCRUMB_LIST {
    #StructPack 8

    Size : UInt32

    Version : UInt32

    NumCrumbs : UInt32

    v1 : GNSS_BREADCRUMB_V1[50]

}
