#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\IN6_ADDR.ahk

/**
 * The in6_pktinfo structure is used to store received IPv6 packet address information, and is used by Windows to return information about received packets and also allows specifying the local IPv6 address to use for sending packets.
 * @remarks
 * If the <a href="https://docs.microsoft.com/windows/desktop/WinSock/ipv6-pktinfo">IPV6_PKTINFO</a> socket option is set on a socket of type <b>SOCK_DGRAM</b>  or <b>SOCK_RAW</b>, one of the control data objects returned by the <a href="https://docs.microsoft.com/windows/win32/api/mswsock/nc-mswsock-lpfn_wsarecvmsg">LPFN_WSARECVMSG (WSARecvMsg)</a> function will contain an 
 * <b>in6_pktinfo</b> structure used to store received packet address information.
 * 
 * On an IPv6  socket of type  <b>SOCK_DGRAM</b> or <b>SOCK_RAW</b>, an application can specific  the local IP source address to use for sending with the <a href="https://docs.microsoft.com/windows/desktop/api/winsock2/nf-winsock2-wsasendmsg">WSASendMsg</a> function. One of the control data objects passed in the <a href="https://docs.microsoft.com/windows/desktop/api/ws2def/ns-ws2def-wsamsg">WSAMSG</a> structure to the <b>WSASendMsg</b> function may contain an 
 * <b>in6_pktinfo</b> structure used to specify the local IPv6 address to use for sending.
 * 
 * On the Microsoft Windows Software Development Kit (SDK) released for Windows Vista and later, the organization of header files has changed and the <b>in6_pktinfo</b> structure is defined in the <i>Ws2ipdef.h</i> header file which is automatically included in the <i>Ws2tcpip.h</i> header file. The <i>Ws2ipdef.h</i>  header files should never be used directly.
 * @see https://learn.microsoft.com/windows/win32/api/ws2ipdef/ns-ws2ipdef-in6_pktinfo
 * @namespace Windows.Win32.Networking.WinSock
 * @version v4.0.30319
 */
class IN6_PKTINFO extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * The destination IPv6 address from the IP header of the received packet when used with the <a href="https://docs.microsoft.com/windows/win32/api/mswsock/nc-mswsock-lpfn_wsarecvmsg">LPFN_WSARECVMSG (WSARecvMsg)</a> function. The local source IPv6 address to set in the IP header when used with the <a href="https://docs.microsoft.com/windows/desktop/api/winsock2/nf-winsock2-wsasendmsg">WSASendMsg</a> function.
     * @type {IN6_ADDR}
     */
    ipi6_addr{
        get {
            if(!this.HasProp("__ipi6_addr"))
                this.__ipi6_addr := IN6_ADDR(0, this)
            return this.__ipi6_addr
        }
    }

    /**
     * The interface on which the packet was received when used with the <a href="https://docs.microsoft.com/windows/win32/api/mswsock/nc-mswsock-lpfn_wsarecvmsg">LPFN_WSARECVMSG (WSARecvMsg)</a> function. The interface on which the packet should be sent  when used with the <a href="https://docs.microsoft.com/windows/desktop/api/winsock2/nf-winsock2-wsasendmsg">WSASendMsg</a> function.
     * @type {Integer}
     */
    ipi6_ifindex {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }
}
