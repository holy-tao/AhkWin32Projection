#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\RCVALL_VALUE.ahk" { RCVALL_VALUE }

/**
 * @namespace Windows.Win32.Networking.WinSock
 */
export default struct RCVALL_IF {
    #StructPack 4

    Mode : RCVALL_VALUE

    Interface : UInt32

}
