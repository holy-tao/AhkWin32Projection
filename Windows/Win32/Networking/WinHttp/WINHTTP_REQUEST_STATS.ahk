#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The WINHTTP_REQUEST_STATS structure contains a variety of statistics for a request.
 * @remarks
 * 
  * This structure is used with [WinHttpQueryOption](/windows/desktop/api/winhttp/nf-winhttp-winhttpqueryoption) to retrieve statistics for a request by specifying the **WINHTTP\_OPTION\_REQUEST\_STATS** flag.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//winhttp/ns-winhttp-winhttp_request_stats
 * @namespace Windows.Win32.Networking.WinHttp
 * @version v4.0.30319
 */
class WINHTTP_REQUEST_STATS extends Win32Struct
{
    static sizeof => 272

    static packingSize => 8

    /**
     * Flags containing details on how the request was made. The following flags are available.
     * 
     * | Value | Meaning |
     * |-|-|
     * | WINHTTP_REQUEST_STAT_FLAG_TCP_FAST_OPEN | TCP Fast Open occurred. |
     * | WINHTTP_REQUEST_STAT_FLAG_TLS_SESSION_RESUMPTION | TLS Session Resumption occurred. |
     * | WINHTTP_REQUEST_STAT_FLAG_TLS_FALSE_START | TLS False Start occurred. |
     * | WINHTTP_REQUEST_STAT_FLAG_PROXY_TLS_SESSION_RESUMPTION | TLS Session Resumption occurred for the proxy connection. |
     * | WINHTTP_REQUEST_STAT_FLAG_PROXY_TLS_FALSE_START | TLS False Start occurred for the proxy connection. |
     * | WINHTTP_REQUEST_STAT_FLAG_FIRST_REQUEST | This is the first request on the connection. |
     * @type {Integer}
     */
    ullFlags {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The index of the request on the connection. This indicates how many prior requests were sent over the shared connection.
     * @type {Integer}
     */
    ulIndex {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Unsigned long integer value that contains the number of statistics to retrieve. This should generally be set to **WinHttpRequestStatLast**.
     * @type {Integer}
     */
    cStats {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * Array of unsigned long long integer values that will contain the returned statistics, indexed by [**WINHTTP\_REQUEST\_STAT\_ENTRY**](/windows/desktop/api/winhttp/ne-winhttp-winhttp_request_stat_entry).
     * @type {Array<UInt64>}
     */
    rgullStats{
        get {
            if(!this.HasProp("__rgullStatsProxyArray"))
                this.__rgullStatsProxyArray := Win32FixedArray(this.ptr + 16, 32, Primitive, "uint")
            return this.__rgullStatsProxyArray
        }
    }
}
