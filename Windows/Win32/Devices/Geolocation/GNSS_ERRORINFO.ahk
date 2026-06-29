#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * @namespace Windows.Win32.Devices.Geolocation
 */
export default struct GNSS_ERRORINFO {
    #StructPack 4

    Size : UInt32

    Version : UInt32

    ErrorCode : UInt32

    IsRecoverable : BOOL

    ErrorDescription : WCHAR[256]

    Unused : Int8[512]

}
