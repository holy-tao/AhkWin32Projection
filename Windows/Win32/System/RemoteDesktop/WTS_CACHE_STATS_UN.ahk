#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WTS_PROTOCOL_CACHE.ahk" { WTS_PROTOCOL_CACHE }

/**
 * Contains cache statistics.
 * @remarks
 * This union is a member of the <a href="https://docs.microsoft.com/windows/desktop/api/wtsdefs/ns-wtsdefs-wts_cache_stats">WTS_CACHE_STATS</a> structure. The <b>Specific</b> member of that structure contains an integer index that specifies which  member of the <b>WTS_CACHE_STATS_UN</b> union contains the cache data.
 * @see https://learn.microsoft.com/windows/win32/api/wtsdefs/ns-wtsdefs-wts_cache_stats_un
 * @namespace Windows.Win32.System.RemoteDesktop
 */
export default struct WTS_CACHE_STATS_UN {
    #StructPack 4

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/wtsdefs/ns-wtsdefs-wts_protocol_cache">WTS_PROTOCOL_CACHE</a> structure that contains information about the number of times that requested data is found in and read from the cache.
     */
    ProtocolCache : WTS_PROTOCOL_CACHE[4]

    static __New() {
        DefineProp(this.Prototype, 'TShareCacheStats', { type: UInt32, offset: 0 })
        DefineProp(this.Prototype, 'Reserved', { type: UInt32[20], offset: 0 })
        this.DeleteProp("__New")
    }
}
