#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Provides statistical information for a Reliable Multicast receiver session. This structure is used with the RM_RECEIVER_STATISTICS socket option.
 * @see https://learn.microsoft.com/windows/win32/api/wsrm/ns-wsrm-rm_receiver_stats
 * @namespace Windows.Win32.Networking.WinSock
 */
export default struct RM_RECEIVER_STATS {
    #StructPack 8

    /**
     * Type: <b>ULONGULONG</b>
     * 
     * The number of original data (ODATA) sequences received.
     */
    NumODataPacketsReceived : Int64

    /**
     * Type: <b>ULONGULONG</b>
     * 
     * The number of repair data (RDATA) sequences received.
     */
    NumRDataPacketsReceived : Int64

    /**
     * Type: <b>ULONGULONG</b>
     * 
     * The number of duplicate sequences received.
     */
    NumDuplicateDataPackets : Int64

    /**
     * Type: <b>ULONGULONG</b>
     * 
     * The number of data bytes  received.
     */
    DataBytesReceived : Int64

    /**
     * Type: <b>ULONGULONG</b>
     * 
     * The total bytes  received, consisting of source path message (SPM), original data (ODATA) and repair data (RDATA) sequences.
     */
    TotalBytesReceived : Int64

    /**
     * Type: <b>ULONGULONG</b>
     * 
     * An internally calculated receive rate from the beginning of the session, in kilobits per second.
     */
    RateKBitsPerSecOverall : Int64

    /**
     * Type: <b>ULONGULONG</b>
     * 
     * The receive rate for the period specified by INTERNAL_RATE_CALCULATION_FREQUENCY.
     */
    RateKBitsPerSecLast : Int64

    /**
     * Type: <b>ULONGULONG</b>
     * 
     * The oldest sequence identifier in the receive window.
     */
    TrailingEdgeSeqId : Int64

    /**
     * Type: <b>ULONGULONG</b>
     * 
     * The newest sequence identifier in the receive window.
     */
    LeadingEdgeSeqId : Int64

    /**
     * Type: <b>ULONGULONG</b>
     * 
     * The average number of sequences in the receive window.
     */
    AverageSequencesInWindow : Int64

    /**
     * Type: <b>ULONGULONG</b>
     * 
     * The minimum number of sequences in the receive window.
     */
    MinSequencesInWindow : Int64

    /**
     * Type: <b>ULONGULONG</b>
     * 
     * The maximum number of sequences in the receive window.
     */
    MaxSequencesInWindow : Int64

    /**
     * Type: <b>ULONGULONG</b>
     * 
     * The sequence number for the first outstanding negative acknowledgment (NAK).
     */
    FirstNakSequenceNumber : Int64

    /**
     * Type: <b>ULONGULONG</b>
     * 
     * The number of sequences awaiting a NAK confirmation.
     */
    NumPendingNaks : Int64

    /**
     * Type: <b>ULONGULONG</b>
     * 
     * The number of sequences awaiting repair data (RDATA).
     */
    NumOutstandingNaks : Int64

    /**
     * Type: <b>ULONGULONG</b>
     * 
     * The number of packets currently buffered.
     */
    NumDataPacketsBuffered : Int64

    /**
     * Type: <b>ULONGULONG</b>
     * 
     * The number of selective NAKs sent this session.
     */
    TotalSelectiveNaksSent : Int64

    /**
     * Type: <b>ULONGULONG</b>
     * 
     * The number of parity NAKs sent this session.
     */
    TotalParityNaksSent : Int64

}
