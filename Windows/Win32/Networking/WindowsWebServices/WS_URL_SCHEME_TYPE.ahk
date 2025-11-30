#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The set of schemes used with WsDecodeUrl, WsEncodeUrl, and WsCombineUrl.
 * @see https://docs.microsoft.com/windows/win32/api//webservices/ne-webservices-ws_url_scheme_type
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WS_URL_SCHEME_TYPE extends Win32Enum{

    /**
     * Denotes the "http" scheme: <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_http_url">WS_HTTP_URL</a>
     * @type {Integer (Int32)}
     */
    static WS_URL_HTTP_SCHEME_TYPE => 0

    /**
     * Denotes the "https" scheme: <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_https_url">WS_HTTPS_URL</a>
     * @type {Integer (Int32)}
     */
    static WS_URL_HTTPS_SCHEME_TYPE => 1

    /**
     * Denotes the "net.tcp" scheme: <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_nettcp_url">WS_NETTCP_URL</a>
     * @type {Integer (Int32)}
     */
    static WS_URL_NETTCP_SCHEME_TYPE => 2

    /**
     * Denotes the "soap.udp" scheme: <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_soapudp_url">WS_SOAPUDP_URL</a>
     * @type {Integer (Int32)}
     */
    static WS_URL_SOAPUDP_SCHEME_TYPE => 3

    /**
     * Windows 8 or later: Denotes the "net.pipe" scheme: <a href="https://docs.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_netpipe_url">WS_NETPIPE_URL</a>
     * @type {Integer (Int32)}
     */
    static WS_URL_NETPIPE_SCHEME_TYPE => 4
}
