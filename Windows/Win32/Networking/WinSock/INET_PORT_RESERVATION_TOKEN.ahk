#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains a port reservation token for a block of TCP or UDP ports.
 * @remarks
 * The  <b>INET_PORT_RESERVATION_TOKEN</b> structure is supported on Windows Vista and later.
  * 
  * The  <b>INET_PORT_RESERVATION_TOKEN</b> structure is used by the <a href="https://docs.microsoft.com/windows/win32/winsock/sio-acquire-port-reservation">SIO_ACQUIRE_PORT_RESERVATION</a> , <a href="https://docs.microsoft.com/windows/win32/winsock/sio-associate-port-reservation">SIO_ASSOCIATE_PORT_RESERVATION</a>, and <a href="https://docs.microsoft.com/windows/win32/winsock/sio-release-port-reservation">SIO_RELEASE_PORT_RESERVATION</a> Ioctl for TCP or UDP port reservations.  The <b>INET_PORT_RESERVATION_TOKEN</b> structure is also equivalent to the ULONG64 Token parameter used by the <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-createpersistenttcpportreservation">CreatePersistentTcpPortReservation</a>, <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-createpersistentudpportreservation">CreatePersistentUdpPortReservation</a>, <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-deletepersistenttcpportreservation">DeletePersistentTcpPortReservation</a>, <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-deletepersistentudpportreservation">DeletePersistentUdpPortReservation</a>, <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-lookuppersistenttcpportreservation">LookupPersistentTcpPortReservation</a>, and <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-lookuppersistentudpportreservation">LookupPersistentUdpPortReservation</a> functions in IP Helper.
 * @see https://learn.microsoft.com/windows/win32/api/mstcpip/ns-mstcpip-inet_port_reservation_token
 * @namespace Windows.Win32.Networking.WinSock
 * @version v4.0.30319
 */
class INET_PORT_RESERVATION_TOKEN extends Win32Struct
{
    static sizeof => 8

    static packingSize => 8

    /**
     * A port reservation token for a block of TCP or UDP ports.
     * @type {Integer}
     */
    Token {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }
}
