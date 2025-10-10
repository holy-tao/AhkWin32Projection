#Requires AutoHotkey v2.0.0 64-bit

/**
 * The WINHTTP_REQUEST_STAT_ENTRY enumeration lists the available types of request statistics.
 * @remarks
 * 
  * This structure is used with [WinHttpQueryOption](/windows/desktop/api/winhttp/nf-winhttp-winhttpqueryoption) to retrieve statistics for a request by specifying the **WINHTTP\_OPTION\_REQUEST\_STATS** flag.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//winhttp/ne-winhttp-winhttp_request_stat_entry
 * @namespace Windows.Win32.Networking.WinHttp
 * @version v4.0.30319
 */
class WINHTTP_REQUEST_STAT_ENTRY{

    /**
     * The number of connection failures during connection establishment.
     * @type {Integer (Int32)}
     */
    static WinHttpConnectFailureCount => 0

    /**
     * The number of proxy connection failures during connection establishment.
     * @type {Integer (Int32)}
     */
    static WinHttpProxyFailureCount => 1

    /**
     * The size of the client data for the first leg of the TLS handshake.
     * @type {Integer (Int32)}
     */
    static WinHttpTlsHandshakeClientLeg1Size => 2

    /**
     * The size of the server data for the first leg of the TLS handshake.
     * @type {Integer (Int32)}
     */
    static WinHttpTlsHandshakeServerLeg1Size => 3

    /**
     * The size of the client data for the second leg of the TLS handshake.
     * @type {Integer (Int32)}
     */
    static WinHttpTlsHandshakeClientLeg2Size => 4

    /**
     * The size of the server data for the second leg of the TLS handshake.
     * @type {Integer (Int32)}
     */
    static WinHttpTlsHandshakeServerLeg2Size => 5

    /**
     * The size of the request headers.
     * @type {Integer (Int32)}
     */
    static WinHttpRequestHeadersSize => 6

    /**
     * The compressed size of the request headers.
     * @type {Integer (Int32)}
     */
    static WinHttpRequestHeadersCompressedSize => 7

    /**
     * The size of the response headers.
     * @type {Integer (Int32)}
     */
    static WinHttpResponseHeadersSize => 8

    /**
     * The compressed size of the response headers.
     * @type {Integer (Int32)}
     */
    static WinHttpResponseHeadersCompressedSize => 9

    /**
     * The size of the response body.
     * @type {Integer (Int32)}
     */
    static WinHttpResponseBodySize => 10

    /**
     * The compressed size of the response body.
     * @type {Integer (Int32)}
     */
    static WinHttpResponseBodyCompressedSize => 11

    /**
     * The size of the client data for the first leg of the proxy TLS handshake.
     * @type {Integer (Int32)}
     */
    static WinHttpProxyTlsHandshakeClientLeg1Size => 12

    /**
     * The size of the server data for the first leg of the proxy TLS handshake.
     * @type {Integer (Int32)}
     */
    static WinHttpProxyTlsHandshakeServerLeg1Size => 13

    /**
     * The size of the client data for the second leg of the proxy TLS handshake.
     * @type {Integer (Int32)}
     */
    static WinHttpProxyTlsHandshakeClientLeg2Size => 14

    /**
     * The size of the server data for the second leg of the proxy TLS handshake.
     * @type {Integer (Int32)}
     */
    static WinHttpProxyTlsHandshakeServerLeg2Size => 15

    /**
     * Marker for the end of the list of available statistics.
     * @type {Integer (Int32)}
     */
    static WinHttpRequestStatLast => 16

    /**
     * The maximum number of statistics available.
     * @type {Integer (Int32)}
     */
    static WinHttpRequestStatMax => 32
}
