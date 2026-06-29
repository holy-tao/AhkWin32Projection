#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Provides input data used by the SIO_ACQUIRE_PORT_RESERVATION IOCTL to acquire a runtime reservation for a block of TCP or UDP ports.
 * @remarks
 * The  <b>INET_PORT_RANGE</b> structure is supported on Windows Vista and later.
 * 
 * The 
 * <b>INET_PORT_RANGE</b> structure is the datatype passed in the input buffer to the <a href="https://docs.microsoft.com/windows/win32/winsock/sio-acquire-port-reservation">SIO_ACQUIRE_PORT_RESERVATION</a> IOCTL. This IOCTL is used to acquire a runtime reservation for a block of TCP or UDP ports.  
 * 
 * The 
 * <b>INET_PORT_RANGE</b> structure is typedefed to the <b>INET_PORT_RESERVATION</b> structure.
 * @see https://learn.microsoft.com/windows/win32/api/mstcpip/ns-mstcpip-inet_port_range
 * @namespace Windows.Win32.Networking.WinSock
 */
export default struct INET_PORT_RANGE {
    #StructPack 2

    /**
     * The starting TCP or UDP port number. If this parameter is set to zero, the system will choose a starting TCP or UDP port number.
     */
    StartPort : UInt16

    /**
     * The number of TCP or UDP port numbers to reserve.
     */
    NumberOfPorts : UInt16

}
