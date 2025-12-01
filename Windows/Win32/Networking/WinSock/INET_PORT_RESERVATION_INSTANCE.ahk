#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\INET_PORT_RANGE.ahk
#Include .\INET_PORT_RESERVATION_TOKEN.ahk

/**
 * Contains a port reservation and a token for a block of TCP or UDP ports.
 * @remarks
 * The  <b>INET_PORT_RESERVATION_INSTANCE</b> structure is supported on Windows Vista and later.
 * 
 * The  <b>INET_PORT_RESERVATION_INSTANCE</b> structure is returned by the <a href="https://docs.microsoft.com/windows/win32/winsock/sio-acquire-port-reservation">SIO_ACQUIRE_PORT_RESERVATION</a> IOCTL when acquiring a runtime reservation for a block of TCP or UDP ports.
 * @see https://learn.microsoft.com/windows/win32/api/mstcpip/ns-mstcpip-inet_port_reservation_instance
 * @namespace Windows.Win32.Networking.WinSock
 * @version v4.0.30319
 */
class INET_PORT_RESERVATION_INSTANCE extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * A runtime port reservation for a block of TCP or UDP ports.
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/mstcpip/ns-mstcpip-inet_port_range">INET_PORT_RESERVATION</a> structure is typedefed to the <a href="https://docs.microsoft.com/windows/desktop/api/mstcpip/ns-mstcpip-inet_port_range">INET_PORT_RANGE</a> structure.
     * @type {INET_PORT_RANGE}
     */
    Reservation{
        get {
            if(!this.HasProp("__Reservation"))
                this.__Reservation := INET_PORT_RANGE(0, this)
            return this.__Reservation
        }
    }

    /**
     * A port reservation token for a block of TCP or UDP ports.
     * @type {INET_PORT_RESERVATION_TOKEN}
     */
    Token{
        get {
            if(!this.HasProp("__Token"))
                this.__Token := INET_PORT_RESERVATION_TOKEN(8, this)
            return this.__Token
        }
    }
}
