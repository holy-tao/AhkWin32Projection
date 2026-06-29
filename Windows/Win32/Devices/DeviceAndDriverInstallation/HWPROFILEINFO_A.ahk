#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\CHAR.ahk" { CHAR }

/**
 * @namespace Windows.Win32.Devices.DeviceAndDriverInstallation
 * @charset ANSI
 */
export default struct HWPROFILEINFO_A {
    #StructPack 4

    HWPI_ulHWProfile : UInt32

    HWPI_szFriendlyName : CHAR[80]

    HWPI_dwFlags : UInt32

}
