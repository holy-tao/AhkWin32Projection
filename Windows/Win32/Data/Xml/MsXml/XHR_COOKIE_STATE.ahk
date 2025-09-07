#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies the state of the cookie.
 * @see https://learn.microsoft.com/windows/win32/api/msxml6/ne-msxml6-xhr_cookie_state
 * @namespace Windows.Win32.Data.Xml.MsXml
 * @version v4.0.30319
 */
class XHR_COOKIE_STATE{

    /**
     * The state of the cookie is unknown.
     * @type {Integer (Int32)}
     */
    static XHR_COOKIE_STATE_UNKNOWN => 0

    /**
     * The cookie has been accepted by the client.
     * @type {Integer (Int32)}
     */
    static XHR_COOKIE_STATE_ACCEPT => 1

    /**
     * The user is being prompted to accept the cookie form the server.
     * @type {Integer (Int32)}
     */
    static XHR_COOKIE_STATE_PROMPT => 2

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XHR_COOKIE_STATE_LEASH => 3

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XHR_COOKIE_STATE_DOWNGRADE => 4

    /**
     * The cookie has been rejected.
     * @type {Integer (Int32)}
     */
    static XHR_COOKIE_STATE_REJECT => 5
}
