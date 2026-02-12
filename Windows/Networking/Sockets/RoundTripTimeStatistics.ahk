#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Struct.ahk

/**
 * Represents round trip time information for a [StreamSocket](streamsocket.md) object.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.networking.sockets.roundtriptimestatistics
 * @namespace Windows.Networking.Sockets
 * @version WindowsRuntime 1.4
 */
class RoundTripTimeStatistics extends Win32Struct
{
    static sizeof => 16

    static packingSize => 4

    /**
     * The round trip time variation, in microseconds, for a [StreamSocket](streamsocket.md) object. This value is used for receive window auto-tuning.
     * 
     * This value is always 0 on systems that do not have extended TCP statistics enabled by default.
     * @type {Integer}
     */
    Variance {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The maximum sampled round trip time, in microseconds, for a [StreamSocket](streamsocket.md) object.
     * 
     * This value is always 0 on systems that do not have extended TCP statistics enabled by default.
     * @type {Integer}
     */
    Max {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * The minimum sampled round trip time, in microseconds, for a [StreamSocket](streamsocket.md) object.
     * 
     * This value is always 0 on systems that do not have extended TCP statistics enabled by default.
     * @type {Integer}
     */
    Min {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * A smoothed value round trip time, in microseconds, computed from all sampled round trip times for a [StreamSocket](streamsocket.md) object. The smoothing is a weighted additive function that uses the  member.
     * 
     * This value is always 0 on systems that do not have extended TCP statistics enabled by default.
     * @type {Integer}
     */
    Sum {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }
}
