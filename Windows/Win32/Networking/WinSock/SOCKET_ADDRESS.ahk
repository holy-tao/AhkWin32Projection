#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * SOCKET_ADDRESS structure stores protocol-specific address information.
 * @remarks
 * 
  * The <a href="https://docs.microsoft.com/windows/desktop/WinSock/sockaddr-2">SOCKADDR</a> structure pointed to by the <b>lpSockaddr</b> member varies depending on the protocol or address family selected. For example, the <b>sockaddr_in6</b> structure is used for an IPv6 socket address while the <b>sockaddr_in4</b> structure is used for an IPv4 socket address. The address family is the first member of all of the <b>SOCKADDR</b> structures. The address family is used to determine which structure is used. 
  * 
  * On the Microsoft Windows Software Development Kit (SDK) released for Windows Vista and later, the organization of header files has changed and the <b>SOCKET_ADDRESS</b> structure is defined in the <i>Ws2def.h</i> header file. Note that the <i>Ws2def.h</i> header file is automatically included in <i>Winsock2.h</i>, and should never be used directly.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//ws2def/ns-ws2def-socket_address
 * @namespace Windows.Win32.Networking.WinSock
 * @version v4.0.30319
 */
class SOCKET_ADDRESS extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * A pointer to a socket address  represented as a <a href="https://docs.microsoft.com/windows/desktop/WinSock/sockaddr-2">SOCKADDR</a> structure.
     * @type {Pointer<SOCKADDR>}
     */
    lpSockaddr {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * The length, in bytes, of the socket address.
     * @type {Integer}
     */
    iSockaddrLength {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }
}
