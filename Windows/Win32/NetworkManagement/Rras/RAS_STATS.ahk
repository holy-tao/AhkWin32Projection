#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The RAS_STATS structure stores the statistics for a single-link RAS connection, or for one of the links in a multilink RAS connection.
 * @see https://learn.microsoft.com/windows/win32/api/ras/ns-ras-ras_stats
 * @namespace Windows.Win32.NetworkManagement.Rras
 */
export default struct RAS_STATS {
    #StructPack 4

    /**
     * Specifies the version of the structure. Set this member to sizeof(<b>RAS_STATS</b>) before using the structure in a function call.
     */
    dwSize : UInt32

    /**
     * The number of bytes transmitted through this connection or link.
     */
    dwBytesXmited : UInt32

    /**
     * The number of bytes received through this connection or link.
     */
    dwBytesRcved : UInt32

    /**
     * The number frames transmitted through this connection or link.
     */
    dwFramesXmited : UInt32

    /**
     * The number of frames received through this connection or link.
     */
    dwFramesRcved : UInt32

    /**
     * The number of cyclic redundancy check (CRC) errors on this connection or link.
     */
    dwCrcErr : UInt32

    /**
     * The number of timeout errors on this connection or link.
     */
    dwTimeoutErr : UInt32

    /**
     * The number of alignment errors on this connection or link.
     */
    dwAlignmentErr : UInt32

    /**
     * The number of hardware overrun errors on this connection or link.
     */
    dwHardwareOverrunErr : UInt32

    /**
     * The number of framing errors on this connection or link.
     */
    dwFramingErr : UInt32

    /**
     * The number of buffer overrun errors on this connection or link.
     */
    dwBufferOverrunErr : UInt32

    /**
     * The compression ratio for the data being received on this connection or link.
     * 
     * <div class="alert"><b>Note</b>  This element is only valid for a single link connection or a single link in a multilink connection.</div>
     * <div> </div>
     */
    dwCompressionRatioIn : UInt32

    /**
     * The compression ratio for the data being transmitted on this connection or link.
     * 
     * <div class="alert"><b>Note</b>  This element is only valid for a single link connection or a single link in a multilink connection.</div>
     * <div> </div>
     */
    dwCompressionRatioOut : UInt32

    /**
     * The speed of the connection or link, in bits per second. 
     * 
     * 
     * 
     * 
     * For a single-link connection and for individual links in a multilink connection, this speed is negotiated at the time the connection or link is established.
     * 
     * For multilink connections, this speed is equal to the sum of the speeds of the individual links. For multilink connections, this speed varies as links are added or deleted.
     * 
     * This speed is not equal to the throughput of the connection or link. To calculate the average throughput, divide the number of bytes transmitted (<b>dwBytesXmited</b>) and received (<b>dwBytesRcved</b>) by the amount of time the connection or link has been up (<b>dwConnectDuration</b>).
     */
    dwBps : UInt32

    /**
     * The amount of time, in milliseconds, that the connection or link has been connected.
     */
    dwConnectDuration : UInt32

}
