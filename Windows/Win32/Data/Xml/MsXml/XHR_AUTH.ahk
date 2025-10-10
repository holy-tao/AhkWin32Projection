#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies whether to allow authentication to be used to connect to a proxy or to connect to the HTTP server.
 * @see https://docs.microsoft.com/windows/win32/api//msxml6/ne-msxml6-xhr_auth
 * @namespace Windows.Win32.Data.Xml.MsXml
 * @version v4.0.30319
 */
class XHR_AUTH{

    /**
     * Allow authentication to both proxy and server.
     * @type {Integer (Int32)}
     */
    static XHR_AUTH_ALL => 0

    /**
     * Disable authentication to both the proxy and server.
     * @type {Integer (Int32)}
     */
    static XHR_AUTH_NONE => 1

    /**
     * Enable authentication to the proxy and disable auth to the server.
     * @type {Integer (Int32)}
     */
    static XHR_AUTH_PROXY => 2
}
