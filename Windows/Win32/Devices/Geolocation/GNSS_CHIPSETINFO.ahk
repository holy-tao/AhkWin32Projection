#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * @namespace Windows.Win32.Devices.Geolocation
 */
export default struct GNSS_CHIPSETINFO {
    #StructPack 4

    Size : UInt32

    Version : UInt32

    ManufacturerID : WCHAR[25]

    HardwareID : WCHAR[25]

    FirmwareVersion : WCHAR[20]

    Unused : Int8[512]

}
