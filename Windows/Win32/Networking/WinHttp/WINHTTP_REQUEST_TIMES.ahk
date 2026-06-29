#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The WINHTTP_REQUEST_TIMES structure contains a variety of timing information for an HTTP request.
 * @remarks
 * This structure is used with [WinHttpQueryOption](/windows/desktop/api/winhttp/nf-winhttp-winhttpqueryoption) to retrieve timing information for a request by specifying the **WINHTTP\_OPTION\_REQUEST\_TIMES** flag.
 * @see https://learn.microsoft.com/windows/win32/api/winhttp/ns-winhttp-winhttp_request_times
 * @namespace Windows.Win32.Networking.WinHttp
 * @architecture X64, Arm64
 */
export default struct WINHTTP_REQUEST_TIMES {
    #StructPack 8

    /**
     * Unsigned long integer value that contains the number of timings to retrieve. This should generally be set to **WinHttpRequestTimeLast**.
     */
    cTimes : UInt32

    /**
     * Array of unsigned long long integer values that will contain the returned timings, indexed by [**WINHTTP\_REQUEST\_TIME\_ENTRY**](/windows/desktop/api/winhttp/ne-winhttp-winhttp_request_time_entry).
     * 
     * Times are measured as performance counter values; for more information, see [QueryPerformanceCounter](/windows/desktop/api/profileapi/nf-profileapi-queryperformancecounter).
     */
    rgullTimes : Int64[64]

}
