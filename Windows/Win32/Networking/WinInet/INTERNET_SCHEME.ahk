#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines the flags used with the nScheme member of the URL_COMPONENTS structure.
 * @remarks
 * <div class="alert"><b>Note</b>  WinINet does not support server implementations. In addition, it should not be used from a service.  For server implementations or services use <a href="https://docs.microsoft.com/windows/desktop/WinHttp/winhttp-start-page">Microsoft Windows HTTP Services (WinHTTP)</a>.</div>
  * <div> </div>
 * @see https://learn.microsoft.com/windows/win32/api/wininet/ne-wininet-internet_scheme
 * @namespace Windows.Win32.Networking.WinInet
 * @version v4.0.30319
 */
class INTERNET_SCHEME{

    /**
     * Partial URL.
     * @type {Integer (Int32)}
     */
    static INTERNET_SCHEME_PARTIAL => -2

    /**
     * Unknown URL scheme.
     * @type {Integer (Int32)}
     */
    static INTERNET_SCHEME_UNKNOWN => -1

    /**
     * Default URL scheme.
     * @type {Integer (Int32)}
     */
    static INTERNET_SCHEME_DEFAULT => 0

    /**
     * FTP URL scheme (ftp:).
     * @type {Integer (Int32)}
     */
    static INTERNET_SCHEME_FTP => 1

    /**
     * Gopher URL scheme (gopher:). 
 * 
 * <div class="alert"><b>Note</b>  Windows XP and Windows Server 2003 R2 and earlier only.</div>
 * <div> </div>
     * @type {Integer (Int32)}
     */
    static INTERNET_SCHEME_GOPHER => 2

    /**
     * HTTP URL scheme (http:).
     * @type {Integer (Int32)}
     */
    static INTERNET_SCHEME_HTTP => 3

    /**
     * HTTPS URL scheme (https:).
     * @type {Integer (Int32)}
     */
    static INTERNET_SCHEME_HTTPS => 4

    /**
     * File URL scheme (file:).
     * @type {Integer (Int32)}
     */
    static INTERNET_SCHEME_FILE => 5

    /**
     * News URL scheme (news:).
     * @type {Integer (Int32)}
     */
    static INTERNET_SCHEME_NEWS => 6

    /**
     * Mail URL scheme (mailto:).
     * @type {Integer (Int32)}
     */
    static INTERNET_SCHEME_MAILTO => 7

    /**
     * Socks URL scheme (socks:).
     * @type {Integer (Int32)}
     */
    static INTERNET_SCHEME_SOCKS => 8

    /**
     * JScript URL scheme (javascript:).
     * @type {Integer (Int32)}
     */
    static INTERNET_SCHEME_JAVASCRIPT => 9

    /**
     * VBScript URL scheme (vbscript:).
     * @type {Integer (Int32)}
     */
    static INTERNET_SCHEME_VBSCRIPT => 10

    /**
     * Resource URL scheme (res:).
     * @type {Integer (Int32)}
     */
    static INTERNET_SCHEME_RES => 11

    /**
     * Lowest known scheme value.
     * @type {Integer (Int32)}
     */
    static INTERNET_SCHEME_FIRST => 1

    /**
     * Highest known scheme value.
     * @type {Integer (Int32)}
     */
    static INTERNET_SCHEME_LAST => 11
}
