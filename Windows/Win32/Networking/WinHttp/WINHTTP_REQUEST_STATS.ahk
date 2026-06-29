#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The WINHTTP_REQUEST_STATS structure contains a variety of statistics for a request.
 * @remarks
 * This structure is used with [WinHttpQueryOption](/windows/desktop/api/winhttp/nf-winhttp-winhttpqueryoption) to retrieve statistics for a request by specifying the **WINHTTP\_OPTION\_REQUEST\_STATS** flag.
 * @see https://learn.microsoft.com/windows/win32/api/winhttp/ns-winhttp-winhttp_request_stats
 * @namespace Windows.Win32.Networking.WinHttp
 * @architecture X64, Arm64
 */
export default struct WINHTTP_REQUEST_STATS {
    #StructPack 8

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
     */
    ullFlags : Int64

    /**
     * The index of the request on the connection. This indicates how many prior requests were sent over the shared connection.
     */
    ulIndex : UInt32

    /**
     * Unsigned long integer value that contains the number of statistics to retrieve. This should generally be set to **WinHttpRequestStatLast**.
     */
    cStats : UInt32

    /**
     * Array of unsigned long long integer values that will contain the returned statistics, indexed by [**WINHTTP\_REQUEST\_STAT\_ENTRY**](/windows/desktop/api/winhttp/ne-winhttp-winhttp_request_stat_entry).
     */
    rgullStats : Int64[32]

}
