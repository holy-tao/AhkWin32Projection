#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\WTS_PROTOCOL_CACHE.ahk

/**
 * Contains cache statistics.
 * @remarks
 * This union is a member of the <a href="https://docs.microsoft.com/windows/desktop/api/wtsdefs/ns-wtsdefs-wts_cache_stats">WTS_CACHE_STATS</a> structure. The <b>Specific</b> member of that structure contains an integer index that specifies which  member of the <b>WTS_CACHE_STATS_UN</b> union contains the cache data.
 * @see https://learn.microsoft.com/windows/win32/api/wtsdefs/ns-wtsdefs-wts_cache_stats_un
 * @namespace Windows.Win32.System.RemoteDesktop
 * @version v4.0.30319
 */
class WTS_CACHE_STATS_UN extends Win32Struct
{
    static sizeof => 120

    static packingSize => 8

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/wtsdefs/ns-wtsdefs-wts_protocol_cache">WTS_PROTOCOL_CACHE</a> structure that contains information about the number of times that requested data is found in and read from the cache.
     * @type {Array<WTS_PROTOCOL_CACHE>}
     */
    ProtocolCache{
        get {
            if(!this.HasProp("__ProtocolCacheProxyArray"))
                this.__ProtocolCacheProxyArray := Win32FixedArray(this.ptr + 0, 8, WTS_PROTOCOL_CACHE, "")
            return this.__ProtocolCacheProxyArray
        }
    }

    /**
     * Share cache statistics.
     * @type {Integer}
     */
    TShareCacheStats {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Reserved protocol specific data. The maximum size, in bytes, of this data is WTS_MAX_CACHE_RESERVED multiplied by the length of an unsigned long integer.
     * @type {Array<UInt32>}
     */
    Reserved{
        get {
            if(!this.HasProp("__ReservedProxyArray"))
                this.__ReservedProxyArray := Win32FixedArray(this.ptr + 0, 4, Primitive, "uint")
            return this.__ReservedProxyArray
        }
    }
}
