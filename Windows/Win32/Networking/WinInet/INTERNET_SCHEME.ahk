#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines the flags used with the nScheme member of the URL_COMPONENTS structure.
 * @remarks
 * <div class="alert"><b>Note</b>  WinINet does not support server implementations. In addition, it should not be used from a service.  For server implementations or services use <a href="https://docs.microsoft.com/windows/desktop/WinHttp/winhttp-start-page">Microsoft Windows HTTP Services (WinHTTP)</a>.</div>
 * <div> </div>
 * @see https://learn.microsoft.com/windows/win32/api/wininet/ne-wininet-internet_scheme
 * @namespace Windows.Win32.Networking.WinInet
 */
class INTERNET_SCHEME extends Win32Enum {

    /**
     * Partial URL.
     * Native name: INTERNET_SCHEME_PARTIAL
     * @type {Integer (Int32)}
     */
    static PARTIAL => -2

    /**
     * Unknown URL scheme.
     * Native name: INTERNET_SCHEME_UNKNOWN
     * @type {Integer (Int32)}
     */
    static UNKNOWN => -1

    /**
     * Default URL scheme.
     * Native name: INTERNET_SCHEME_DEFAULT
     * @type {Integer (Int32)}
     */
    static DEFAULT => 0

    /**
     * FTP URL scheme (ftp:).
     * Native name: INTERNET_SCHEME_FTP
     * @type {Integer (Int32)}
     */
    static FTP => 1

    /**
     * Gopher URL scheme (gopher:). 
     * 
     * <div class="alert"><b>Note</b>  Windows XP and Windows Server 2003 R2 and earlier only.</div>
     * <div> </div>
     * Native name: INTERNET_SCHEME_GOPHER
     * @type {Integer (Int32)}
     */
    static GOPHER => 2

    /**
     * HTTP URL scheme (http:).
     * Native name: INTERNET_SCHEME_HTTP
     * @type {Integer (Int32)}
     */
    static HTTP => 3

    /**
     * HTTPS URL scheme (https:).
     * Native name: INTERNET_SCHEME_HTTPS
     * @type {Integer (Int32)}
     */
    static HTTPS => 4

    /**
     * File URL scheme (file:).
     * Native name: INTERNET_SCHEME_FILE
     * @type {Integer (Int32)}
     */
    static FILE => 5

    /**
     * News URL scheme (news:).
     * Native name: INTERNET_SCHEME_NEWS
     * @type {Integer (Int32)}
     */
    static NEWS => 6

    /**
     * Mail URL scheme (mailto:).
     * Native name: INTERNET_SCHEME_MAILTO
     * @type {Integer (Int32)}
     */
    static MAILTO => 7

    /**
     * Socks URL scheme (socks:).
     * Native name: INTERNET_SCHEME_SOCKS
     * @type {Integer (Int32)}
     */
    static SOCKS => 8

    /**
     * JScript URL scheme (javascript:).
     * Native name: INTERNET_SCHEME_JAVASCRIPT
     * @type {Integer (Int32)}
     */
    static JAVASCRIPT => 9

    /**
     * VBScript URL scheme (vbscript:).
     * Native name: INTERNET_SCHEME_VBSCRIPT
     * @type {Integer (Int32)}
     */
    static VBSCRIPT => 10

    /**
     * Resource URL scheme (res:).
     * Native name: INTERNET_SCHEME_RES
     * @type {Integer (Int32)}
     */
    static RES => 11

    /**
     * Lowest known scheme value.
     * Native name: INTERNET_SCHEME_FIRST
     * @type {Integer (Int32)}
     */
    static FIRST => 1

    /**
     * Highest known scheme value.
     * Native name: INTERNET_SCHEME_LAST
     * @type {Integer (Int32)}
     */
    static LAST => 11
}
