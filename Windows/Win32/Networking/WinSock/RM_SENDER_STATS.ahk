#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Provides statistical information for a Reliable Multicast sender session. This structure is used with the RM_SENDER_STATISTICS socket option.
 * @see https://learn.microsoft.com/windows/win32/api/wsrm/ns-wsrm-rm_sender_stats
 * @namespace Windows.Win32.Networking.WinSock
 * @version v4.0.30319
 */
class RM_SENDER_STATS extends Win32Struct
{
    static sizeof => 104

    static packingSize => 8

    /**
     * Type: <b>ULONGULONG</b>
     * 
     * Number of client data bytes sent out.
     * @type {Integer}
     */
    DataBytesSent {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b>ULONGULONG</b>
     * 
     * Total bytes  sent, consisting of source path message (SPM), original data (ODATA) and repair data (RDATA) sequences.
     * @type {Integer}
     */
    TotalBytesSent {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Type: <b>ULONGULONG</b>
     * 
     * Number of NAKs received.
     * @type {Integer}
     */
    NaksReceived {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Type: <b>ULONGULONG</b>
     * 
     * Number of NAKs received after the send window advanced beyond the NAK'ed sequence.
     * @type {Integer}
     */
    NaksReceivedTooLate {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * Type: <b>ULONGULONG</b>
     * 
     * Number of NAKs for which responses have not been sent.
     * @type {Integer}
     */
    NumOutstandingNaks {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * Type: <b>ULONGULONG</b>
     * 
     * Number of NAKs after repair data (RDATA) sequences were sent for which responses have not been sent.
     * @type {Integer}
     */
    NumNaksAfterRData {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * Type: <b>ULONGULONG</b>
     * 
     * Number of repair data (RDATA) packets sent.
     * @type {Integer}
     */
    RepairPacketsSent {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * Type: <b>ULONGULONG</b>
     * 
     * Number of partial messages dropped.
     * @type {Integer}
     */
    BufferSpaceAvailable {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }

    /**
     * Type: <b>ULONGULONG</b>
     * 
     * Oldest sequence identifier in the send window.
     * @type {Integer}
     */
    TrailingEdgeSeqId {
        get => NumGet(this, 64, "uint")
        set => NumPut("uint", value, this, 64)
    }

    /**
     * Type: <b>ULONGULONG</b>
     * 
     * Newest sequence identifier in the send window.
     * @type {Integer}
     */
    LeadingEdgeSeqId {
        get => NumGet(this, 72, "uint")
        set => NumPut("uint", value, this, 72)
    }

    /**
     * Type: <b>ULONGULONG</b>
     * 
     * Internally calculated send rate from the beginning of the session, in kilobits per second.
     * @type {Integer}
     */
    RateKBitsPerSecOverall {
        get => NumGet(this, 80, "uint")
        set => NumPut("uint", value, this, 80)
    }

    /**
     * Type: <b>ULONGULONG</b>
     * 
     * Send rate for the period specified by INTERNAL_RATE_CALCULATION_FREQUENCY.
     * @type {Integer}
     */
    RateKBitsPerSecLast {
        get => NumGet(this, 88, "uint")
        set => NumPut("uint", value, this, 88)
    }

    /**
     * Type: <b>ULONGULONG</b>
     * 
     * Total original data (ODATA) packets sent.
     * @type {Integer}
     */
    TotalODataPacketsSent {
        get => NumGet(this, 96, "uint")
        set => NumPut("uint", value, this, 96)
    }
}
