#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\SOCKET.ahk" { SOCKET }
#Import ".\WSAPOLL_EVENT_FLAGS.ahk" { WSAPOLL_EVENT_FLAGS }
#Import ".\WSAPOLLFD.ahk" { WSAPOLLFD }

/**
 * @namespace Windows.Win32.Networking.WinSock
 */
export default struct WSAPOLLDATA {
    #StructPack 8

    result : Int32

    fds : UInt32

    timeout : Int32

    fdArray : WSAPOLLFD[1]

}
