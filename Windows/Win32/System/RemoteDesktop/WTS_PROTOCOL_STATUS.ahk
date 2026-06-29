#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WTS_CACHE_STATS.ahk" { WTS_CACHE_STATS }
#Import ".\WTS_PROTOCOL_COUNTERS.ahk" { WTS_PROTOCOL_COUNTERS }
#Import ".\WTS_CACHE_STATS_UN.ahk" { WTS_CACHE_STATS_UN }
#Import ".\WTS_PROTOCOL_CACHE.ahk" { WTS_PROTOCOL_CACHE }

/**
 * Contains information about the status of the protocol.
 * @remarks
 * This structure is used by the <a href="https://docs.microsoft.com/windows/desktop/api/wtsprotocol/nf-wtsprotocol-iwtsprotocolconnection-getprotocolstatus">GetProtocolStatus</a> method.
 * @see https://learn.microsoft.com/windows/win32/api/wtsdefs/ns-wtsdefs-wts_protocol_status
 * @namespace Windows.Win32.System.RemoteDesktop
 */
export default struct WTS_PROTOCOL_STATUS {
    #StructPack 8

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/wtsdefs/ns-wtsdefs-wts_protocol_counters">WTS_PROTOCOL_COUNTERS</a> structure that contains the output protocol counters.
     */
    Output : WTS_PROTOCOL_COUNTERS

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/wtsdefs/ns-wtsdefs-wts_protocol_counters">WTS_PROTOCOL_COUNTERS</a> structure that contains the input protocol counters.
     */
    Input : WTS_PROTOCOL_COUNTERS

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/wtsdefs/ns-wtsdefs-wts_cache_stats">WTS_CACHE_STATS</a> structure that contains protocol cache statistics.
     */
    Cache : WTS_CACHE_STATS

    /**
     * An integer that identifies an asynchronous signal for asynchronous protocols.
     */
    AsyncSignal : UInt32

    /**
     * An asynchronous signal mask.
     */
    AsyncSignalMask : UInt32

    /**
     * An array of up to 100 counters.
     */
    Counters : Int64[100]

}
