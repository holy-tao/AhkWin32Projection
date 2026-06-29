#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\CHAR.ahk" { CHAR }

/**
 * @namespace Windows.Win32.Networking.WinSock
 */
export default struct WCE_IRDA_DEVICE_INFO {
    #StructPack 2

    irdaDeviceID : Int8[4]

    irdaDeviceName : CHAR[22]

    Reserved : Int8[2]

}
