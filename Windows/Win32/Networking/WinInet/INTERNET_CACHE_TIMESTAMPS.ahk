#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\FILETIME.ahk

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
 * @version v4.0.30319
 */
class INTERNET_CACHE_TIMESTAMPS extends Win32Struct
{
    static sizeof => 16

    static packingSize => 4

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> structure that contains the Expires time.
     * @type {FILETIME}
     */
    ftExpires{
        get {
            if(!this.HasProp("__ftExpires"))
                this.__ftExpires := FILETIME(0, this)
            return this.__ftExpires
        }
    }

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> structure that contains the LastModified time.
     * @type {FILETIME}
     */
    ftLastModified{
        get {
            if(!this.HasProp("__ftLastModified"))
                this.__ftLastModified := FILETIME(8, this)
            return this.__ftLastModified
        }
    }
}
