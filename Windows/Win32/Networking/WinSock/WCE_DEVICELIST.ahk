#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WCE_IRDA_DEVICE_INFO.ahk" { WCE_IRDA_DEVICE_INFO }
#Import "..\..\Foundation\CHAR.ahk" { CHAR }

/**
 * @namespace Windows.Win32.Networking.WinSock
 */
export default struct WCE_DEVICELIST {
    #StructPack 4

    numDevice : UInt32

    Device : WCE_IRDA_DEVICE_INFO[1]

}
