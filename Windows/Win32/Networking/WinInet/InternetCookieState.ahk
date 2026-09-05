#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The InternetCookieState enumeration defines the state of the cookie.
 * @remarks
 * <div class="alert"><b>Note</b>  WinINet does not support server implementations. In addition, it should not be used from a service.  For server implementations or services use <a href="https://docs.microsoft.com/windows/desktop/WinHttp/winhttp-start-page">Microsoft Windows HTTP Services (WinHTTP)</a>.</div>
 * <div> </div>
 * @see https://learn.microsoft.com/windows/win32/api/wininet/ne-wininet-internetcookiestate
 * @namespace Windows.Win32.Networking.WinInet
 */
class InternetCookieState extends Win32Enum {

    /**
     * Reserved.
     * Native name: COOKIE_STATE_UNKNOWN
     * @type {Integer (Int32)}
     */
    static UNKNOWN => 0

    /**
     * The cookies are accepted.
     * Native name: COOKIE_STATE_ACCEPT
     * @type {Integer (Int32)}
     */
    static ACCEPT => 1

    /**
     * The user is prompted to accept or deny the cookie.
     * Native name: COOKIE_STATE_PROMPT
     * @type {Integer (Int32)}
     */
    static PROMPT => 2

    /**
     * Cookies are accepted only in the first-party context.
     * Native name: COOKIE_STATE_LEASH
     * @type {Integer (Int32)}
     */
    static LEASH => 3

    /**
     * Cookies are accepted and become session cookies.
     * Native name: COOKIE_STATE_DOWNGRADE
     * @type {Integer (Int32)}
     */
    static DOWNGRADE => 4

    /**
     * The cookies are rejected.
     * Native name: COOKIE_STATE_REJECT
     * @type {Integer (Int32)}
     */
    static REJECT => 5

    /**
     * Same as <b>COOKIE_STATE_REJECT</b>.
     * Native name: COOKIE_STATE_MAX
     * @type {Integer (Int32)}
     */
    static MAX => 5
}
