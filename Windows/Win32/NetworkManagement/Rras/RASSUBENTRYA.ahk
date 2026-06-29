#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\CHAR.ahk" { CHAR }

/**
 * @namespace Windows.Win32.NetworkManagement.Rras
 * @charset ANSI
 */
export default struct RASSUBENTRYA {
    #StructPack 4

    dwSize : UInt32

    dwfFlags : UInt32

    szDeviceType : CHAR[17]

    szDeviceName : CHAR[129]

    szLocalPhoneNumber : CHAR[129]

    dwAlternateOffset : UInt32

}
