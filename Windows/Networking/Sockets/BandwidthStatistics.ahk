#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Struct.ahk

/**
 * Represents bandwidth information for network data transfer using a [StreamSocket](streamsocket.md), [StreamWebSocket](streamwebsocket.md), or [MessageWebSocket](messagewebsocket.md) object.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.networking.sockets.bandwidthstatistics
 * @namespace Windows.Networking.Sockets
 * @version WindowsRuntime 1.4
 */
class BandwidthStatistics extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * The computed outbound bandwidth estimate in bits per second.
     * 
     * This value is always 0 on systems that do not have extended TCP statistics enabled by default.
     * @type {Integer}
     */
    OutboundBitsPerSecond {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The computed inbound bandwidth estimate in bits per second.
     * 
     * This value is always 0 on systems that do not have extended TCP statistics enabled by default.
     * @type {Integer}
     */
    InboundBitsPerSecond {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * A measure of the instability of the outbound bandwidth estimate in bits per second.
     * 
     * This value is always 0 on systems that do not have extended TCP statistics enabled by default.
     * @type {Integer}
     */
    OutboundBitsPerSecondInstability {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * A measure of the instability of the inbound bandwidth estimate in bits per second.
     * 
     * This value is always 0 on systems that do not have extended TCP statistics enabled by default.
     * @type {Integer}
     */
    InboundBitsPerSecondInstability {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * A Boolean value that indicates whether the computed outbound bandwidth estimate for the network path has peaked.
     * 
     * This member is set to **true** when the app is using enough of the connection bandwidth that the system can get a good estimate of the bandwidth delay product and can determine that the congestion window is a substantial fraction of the bandwidth delay product. This member can change from **true** to **false** if the app sends less data.
     * 
     * This value is always false on systems that do not have extended TCP statistics enabled by default.
     * @type {Boolean}
     */
    OutboundBandwidthPeaked {
        get => NumGet(this, 32, "int")
        set => NumPut("int", value, this, 32)
    }

    /**
     * A Boolean value that indicates whether the computed inbound bandwidth estimate for the network has peaked.
     * 
     * This member is set to **true** when the app is using enough of the connection bandwidth that the system can get a good estimate of the bandwidth delay product and can determine that the congestion window is a substantial fraction of the bandwidth delay product. This member can change from **true** to **false** if the app sends less data.
     * 
     * This value is always false on systems that do not have extended TCP statistics enabled by default.
     * @type {Boolean}
     */
    InboundBandwidthPeaked {
        get => NumGet(this, 36, "int")
        set => NumPut("int", value, this, 36)
    }
}
