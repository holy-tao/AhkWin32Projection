#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * The InternetCookieHistory structure contains the cookie history.
 * @remarks
 * <div class="alert"><b>Note</b>  WinINet does not support server implementations. In addition, it should not be used from a service.  For server implementations or services use <a href="https://docs.microsoft.com/windows/desktop/WinHttp/winhttp-start-page">Microsoft Windows HTTP Services (WinHTTP)</a>.</div>
 * <div> </div>
 * @see https://learn.microsoft.com/windows/win32/api/wininet/ns-wininet-internetcookiehistory
 * @namespace Windows.Win32.Networking.WinInet
 */
export default struct InternetCookieHistory {
    #StructPack 4

    /**
     * If true, the cookie was accepted.
     */
    fAccepted : BOOL

    /**
     * If true, the cookie was leashed.
     */
    fLeashed : BOOL

    /**
     * If true, the cookie was downgraded.
     */
    fDowngraded : BOOL

    /**
     * If true, the cookie was rejected.
     */
    fRejected : BOOL

}
