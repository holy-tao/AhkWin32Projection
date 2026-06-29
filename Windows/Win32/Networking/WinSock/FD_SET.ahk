#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\SOCKET.ahk" { SOCKET }

/**
 * The FD_SET macro (winsock.h) structure is used by Windows Sockets (Winsock) functions and service providers to place sockets into a set.
 * @see https://learn.microsoft.com/windows/win32/api/winsock/nf-winsock-fd_set
 * @namespace Windows.Win32.Networking.WinSock
 */
export default struct FD_SET {
    #StructPack 8

    fd_count : UInt32

    fd_array : SOCKET[64]

}
