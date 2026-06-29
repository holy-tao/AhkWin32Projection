#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * @namespace Windows.Win32.Devices.DeviceAndDriverInstallation
 * @charset Unicode
 */
export default struct HWPROFILEINFO_W {
    #StructPack 4

    HWPI_ulHWProfile : UInt32

    HWPI_szFriendlyName : WCHAR[80]

    HWPI_dwFlags : UInt32

}
