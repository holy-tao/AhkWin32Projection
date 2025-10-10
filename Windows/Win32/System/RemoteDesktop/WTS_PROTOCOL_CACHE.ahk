#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains the number of cache reads and cache hits.
 * @see https://docs.microsoft.com/windows/win32/api//wtsdefs/ns-wtsdefs-wts_protocol_cache
 * @namespace Windows.Win32.System.RemoteDesktop
 * @version v4.0.30319
 */
class WTS_PROTOCOL_CACHE extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * An integer that contains the number of times cached data was read.
     * @type {Integer}
     */
    CacheReads {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * An integer that contains the number of times the cache was hit. A cache hit occurs if required data is found in the cache rather than in main memory or on disk. If the data is found in the cache, it is read from the cache.
     * @type {Integer}
     */
    CacheHits {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }
}
