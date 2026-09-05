#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines the properties that are configured by the HTTP Server API on a request.
 * @remarks
 * The **HTTP\_REQUEST\_PROPERTY** enumeration types are used to set or query the configurations on a request. A member of this enumeration together with the associated configuration structure is used by [HttpSetRequestProperty](/windows/desktop/api/http/nf-http-httpsetrequestproperty) to define the configuration parameters.
 * @see https://learn.microsoft.com/windows/win32/api/http/ne-http-http_request_property
 * @namespace Windows.Win32.Networking.HttpServer
 */
class HTTP_REQUEST_PROPERTY extends Win32Enum {

    /**
     * Native name: HttpRequestPropertyIsb
     * @type {Integer (Int32)}
     */
    static Isb => 0

    /**
     * Native name: HttpRequestPropertyTcpInfoV0
     * @type {Integer (Int32)}
     */
    static TcpInfoV0 => 1

    /**
     * Native name: HttpRequestPropertyQuicStats
     * @type {Integer (Int32)}
     */
    static QuicStats => 2

    /**
     * Native name: HttpRequestPropertyTcpInfoV1
     * @type {Integer (Int32)}
     */
    static TcpInfoV1 => 3

    /**
     * Native name: HttpRequestPropertySni
     * @type {Integer (Int32)}
     */
    static Sni => 4

    /**
     * The HTTP/2 or HTTP/3 stream error on the request.
     * 
     * The [HTTP\_REQUEST\_PROPERTY\_STREAM\_ERROR](/windows/win32/api/http/ns-http-http_request_property_stream_error) structure contains the configuration data for this property.
     * Native name: HttpRequestPropertyStreamError
     * @type {Integer (Int32)}
     */
    static StreamError => 5

    /**
     * Native name: HttpRequestPropertyWskApiTimings
     * @type {Integer (Int32)}
     */
    static WskApiTimings => 6

    /**
     * Native name: HttpRequestPropertyQuicApiTimings
     * @type {Integer (Int32)}
     */
    static QuicApiTimings => 7

    /**
     * Native name: HttpRequestPropertyQuicStatsV2
     * @type {Integer (Int32)}
     */
    static QuicStatsV2 => 8

    /**
     * Native name: HttpRequestPropertyQuicStreamStats
     * @type {Integer (Int32)}
     */
    static QuicStreamStats => 9

    /**
     * Native name: HttpRequestPropertyTcpInfoV2
     * @type {Integer (Int32)}
     */
    static TcpInfoV2 => 10

    /**
     * Native name: HttpRequestPropertyTlsClientHello
     * @type {Integer (Int32)}
     */
    static TlsClientHello => 11

    /**
     * Native name: HttpRequestPropertyTransportIdleConnectionTimeout
     * @type {Integer (Int32)}
     */
    static TransportIdleConnectionTimeout => 12

    /**
     * Native name: HttpRequestPropertyDscpTag
     * @type {Integer (Int32)}
     */
    static DscpTag => 13

    /**
     * Native name: HttpRequestPropertyTlsCipherInfo
     * @type {Integer (Int32)}
     */
    static TlsCipherInfo => 14
}
