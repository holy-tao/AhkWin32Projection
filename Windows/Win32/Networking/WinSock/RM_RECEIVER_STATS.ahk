#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Provides statistical information for a Reliable Multicast receiver session. This structure is used with the RM_RECEIVER_STATISTICS socket option.
 * @see https://docs.microsoft.com/windows/win32/api//wsrm/ns-wsrm-rm_receiver_stats
 * @namespace Windows.Win32.Networking.WinSock
 * @version v4.0.30319
 */
class RM_RECEIVER_STATS extends Win32Struct
{
    static sizeof => 144

    static packingSize => 8

    /**
     * Type: <b>ULONGULONG</b>
     * 
     * The number of original data (ODATA) sequences received.
     * @type {Integer}
     */
    NumODataPacketsReceived {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b>ULONGULONG</b>
     * 
     * The number of repair data (RDATA) sequences received.
     * @type {Integer}
     */
    NumRDataPacketsReceived {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Type: <b>ULONGULONG</b>
     * 
     * The number of duplicate sequences received.
     * @type {Integer}
     */
    NumDuplicateDataPackets {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Type: <b>ULONGULONG</b>
     * 
     * The number of data bytes  received.
     * @type {Integer}
     */
    DataBytesReceived {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * Type: <b>ULONGULONG</b>
     * 
     * The total bytes  received, consisting of source path message (SPM), original data (ODATA) and repair data (RDATA) sequences.
     * @type {Integer}
     */
    TotalBytesReceived {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * Type: <b>ULONGULONG</b>
     * 
     * An internally calculated receive rate from the beginning of the session, in kilobits per second.
     * @type {Integer}
     */
    RateKBitsPerSecOverall {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * Type: <b>ULONGULONG</b>
     * 
     * The receive rate for the period specified by INTERNAL_RATE_CALCULATION_FREQUENCY.
     * @type {Integer}
     */
    RateKBitsPerSecLast {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * Type: <b>ULONGULONG</b>
     * 
     * The oldest sequence identifier in the receive window.
     * @type {Integer}
     */
    TrailingEdgeSeqId {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }

    /**
     * Type: <b>ULONGULONG</b>
     * 
     * The newest sequence identifier in the receive window.
     * @type {Integer}
     */
    LeadingEdgeSeqId {
        get => NumGet(this, 64, "uint")
        set => NumPut("uint", value, this, 64)
    }

    /**
     * Type: <b>ULONGULONG</b>
     * 
     * The average number of sequences in the receive window.
     * @type {Integer}
     */
    AverageSequencesInWindow {
        get => NumGet(this, 72, "uint")
        set => NumPut("uint", value, this, 72)
    }

    /**
     * Type: <b>ULONGULONG</b>
     * 
     * The minimum number of sequences in the receive window.
     * @type {Integer}
     */
    MinSequencesInWindow {
        get => NumGet(this, 80, "uint")
        set => NumPut("uint", value, this, 80)
    }

    /**
     * Type: <b>ULONGULONG</b>
     * 
     * The maximum number of sequences in the receive window.
     * @type {Integer}
     */
    MaxSequencesInWindow {
        get => NumGet(this, 88, "uint")
        set => NumPut("uint", value, this, 88)
    }

    /**
     * Type: <b>ULONGULONG</b>
     * 
     * The sequence number for the first outstanding negative acknowledgment (NAK).
     * @type {Integer}
     */
    FirstNakSequenceNumber {
        get => NumGet(this, 96, "uint")
        set => NumPut("uint", value, this, 96)
    }

    /**
     * Type: <b>ULONGULONG</b>
     * 
     * The number of sequences awaiting a NAK confirmation.
     * @type {Integer}
     */
    NumPendingNaks {
        get => NumGet(this, 104, "uint")
        set => NumPut("uint", value, this, 104)
    }

    /**
     * Type: <b>ULONGULONG</b>
     * 
     * The number of sequences awaiting repair data (RDATA).
     * @type {Integer}
     */
    NumOutstandingNaks {
        get => NumGet(this, 112, "uint")
        set => NumPut("uint", value, this, 112)
    }

    /**
     * Type: <b>ULONGULONG</b>
     * 
     * The number of packets currently buffered.
     * @type {Integer}
     */
    NumDataPacketsBuffered {
        get => NumGet(this, 120, "uint")
        set => NumPut("uint", value, this, 120)
    }

    /**
     * Type: <b>ULONGULONG</b>
     * 
     * The number of selective NAKs sent this session.
     * @type {Integer}
     */
    TotalSelectiveNaksSent {
        get => NumGet(this, 128, "uint")
        set => NumPut("uint", value, this, 128)
    }

    /**
     * Type: <b>ULONGULONG</b>
     * 
     * The number of parity NAKs sent this session.
     * @type {Integer}
     */
    TotalParityNaksSent {
        get => NumGet(this, 136, "uint")
        set => NumPut("uint", value, this, 136)
    }
}
