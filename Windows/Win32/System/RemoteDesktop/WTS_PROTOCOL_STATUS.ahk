#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\WTS_PROTOCOL_COUNTERS.ahk
#Include .\WTS_PROTOCOL_CACHE.ahk
#Include .\WTS_CACHE_STATS_UN.ahk
#Include .\WTS_CACHE_STATS.ahk

/**
 * Contains information about the status of the protocol.
 * @remarks
 * 
  * This structure is used by the <a href="https://docs.microsoft.com/windows/desktop/api/wtsprotocol/nf-wtsprotocol-iwtsprotocolconnection-getprotocolstatus">GetProtocolStatus</a> method.
  * 
 * @see https://docs.microsoft.com/windows/win32/api//wtsdefs/ns-wtsdefs-wts_protocol_status
 * @namespace Windows.Win32.System.RemoteDesktop
 * @version v4.0.30319
 */
class WTS_PROTOCOL_STATUS extends Win32Struct
{
    static sizeof => 1872

    static packingSize => 8

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/wtsdefs/ns-wtsdefs-wts_protocol_counters">WTS_PROTOCOL_COUNTERS</a> structure that contains the output protocol counters.
     * @type {WTS_PROTOCOL_COUNTERS}
     */
    Output{
        get {
            if(!this.HasProp("__Output"))
                this.__Output := WTS_PROTOCOL_COUNTERS(this.ptr + 0)
            return this.__Output
        }
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/wtsdefs/ns-wtsdefs-wts_protocol_counters">WTS_PROTOCOL_COUNTERS</a> structure that contains the input protocol counters.
     * @type {WTS_PROTOCOL_COUNTERS}
     */
    Input{
        get {
            if(!this.HasProp("__Input"))
                this.__Input := WTS_PROTOCOL_COUNTERS(this.ptr + 464)
            return this.__Input
        }
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/wtsdefs/ns-wtsdefs-wts_cache_stats">WTS_CACHE_STATS</a> structure that contains protocol cache statistics.
     * @type {WTS_CACHE_STATS}
     */
    Cache{
        get {
            if(!this.HasProp("__Cache"))
                this.__Cache := WTS_CACHE_STATS(this.ptr + 928)
            return this.__Cache
        }
    }

    /**
     * An integer that identifies an asynchronous signal for asynchronous protocols.
     * @type {Integer}
     */
    AsyncSignal {
        get => NumGet(this, 1064, "uint")
        set => NumPut("uint", value, this, 1064)
    }

    /**
     * An asynchronous signal mask.
     * @type {Integer}
     */
    AsyncSignalMask {
        get => NumGet(this, 1068, "uint")
        set => NumPut("uint", value, this, 1068)
    }

    /**
     * An array of up to 100 counters.
     * @type {Array<Int64>}
     */
    Counters{
        get {
            if(!this.HasProp("__CountersProxyArray"))
                this.__CountersProxyArray := Win32FixedArray(this.ptr + 1072, 100, Primitive, "int64")
            return this.__CountersProxyArray
        }
    }
}
