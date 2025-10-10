#Requires AutoHotkey v2.0.0 64-bit

/**
 * The InternetCookieState enumeration defines the state of the cookie.
 * @remarks
 * 
  * <div class="alert"><b>Note</b>  WinINet does not support server implementations. In addition, it should not be used from a service.  For server implementations or services use <a href="https://docs.microsoft.com/windows/desktop/WinHttp/winhttp-start-page">Microsoft Windows HTTP Services (WinHTTP)</a>.</div>
  * <div> </div>
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//wininet/ne-wininet-internetcookiestate
 * @namespace Windows.Win32.Networking.WinInet
 * @version v4.0.30319
 */
class InternetCookieState{

    /**
     * Reserved.
     * @type {Integer (Int32)}
     */
    static COOKIE_STATE_UNKNOWN => 0

    /**
     * The cookies are accepted.
     * @type {Integer (Int32)}
     */
    static COOKIE_STATE_ACCEPT => 1

    /**
     * The user is prompted to accept or deny the cookie.
     * @type {Integer (Int32)}
     */
    static COOKIE_STATE_PROMPT => 2

    /**
     * Cookies are accepted only in the first-party context.
     * @type {Integer (Int32)}
     */
    static COOKIE_STATE_LEASH => 3

    /**
     * Cookies are accepted and become session cookies.
     * @type {Integer (Int32)}
     */
    static COOKIE_STATE_DOWNGRADE => 4

    /**
     * The cookies are rejected.
     * @type {Integer (Int32)}
     */
    static COOKIE_STATE_REJECT => 5

    /**
     * Same as <b>COOKIE_STATE_REJECT</b>.
     * @type {Integer (Int32)}
     */
    static COOKIE_STATE_MAX => 5
}
