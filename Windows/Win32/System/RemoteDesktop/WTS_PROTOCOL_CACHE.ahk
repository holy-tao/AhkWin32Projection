#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains the number of cache reads and cache hits.
 * @see https://learn.microsoft.com/windows/win32/api/wtsdefs/ns-wtsdefs-wts_protocol_cache
 * @namespace Windows.Win32.System.RemoteDesktop
 */
export default struct WTS_PROTOCOL_CACHE {
    #StructPack 4

    /**
     * An integer that contains the number of times cached data was read.
     */
    CacheReads : UInt32

    /**
     * An integer that contains the number of times the cache was hit. A cache hit occurs if required data is found in the cache rather than in main memory or on disk. If the data is found in the cache, it is read from the cache.
     */
    CacheHits : UInt32

}
