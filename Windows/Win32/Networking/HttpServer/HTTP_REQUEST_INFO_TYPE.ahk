#Requires AutoHotkey v2.0.0 64-bit

/**
 * The HTTP_REQUEST_INFO_TYPE enumeration defines the type of information contained in the HTTP_REQUEST_INFO structure. This enumeration is used in the HTTP_REQUEST_INFO structure.
 * @see https://docs.microsoft.com/windows/win32/api//http/ne-http-http_request_info_type
 * @namespace Windows.Win32.Networking.HttpServer
 * @version v4.0.30319
 */
class HTTP_REQUEST_INFO_TYPE{

    /**
     * The request information type is authentication.
 * 
 * The <b>pInfo</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/http/ns-http-http_request_info">HTTP_REQUEST_INFO</a> structure points to a <a href="https://docs.microsoft.com/windows/desktop/api/http/ns-http-http_request_auth_info">HTTP_REQUEST_AUTH_INFO</a> structure.
     * @type {Integer (Int32)}
     */
    static HttpRequestInfoTypeAuth => 0

    /**
     * 
     * @type {Integer (Int32)}
     */
    static HttpRequestInfoTypeChannelBind => 1

    /**
     * 
     * @type {Integer (Int32)}
     */
    static HttpRequestInfoTypeSslProtocol => 2

    /**
     * 
     * @type {Integer (Int32)}
     */
    static HttpRequestInfoTypeSslTokenBindingDraft => 3

    /**
     * 
     * @type {Integer (Int32)}
     */
    static HttpRequestInfoTypeSslTokenBinding => 4

    /**
     * @type {Integer (Int32)}
     */
    static HttpRequestInfoTypeRequestTiming => 5

    /**
     * @type {Integer (Int32)}
     */
    static HttpRequestInfoTypeTcpInfoV0 => 6

    /**
     * @type {Integer (Int32)}
     */
    static HttpRequestInfoTypeRequestSizing => 7

    /**
     * @type {Integer (Int32)}
     */
    static HttpRequestInfoTypeQuicStats => 8

    /**
     * @type {Integer (Int32)}
     */
    static HttpRequestInfoTypeTcpInfoV1 => 9

    /**
     * @type {Integer (Int32)}
     */
    static HttpRequestInfoTypeQuicStatsV2 => 10

    /**
     * @type {Integer (Int32)}
     */
    static HttpRequestInfoTypeTcpInfoV2 => 11
}
