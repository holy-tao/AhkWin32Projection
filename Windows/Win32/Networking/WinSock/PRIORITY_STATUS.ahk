#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\SOCKET_PRIORITY_HINT.ahk" { SOCKET_PRIORITY_HINT }

/**
 * @namespace Windows.Win32.Networking.WinSock
 */
export default struct PRIORITY_STATUS {
    #StructPack 4

    Sender : SOCKET_PRIORITY_HINT

    Receiver : SOCKET_PRIORITY_HINT

}
