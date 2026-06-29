#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies the state of the cookie.
 * @see https://learn.microsoft.com/windows/win32/api/msxml6/ne-msxml6-xhr_cookie_state
 * @namespace Windows.Win32.Data.Xml.MsXml
 */
export default struct XHR_COOKIE_STATE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
     * @type {Integer (Int32)}
     */
    static XHR_COOKIE_STATE_LEASH => 3

    /**
     * @type {Integer (Int32)}
     */
    static XHR_COOKIE_STATE_DOWNGRADE => 4

    /**
     * The cookie has been rejected.
     * @type {Integer (Int32)}
     */
    static XHR_COOKIE_STATE_REJECT => 5
}
