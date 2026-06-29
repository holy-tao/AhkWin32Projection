#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WINDOWS_IRDA_DEVICE_INFO.ahk" { WINDOWS_IRDA_DEVICE_INFO }
#Import "..\..\Foundation\CHAR.ahk" { CHAR }

/**
 * @namespace Windows.Win32.Networking.WinSock
 */
export default struct WINDOWS_DEVICELIST {
    #StructPack 4

    numDevice : UInt32

    Device : WINDOWS_IRDA_DEVICE_INFO[1]

}
