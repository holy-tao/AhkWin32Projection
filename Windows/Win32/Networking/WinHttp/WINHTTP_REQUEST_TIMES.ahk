#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The WINHTTP_REQUEST_TIMES structure contains a variety of timing information for an HTTP request.
 * @remarks
 * This structure is used with [WinHttpQueryOption](/windows/desktop/api/winhttp/nf-winhttp-winhttpqueryoption) to retrieve timing information for a request by specifying the **WINHTTP\_OPTION\_REQUEST\_TIMES** flag.
 * @see https://learn.microsoft.com/windows/win32/api/winhttp/ns-winhttp-winhttp_request_times
 * @namespace Windows.Win32.Networking.WinHttp
 * @version v4.0.30319
 */
class WINHTTP_REQUEST_TIMES extends Win32Struct
{
    static sizeof => 516

    static packingSize => 4

    /**
     * Unsigned long integer value that contains the number of timings to retrieve. This should generally be set to **WinHttpRequestTimeLast**.
     * @type {Integer}
     */
    cTimes {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Array of unsigned long long integer values that will contain the returned timings, indexed by [**WINHTTP\_REQUEST\_TIME\_ENTRY**](/windows/desktop/api/winhttp/ne-winhttp-winhttp_request_time_entry).
     * 
     * Times are measured as performance counter values; for more information, see [QueryPerformanceCounter](/windows/desktop/api/profileapi/nf-profileapi-queryperformancecounter).
     * @type {Array<UInt64>}
     */
    rgullTimes{
        get {
            if(!this.HasProp("__rgullTimesProxyArray"))
                this.__rgullTimesProxyArray := Win32FixedArray(this.ptr + 4, 64, Primitive, "uint")
            return this.__rgullTimesProxyArray
        }
    }
}
