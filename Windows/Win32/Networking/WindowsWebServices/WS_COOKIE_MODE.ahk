#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * An enumeration used to specify how to handle HTTP cookies.
 * @see https://docs.microsoft.com/windows/win32/api//webservices/ne-webservices-ws_cookie_mode
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WS_COOKIE_MODE extends Win32Enum{

    /**
     * In this mode, cookies are not processed by the client channel.
     *                 
     * 
     * If a server sends a cookie to the client, the client
     *                     channel will ignore the cookie (it will not include
     *                     the cookie value in subsequent requests).
     *                 
     * 
     * An application can use the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_http_header_mapping">WS_HTTP_HEADER_MAPPING</a>feature to handle cookies manually, if desired.
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
