#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies data used by the SIO_TCP_INITIAL_RTO IOCTL to configure initial re-transmission timeout (RTO) parameters to be used on the socket.
 * @remarks
 * The <a href="https://docs.microsoft.com/windows/desktop/api/mswsock/ns-mswsock-transmit_file_buffers">TCP_INITIAL_RTO_PARAMETERS</a> structure  allows an application to configure the initial round trip time (RTT) used to compute the retransmission timeout. The application can also configure the number of re-transmissions that will be attempted before the connection attempt fails. 
 * 
 * An application should supply the RTT of choice in milliseconds and the maximum number of retransmissions in this structure. The Windows TCP/IP stack will honor these parameters for the subsequent connection attempt. The retransmission behavior for TCP is documented in IETF RFC 793 and 2988.
 * 
 * An application may use the unspecified defines,  <b>TCP_INITIAL_RTO_UNSPECIFIED_RTT</b> and <b>TCP_INITIAL_RTO_UNSPECIFIED_MAX_SYN_RETRANSMISSIONS</b>  when supplying values for one of these fields. This allows the system to pick up administrator configured settings for the parameter left unspecified.
 * 
 * An application can choose system defaults for any of these fields and supply those values using the default defines, <b>TCP_INITIAL_RTO_DEFAULT_RTT</b> and <b>TCP_INITIAL_RTO_DEFAULT_MAX_SYN_RETRANSMISSIONS</b>.
 * @see https://learn.microsoft.com/windows/win32/api/mstcpip/ns-mstcpip-tcp_initial_rto_parameters
 * @namespace Windows.Win32.Networking.WinSock
 */
export default struct TCP_INITIAL_RTO_PARAMETERS {
    #StructPack 2

    /**
     * Supplies the initial RTT in milliseconds.
     */
    Rtt : UInt16

    /**
     * Supplies the number of retransmissions attempted before the connection
     *     setup fails.
     */
    MaxSynRetransmissions : Int8

}
