#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Specifies the state of the cookie.
 * @see https://learn.microsoft.com/windows/win32/api/msxml6/ne-msxml6-xhr_cookie_state
 * @namespace Windows.Win32.Data.Xml.MsXml
 */
class XHR_COOKIE_STATE extends Win32Enum {

    /**
     * The state of the cookie is unknown.
     * Native name: XHR_COOKIE_STATE_UNKNOWN
     * @type {Integer (Int32)}
     */
    static UNKNOWN => 0

    /**
     * The cookie has been accepted by the client.
     * Native name: XHR_COOKIE_STATE_ACCEPT
     * @type {Integer (Int32)}
     */
    static ACCEPT => 1

    /**
     * The user is being prompted to accept the cookie form the server.
     * Native name: XHR_COOKIE_STATE_PROMPT
     * @type {Integer (Int32)}
     */
    static PROMPT => 2

    /**
     * Native name: XHR_COOKIE_STATE_LEASH
     * @type {Integer (Int32)}
     */
    static LEASH => 3

    /**
     * Native name: XHR_COOKIE_STATE_DOWNGRADE
     * @type {Integer (Int32)}
     */
    static DOWNGRADE => 4

    /**
     * The cookie has been rejected.
     * Native name: XHR_COOKIE_STATE_REJECT
     * @type {Integer (Int32)}
     */
    static REJECT => 5
}
