#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\CHAR.ahk" { CHAR }

/**
 * @namespace Windows.Win32.NetworkManagement.Rras
 * @charset ANSI
 */
export default struct RASDEVINFOA {
    #StructPack 4

    dwSize : UInt32

    szDeviceType : CHAR[17]

    szDeviceName : CHAR[129]

}
