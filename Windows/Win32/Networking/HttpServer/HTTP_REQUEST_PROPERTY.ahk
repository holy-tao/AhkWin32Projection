#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines the properties that are configured by the HTTP Server API on a request.
 * @remarks
 * 
  * The **HTTP\_REQUEST\_PROPERTY** enumeration types are used to set or query the configurations on a request. A member of this enumeration together with the associated configuration structure is used by [HttpSetRequestProperty](/windows/desktop/api/http/nf-http-httpsetrequestproperty) to define the configuration parameters.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//http/ne-http-http_request_property
 * @namespace Windows.Win32.Networking.HttpServer
 * @version v4.0.30319
 */
class HTTP_REQUEST_PROPERTY{

    /**
     * @type {Integer (Int32)}
     */
    static HttpRequestPropertyIsb => 0

    /**
     * @type {Integer (Int32)}
     */
    static HttpRequestPropertyTcpInfoV0 => 1

    /**
     * @type {Integer (Int32)}
     */
    static HttpRequestPropertyQuicStats => 2

    /**
     * @type {Integer (Int32)}
     */
    static HttpRequestPropertyTcpInfoV1 => 3

    /**
     * @type {Integer (Int32)}
     */
    static HttpRequestPropertySni => 4

    /**
     * The HTTP/2 or HTTP/3 stream error on the request.
 * 
 * The [HTTP\_REQUEST\_PROPERTY\_STREAM\_ERROR](/windows/win32/api/mstcpip/ns-http-http_request_property_stream_error) structure contains the configuration data for this property.
     * @type {Integer (Int32)}
     */
    static HttpRequestPropertyStreamError => 5

    /**
     * @type {Integer (Int32)}
     */
    static HttpRequestPropertyWskApiTimings => 6

    /**
     * @type {Integer (Int32)}
     */
    static HttpRequestPropertyQuicApiTimings => 7

    /**
     * @type {Integer (Int32)}
     */
    static HttpRequestPropertyQuicStatsV2 => 8

    /**
     * @type {Integer (Int32)}
     */
    static HttpRequestPropertyQuicStreamStats => 9

    /**
     * @type {Integer (Int32)}
     */
    static HttpRequestPropertyTcpInfoV2 => 10

    /**
     * @type {Integer (Int32)}
     */
    static HttpRequestPropertyTlsClientHello => 11
}
