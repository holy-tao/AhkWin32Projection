#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }
#Import "..\..\Foundation\CHAR.ahk" { CHAR }

/**
 * @namespace Windows.Win32.Devices.Geolocation
 */
export default struct GNSS_SUPL_NI_INFO {
    #StructPack 4

    Size : UInt32

    Version : UInt32

    RequestorId : WCHAR[260]

    ClientName : WCHAR[260]

    SuplNiUrl : CHAR[260]

}
