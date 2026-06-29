#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\FILETIME.ahk" { FILETIME }

/**
 * Contains the LastModified and Expire times for a resource stored in the Internet cache.
 * @remarks
 * This structure is returned in the buffer when calling 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-internetqueryoptiona">InternetQueryOption</a> with the 
 * <a href="https://docs.microsoft.com/windows/desktop/WinInet/option-flags">INTERNET_OPTION_CACHE_TIMESTAMPS</a> flag.
 * 
 * <div class="alert"><b>Note</b>  WinINet does not support server implementations. In addition, it should not be used from a service.  For server implementations or services use <a href="https://docs.microsoft.com/windows/desktop/WinHttp/winhttp-start-page">Microsoft Windows HTTP Services (WinHTTP)</a>.</div>
 * <div> </div>
 * @see https://learn.microsoft.com/windows/win32/api/wininet/ns-wininet-internet_cache_timestamps
 * @namespace Windows.Win32.Networking.WinInet
 */
export default struct INTERNET_CACHE_TIMESTAMPS {
    #StructPack 4

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> structure that contains the Expires time.
     */
    ftExpires : FILETIME

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> structure that contains the LastModified time.
     */
    ftLastModified : FILETIME

}
