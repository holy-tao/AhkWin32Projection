#Requires AutoHotkey v2.0.0 64-bit

/**
 * The WINHTTP_REQUEST_TIME_ENTRY enumeration lists the available types of request timing information.
 * @remarks
 * This structure is used with [WinHttpQueryOption](/windows/desktop/api/winhttp/nf-winhttp-winhttpqueryoption) to retrieve timing information for a request by specifying the **WINHTTP\_OPTION\_REQUEST\_TIMES** flag.
 * @see https://learn.microsoft.com/windows/win32/api/winhttp/ne-winhttp-winhttp_request_time_entry
 * @namespace Windows.Win32.Networking.WinHttp
 * @version v4.0.30319
 */
class WINHTTP_REQUEST_TIME_ENTRY{

    /**
     * Start of proxy detection.
     * @type {Integer (Int32)}
     */
    static WinHttpProxyDetectionStart => 0

    /**
     * End of proxy detection.
     * @type {Integer (Int32)}
     */
    static WinHttpProxyDetectionEnd => 1

    /**
     * Start of connection acquisition.
     * @type {Integer (Int32)}
     */
    static WinHttpConnectionAcquireStart => 2

    /**
     * End waiting for an available connection.
     * @type {Integer (Int32)}
     */
    static WinHttpConnectionAcquireWaitEnd => 3

    /**
     * End of connection acquisition.
     * @type {Integer (Int32)}
     */
    static WinHttpConnectionAcquireEnd => 4

    /**
     * Start of name resolution.
     * @type {Integer (Int32)}
     */
    static WinHttpNameResolutionStart => 5

    /**
     * End of name resolution.
     * @type {Integer (Int32)}
     */
    static WinHttpNameResolutionEnd => 6

    /**
     * Start of connection establishment.
     * @type {Integer (Int32)}
     */
    static WinHttpConnectionEstablishmentStart => 7

    /**
     * End of connection establishment.
     * @type {Integer (Int32)}
     */
    static WinHttpConnectionEstablishmentEnd => 8

    /**
     * Start of the first leg of the TLS handshake.
     * @type {Integer (Int32)}
     */
    static WinHttpTlsHandshakeClientLeg1Start => 9

    /**
     * End of the first leg of the TLS handshake.
     * @type {Integer (Int32)}
     */
    static WinHttpTlsHandshakeClientLeg1End => 10

    /**
     * Start of the second leg of the TLS handshake.
     * @type {Integer (Int32)}
     */
    static WinHttpTlsHandshakeClientLeg2Start => 11

    /**
     * End of the second leg of the TLS handshake.
     * @type {Integer (Int32)}
     */
    static WinHttpTlsHandshakeClientLeg2End => 12

    /**
     * Start of the third leg of the TLS handshake.
     * @type {Integer (Int32)}
     */
    static WinHttpTlsHandshakeClientLeg3Start => 13

    /**
     * End of the third leg of the TLS handshake.
     * @type {Integer (Int32)}
     */
    static WinHttpTlsHandshakeClientLeg3End => 14

    /**
     * Start waiting for an available stream.
     * @type {Integer (Int32)}
     */
    static WinHttpStreamWaitStart => 15

    /**
     * End waiting for an available stream.
     * @type {Integer (Int32)}
     */
    static WinHttpStreamWaitEnd => 16

    /**
     * Start sending a request.
     * @type {Integer (Int32)}
     */
    static WinHttpSendRequestStart => 17

    /**
     * Start of request header compression.
     * @type {Integer (Int32)}
     */
    static WinHttpSendRequestHeadersCompressionStart => 18

    /**
     * End of request header compression.
     * @type {Integer (Int32)}
     */
    static WinHttpSendRequestHeadersCompressionEnd => 19

    /**
     * End sending request headers.
     * @type {Integer (Int32)}
     */
    static WinHttpSendRequestHeadersEnd => 20

    /**
     * End sending a request.
     * @type {Integer (Int32)}
     */
    static WinHttpSendRequestEnd => 21

    /**
     * Start receiving a response.
     * @type {Integer (Int32)}
     */
    static WinHttpReceiveResponseStart => 22

    /**
     * Start of response header decompression.
     * @type {Integer (Int32)}
     */
    static WinHttpReceiveResponseHeadersDecompressionStart => 23

    /**
     * End of response header decompression.
     * @type {Integer (Int32)}
     */
    static WinHttpReceiveResponseHeadersDecompressionEnd => 24

    /**
     * End receiving response headers.
     * @type {Integer (Int32)}
     */
    static WinHttpReceiveResponseHeadersEnd => 25

    /**
     * Delta between start and end times for response body decompression.
     * @type {Integer (Int32)}
     */
    static WinHttpReceiveResponseBodyDecompressionDelta => 26

    /**
     * End receiving a response.
     * @type {Integer (Int32)}
     */
    static WinHttpReceiveResponseEnd => 27

    /**
     * Start establishing a proxy tunnel.
     * @type {Integer (Int32)}
     */
    static WinHttpProxyTunnelStart => 28

    /**
     * End establishing a proxy tunnel.
     * @type {Integer (Int32)}
     */
    static WinHttpProxyTunnelEnd => 29

    /**
     * Start of the first leg of the proxy TLS handshake.
     * @type {Integer (Int32)}
     */
    static WinHttpProxyTlsHandshakeClientLeg1Start => 30

    /**
     * End of the first leg of the proxy TLS handshake.
     * @type {Integer (Int32)}
     */
    static WinHttpProxyTlsHandshakeClientLeg1End => 31

    /**
     * Start of the second leg of the proxy TLS handshake.
     * @type {Integer (Int32)}
     */
    static WinHttpProxyTlsHandshakeClientLeg2Start => 32

    /**
     * End of the second leg of the proxy TLS handshake.
     * @type {Integer (Int32)}
     */
    static WinHttpProxyTlsHandshakeClientLeg2End => 33

    /**
     * Start of the third leg of the proxy TLS handshake.
     * @type {Integer (Int32)}
     */
    static WinHttpProxyTlsHandshakeClientLeg3Start => 34

    /**
     * End of the third leg of the proxy TLS handshake.
     * @type {Integer (Int32)}
     */
    static WinHttpProxyTlsHandshakeClientLeg3End => 35

    /**
     * Marker for the end of the list of available timings.
     * @type {Integer (Int32)}
     */
    static WinHttpRequestTimeLast => 36

    /**
     * The maximum number of timings available.
     * @type {Integer (Int32)}
     */
    static WinHttpRequestTimeMax => 64
}
