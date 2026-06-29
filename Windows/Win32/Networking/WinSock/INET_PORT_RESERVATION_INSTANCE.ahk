#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\INET_PORT_RESERVATION_TOKEN.ahk" { INET_PORT_RESERVATION_TOKEN }
#Import ".\INET_PORT_RANGE.ahk" { INET_PORT_RANGE }

/**
 * Contains a port reservation and a token for a block of TCP or UDP ports.
 * @remarks
 * The  <b>INET_PORT_RESERVATION_INSTANCE</b> structure is supported on Windows Vista and later.
 * 
 * The  <b>INET_PORT_RESERVATION_INSTANCE</b> structure is returned by the <a href="https://docs.microsoft.com/windows/win32/winsock/sio-acquire-port-reservation">SIO_ACQUIRE_PORT_RESERVATION</a> IOCTL when acquiring a runtime reservation for a block of TCP or UDP ports.
 * @see https://learn.microsoft.com/windows/win32/api/mstcpip/ns-mstcpip-inet_port_reservation_instance
 * @namespace Windows.Win32.Networking.WinSock
 */
export default struct INET_PORT_RESERVATION_INSTANCE {
    #StructPack 8

    /**
     * A runtime port reservation for a block of TCP or UDP ports.
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/mstcpip/ns-mstcpip-inet_port_range">INET_PORT_RESERVATION</a> structure is typedefed to the <a href="https://docs.microsoft.com/windows/desktop/api/mstcpip/ns-mstcpip-inet_port_range">INET_PORT_RANGE</a> structure.
     */
    Reservation : INET_PORT_RANGE

    /**
     * A port reservation token for a block of TCP or UDP ports.
     */
    Token : INET_PORT_RESERVATION_TOKEN

}
