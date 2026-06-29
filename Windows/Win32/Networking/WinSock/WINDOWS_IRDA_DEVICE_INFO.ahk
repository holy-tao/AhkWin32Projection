#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\CHAR.ahk" { CHAR }

/**
 * @namespace Windows.Win32.Networking.WinSock
 */
export default struct WINDOWS_IRDA_DEVICE_INFO {
    #StructPack 2

    irdaDeviceID : Int8[4]

    irdaDeviceName : CHAR[22]

    irdaDeviceHints1 : Int8

    irdaDeviceHints2 : Int8

    irdaCharSet : Int8

}
