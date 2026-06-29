#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies whether to allow authentication to be used to connect to a proxy or to connect to the HTTP server.
 * @see https://learn.microsoft.com/windows/win32/api/msxml6/ne-msxml6-xhr_auth
 * @namespace Windows.Win32.Data.Xml.MsXml
 */
export default struct XHR_AUTH {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
