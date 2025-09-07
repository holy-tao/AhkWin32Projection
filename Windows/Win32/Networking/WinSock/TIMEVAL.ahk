#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The TIMEVAL (winsock.h) structure is used to specify a time interval. It is associated with the Berkeley Software Distribution (BSD) Time.h header file.
 * @remarks
 * The <b>timeval</b> structure is used in Windows Sockets by the <a href="https://docs.microsoft.com/windows/desktop/api/winsock2/nf-winsock2-select">select</a> function to specify the maximum time the function can take to complete. The time interval is a combination of the values in <b>tv_sec</b> and <b>tv_usec</b> members.
  * 
  * Several functions are added on Windows Vista and later that use the  <b>timeval</b> structure. These functions include <a href="https://docs.microsoft.com/windows/desktop/api/ws2tcpip/nf-ws2tcpip-getaddrinfoexa">GetAddrInfoEx</a>, <a href="https://docs.microsoft.com/windows/desktop/api/ws2tcpip/nf-ws2tcpip-setaddrinfoexa">SetAddrInfoEx</a>, <a href="https://docs.microsoft.com/windows/desktop/api/winsock2/nf-winsock2-wsaconnectbylist">WSAConnectByList</a>, and <a href="https://docs.microsoft.com/windows/desktop/api/winsock2/nf-winsock2-wsaconnectbynamea">WSAConnectByName</a>.
 * @see https://learn.microsoft.com/windows/win32/api/winsock/ns-winsock-timeval
 * @namespace Windows.Win32.Networking.WinSock
 * @version v4.0.30319
 */
class TIMEVAL extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * Time interval, in seconds.
     * @type {Integer}
     */
    tv_sec {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * Time interval, in microseconds. This value is used in combination with the <b>tv_sec</b> member to represent time interval values  that are not a multiple of seconds.
     * @type {Integer}
     */
    tv_usec {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }
}
