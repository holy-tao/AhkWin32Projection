#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\CHAR.ahk" { CHAR }

/**
 * @namespace Windows.Win32.Devices.Geolocation
 */
export default struct GNSS_SUPL_HSLP_CONFIG {
    #StructPack 4

    Size : UInt32

    Version : UInt32

    SuplHslp : CHAR[260]

    SuplHslpFromImsi : CHAR[260]

    Reserved : UInt32

    Unused : Int8[512]

}
