#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The RAS_STATS structure stores the statistics for a single-link RAS connection, or for one of the links in a multilink RAS connection.
 * @see https://learn.microsoft.com/windows/win32/api/ras/ns-ras-ras_stats
 * @namespace Windows.Win32.NetworkManagement.Rras
 * @version v4.0.30319
 */
class RAS_STATS extends Win32Struct
{
    static sizeof => 60

    static packingSize => 4

    /**
     * Specifies the version of the structure. Set this member to sizeof(<b>RAS_STATS</b>) before using the structure in a function call.
     * @type {Integer}
     */
    dwSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The number of bytes transmitted through this connection or link.
     * @type {Integer}
     */
    dwBytesXmited {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * The number of bytes received through this connection or link.
     * @type {Integer}
     */
    dwBytesRcved {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * The number frames transmitted through this connection or link.
     * @type {Integer}
     */
    dwFramesXmited {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * The number of frames received through this connection or link.
     * @type {Integer}
     */
    dwFramesRcved {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * The number of cyclic redundancy check (CRC) errors on this connection or link.
     * @type {Integer}
     */
    dwCrcErr {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * The number of timeout errors on this connection or link.
     * @type {Integer}
     */
    dwTimeoutErr {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * The number of alignment errors on this connection or link.
     * @type {Integer}
     */
    dwAlignmentErr {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * The number of hardware overrun errors on this connection or link.
     * @type {Integer}
     */
    dwHardwareOverrunErr {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * The number of framing errors on this connection or link.
     * @type {Integer}
     */
    dwFramingErr {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }

    /**
     * The number of buffer overrun errors on this connection or link.
     * @type {Integer}
     */
    dwBufferOverrunErr {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * The compression ratio for the data being received on this connection or link.
     * 
     * <div class="alert"><b>Note</b>  This element is only valid for a single link connection or a single link in a multilink connection.</div>
     * <div> </div>
     * @type {Integer}
     */
    dwCompressionRatioIn {
        get => NumGet(this, 44, "uint")
        set => NumPut("uint", value, this, 44)
    }

    /**
     * The compression ratio for the data being transmitted on this connection or link.
     * 
     * <div class="alert"><b>Note</b>  This element is only valid for a single link connection or a single link in a multilink connection.</div>
     * <div> </div>
     * @type {Integer}
     */
    dwCompressionRatioOut {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

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
     * @type {Integer}
     */
    dwBps {
        get => NumGet(this, 52, "uint")
        set => NumPut("uint", value, this, 52)
    }

    /**
     * The amount of time, in milliseconds, that the connection or link has been connected.
     * @type {Integer}
     */
    dwConnectDuration {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }
}
