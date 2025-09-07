#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\WTS_PROTOCOL_CACHE.ahk
#Include .\WTS_CACHE_STATS_UN.ahk

/**
 * Contains protocol cache statistics.
 * @remarks
 * This structure is a member of the <a href="https://docs.microsoft.com/windows/desktop/api/wtsdefs/ns-wtsdefs-wts_protocol_status">WTS_PROTOCOL_STATUS</a> structure.
 * @see https://learn.microsoft.com/windows/win32/api/wtsdefs/ns-wtsdefs-wts_cache_stats
 * @namespace Windows.Win32.System.RemoteDesktop
 * @version v4.0.30319
 */
class WTS_CACHE_STATS extends Win32Struct
{
    static sizeof => 136

    static packingSize => 8

    /**
     * 
     * @type {Integer}
     */
    Specific {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/wtsdefs/ns-wtsdefs-wts_cache_stats_un">WTS_CACHE_STATS_UN</a> union that contains the cache statistics.
     * @type {WTS_CACHE_STATS_UN}
     */
    Data{
        get {
            if(!this.HasProp("__Data"))
                this.__Data := WTS_CACHE_STATS_UN(this.ptr + 8)
            return this.__Data
        }
    }

    /**
     * An integer that specifies the protocol type. This is not currently used by the Remote Desktop Services service.
     * @type {Integer}
     */
    ProtocolType {
        get => NumGet(this, 128, "ushort")
        set => NumPut("ushort", value, this, 128)
    }

    /**
     * An integer that contains the length of the data in the <b>Reserved</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/wtsdefs/ns-wtsdefs-wts_cache_stats_un">WTS_CACHE_STATS_UN</a> union. The maximum size is WTS_MAX_CACHE_RESERVED multiplied by the length of an unsigned long integer.
     * @type {Integer}
     */
    Length {
        get => NumGet(this, 130, "ushort")
        set => NumPut("ushort", value, this, 130)
    }
}
