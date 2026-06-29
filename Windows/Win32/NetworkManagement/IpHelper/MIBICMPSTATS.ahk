#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains statistics for either incoming or outgoing Internet Control Message Protocol (ICMP) messages on a particular computer.
 * @remarks
 * Two 
 * <b>MIBICMPSTATS</b> structures are required to hold all the ICMP statistics for a given computer. One 
 * <b>MIBICMPSTATS</b> structure contains the statistics for incoming ICMP messages. The other contains the statistics for outgoing ICMP messages. For this reason, the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ipmib/ns-ipmib-mibicmpinfo">MIBICMPINFO</a> structure contains two 
 * <b>MIBICMPSTATS</b> structures.
 * 
 * On the Microsoft Windows Software Development Kit (SDK) released for Windows Vista and later, the organization of header files has changed and the <b>MIBICMPSTATS</b> structure is defined in the <i>Ipmib.h</i> header file not in the <i>Iprtrmib.h</i> header file. Note that the <i>Ipmib.h</i> header file is automatically included in <i>Iprtrmib.h</i> which is automatically included in the <i>Iphlpapi.h</i> header file. The  <i>Ipmib.h</i> and <i>Iprtrmib.h</i> header files should never be used directly.
 * @see https://learn.microsoft.com/windows/win32/api/ipmib/ns-ipmib-mibicmpstats
 * @namespace Windows.Win32.NetworkManagement.IpHelper
 */
export default struct MIBICMPSTATS {
    #StructPack 4

    /**
     * Type: <b>DWORD</b>
     * 
     * The number of messages received or sent.
     */
    dwMsgs : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * The number of errors received or sent.
     */
    dwErrors : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * The number of destination-unreachable messages received or sent. A destination-unreachable message is sent to the originating computer when a datagram fails to reach its intended destination.
     */
    dwDestUnreachs : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * The number of time-to-live (TTL) exceeded messages received or sent. A time-to-live exceeded message is sent to the originating computer when a datagram is discarded because the number of routers it has passed through exceeds its time-to-live value.
     */
    dwTimeExcds : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * The number of parameter-problem messages received or sent. A parameter-problem message is sent to the originating computer when a router or host detects an error in a datagram's IP header.
     */
    dwParmProbs : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * The number of source quench messages received or sent. A source quench request is sent to a computer to request that it reduce its rate of packet transmission.
     */
    dwSrcQuenchs : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * The number of redirect messages received or sent. A redirect message is sent to the originating computer when a better route is discovered for a datagram sent by that computer.
     */
    dwRedirects : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * The number of echo requests received or sent. An echo request causes the receiving computer to send an echo reply message back to the originating computer.
     */
    dwEchos : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * The number of echo replies received or sent. A computer sends an echo reply in response to receiving an echo request message.
     */
    dwEchoReps : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * The number of time-stamp requests received or sent. A time-stamp request causes the receiving computer to send a time-stamp reply back to the originating computer.
     */
    dwTimestamps : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * The number of time-stamp replies received or sent. A computer sends a time-stamp reply in response to receiving a time-stamp request. Routers can use time-stamp requests and replies to measure the transmission speed of datagrams on a network.
     */
    dwTimestampReps : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * The number of address mask requests received or sent. A computer sends an address mask request to determine the number of bits in the subnet mask for its local subnet.
     */
    dwAddrMasks : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * The number of address mask responses received or sent. A computer sends an address mask response in response to an address mask request.
     */
    dwAddrMaskReps : UInt32

}
