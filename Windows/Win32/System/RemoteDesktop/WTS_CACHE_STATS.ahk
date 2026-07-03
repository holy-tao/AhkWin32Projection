#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WTS_CACHE_STATS_UN.ahk" { WTS_CACHE_STATS_UN }
#Import ".\WTS_PROTOCOL_CACHE.ahk" { WTS_PROTOCOL_CACHE }

/**
 * Contains protocol cache statistics.
 * @remarks
 * This structure is a member of the <a href="https://docs.microsoft.com/windows/desktop/api/wtsdefs/ns-wtsdefs-wts_protocol_status">WTS_PROTOCOL_STATUS</a> structure.
 * @see https://learn.microsoft.com/windows/win32/api/wtsdefs/ns-wtsdefs-wts_cache_stats
 * @namespace Windows.Win32.System.RemoteDesktop
 */
export default struct WTS_CACHE_STATS {
    #StructPack 4

    Specific : UInt32

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/wtsdefs/ns-wtsdefs-wts_cache_stats_un">WTS_CACHE_STATS_UN</a> union that contains the cache statistics.
     */
    Data : WTS_CACHE_STATS_UN

    /**
     * An integer that specifies the protocol type. This is not currently used by the Remote Desktop Services service.
     */
    ProtocolType : UInt16

    /**
     * An integer that contains the length of the data in the <b>Reserved</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/wtsdefs/ns-wtsdefs-wts_cache_stats_un">WTS_CACHE_STATS_UN</a> union. The maximum size is WTS_MAX_CACHE_RESERVED multiplied by the length of an unsigned long integer.
     */
    Length : UInt16

}
