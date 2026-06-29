#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Provides statistical information for a Reliable Multicast sender session. This structure is used with the RM_SENDER_STATISTICS socket option.
 * @see https://learn.microsoft.com/windows/win32/api/wsrm/ns-wsrm-rm_sender_stats
 * @namespace Windows.Win32.Networking.WinSock
 */
export default struct RM_SENDER_STATS {
    #StructPack 8

    /**
     * Type: <b>ULONGULONG</b>
     * 
     * Number of client data bytes sent out.
     */
    DataBytesSent : Int64

    /**
     * Type: <b>ULONGULONG</b>
     * 
     * Total bytes  sent, consisting of source path message (SPM), original data (ODATA) and repair data (RDATA) sequences.
     */
    TotalBytesSent : Int64

    /**
     * Type: <b>ULONGULONG</b>
     * 
     * Number of NAKs received.
     */
    NaksReceived : Int64

    /**
     * Type: <b>ULONGULONG</b>
     * 
     * Number of NAKs received after the send window advanced beyond the NAK'ed sequence.
     */
    NaksReceivedTooLate : Int64

    /**
     * Type: <b>ULONGULONG</b>
     * 
     * Number of NAKs for which responses have not been sent.
     */
    NumOutstandingNaks : Int64

    /**
     * Type: <b>ULONGULONG</b>
     * 
     * Number of NAKs after repair data (RDATA) sequences were sent for which responses have not been sent.
     */
    NumNaksAfterRData : Int64

    /**
     * Type: <b>ULONGULONG</b>
     * 
     * Number of repair data (RDATA) packets sent.
     */
    RepairPacketsSent : Int64

    /**
     * Type: <b>ULONGULONG</b>
     * 
     * Number of partial messages dropped.
     */
    BufferSpaceAvailable : Int64

    /**
     * Type: <b>ULONGULONG</b>
     * 
     * Oldest sequence identifier in the send window.
     */
    TrailingEdgeSeqId : Int64

    /**
     * Type: <b>ULONGULONG</b>
     * 
     * Newest sequence identifier in the send window.
     */
    LeadingEdgeSeqId : Int64

    /**
     * Type: <b>ULONGULONG</b>
     * 
     * Internally calculated send rate from the beginning of the session, in kilobits per second.
     */
    RateKBitsPerSecOverall : Int64

    /**
     * Type: <b>ULONGULONG</b>
     * 
     * Send rate for the period specified by INTERNAL_RATE_CALCULATION_FREQUENCY.
     */
    RateKBitsPerSecLast : Int64

    /**
     * Type: <b>ULONGULONG</b>
     * 
     * Total original data (ODATA) packets sent.
     */
    TotalODataPacketsSent : Int64

}
