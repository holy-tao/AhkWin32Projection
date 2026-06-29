#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * An enumeration used to specify how to handle HTTP cookies.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_cookie_mode
 * @namespace Windows.Win32.Networking.WindowsWebServices
 */
export default struct WS_COOKIE_MODE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * In this mode, cookies are not processed by the client channel.
     *                 
     * 
     * If a server sends a cookie to the client, the client
     *                     channel will ignore the cookie (it will not include
     *                     the cookie value in subsequent requests).
     *                 
     * 
     * An application can use the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_http_header_mapping">WS_HTTP_HEADER_MAPPING</a> feature to handle cookies manually, if desired.
     * @type {Integer (Int32)}
     */
    static WS_MANUAL_COOKIE_MODE => 1

    /**
     * In this mode, cookies are automatically tracked by
     *                     the channel.
     *                 
     * 
     * If a server sends a cookie to the client,
     *                     the channel will automatically track the cookie and
     *                     will include the cookie in subsequent requests.
     * @type {Integer (Int32)}
     */
    static WS_AUTO_COOKIE_MODE => 2
}
