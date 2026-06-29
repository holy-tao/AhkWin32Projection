#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The IPX_SPXCONNSTATUS_DATA structure provides information about a connected SPX socket.
 * @see https://learn.microsoft.com/windows/win32/api/wsnwlink/ns-wsnwlink-ipx_spxconnstatus_data
 * @namespace Windows.Win32.Networking.WinSock
 */
export default struct IPX_SPXCONNSTATUS_DATA {
    #StructPack 2

    /**
     * Specifies the connection state.
     */
    ConnectionState : Int8

    /**
     * Specifies whether watchdog capabilities are active.
     */
    WatchDogActive : Int8

    /**
     * Specifies the local connection ID.
     */
    LocalConnectionId : UInt16

    /**
     * Specifies the remote connection ID.
     */
    RemoteConnectionId : UInt16

    /**
     * Specifies the local sequence number.
     */
    LocalSequenceNumber : UInt16

    /**
     * Specifies the local acknowledgment (ACK) number.
     */
    LocalAckNumber : UInt16

    /**
     * Specifies the local allocation number.
     */
    LocalAllocNumber : UInt16

    /**
     * Specifies the remote acknowledgment (ACK) number.
     */
    RemoteAckNumber : UInt16

    /**
     * Specifies the remote allocation number.
     */
    RemoteAllocNumber : UInt16

    /**
     * Specifies the local socket.
     */
    LocalSocket : UInt16

    /**
     * Specifies the IPX address to which the local computer is attached.
     */
    ImmediateAddress : Int8[6]

    /**
     * Specifies the network to which the remote host is attached.
     */
    RemoteNetwork : Int8[4]

    /**
     * Specifies the remote node.
     */
    RemoteNode : Int8[6]

    /**
     * Specifies the remote socket.
     */
    RemoteSocket : UInt16

    /**
     * Specifies the number of retransmissions.
     */
    RetransmissionCount : UInt16

    /**
     * Specifies the estimated round trip–time, in milliseconds, delay for a given packet.
     */
    EstimatedRoundTripDelay : UInt16

    /**
     * Specifies the number of retransmitted packets on the socket.
     */
    RetransmittedPackets : UInt16

    /**
     * Specifies the number of suppressed packets on the socket.
     */
    SuppressedPacket : UInt16

}
