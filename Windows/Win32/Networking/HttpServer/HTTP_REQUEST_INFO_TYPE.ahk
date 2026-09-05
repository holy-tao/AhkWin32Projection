#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The HTTP_REQUEST_INFO_TYPE enumeration defines the type of information contained in the HTTP_REQUEST_INFO structure. This enumeration is used in the HTTP_REQUEST_INFO structure.
 * @see https://learn.microsoft.com/windows/win32/api/http/ne-http-http_request_info_type
 * @namespace Windows.Win32.Networking.HttpServer
 */
class HTTP_REQUEST_INFO_TYPE extends Win32Enum {

    /**
     * The request information type is authentication.
     * 
     * The <b>pInfo</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/http/ns-http-http_request_info">HTTP_REQUEST_INFO</a> structure points to a <a href="https://docs.microsoft.com/windows/desktop/api/http/ns-http-http_request_auth_info">HTTP_REQUEST_AUTH_INFO</a> structure.
     * Native name: HttpRequestInfoTypeAuth
     * @type {Integer (Int32)}
     */
    static Auth => 0

    /**
     * Native name: HttpRequestInfoTypeChannelBind
     * @type {Integer (Int32)}
     */
    static ChannelBind => 1

    /**
     * Native name: HttpRequestInfoTypeSslProtocol
     * @type {Integer (Int32)}
     */
    static SslProtocol => 2

    /**
     * Native name: HttpRequestInfoTypeSslTokenBindingDraft
     * @type {Integer (Int32)}
     */
    static SslTokenBindingDraft => 3

    /**
     * Native name: HttpRequestInfoTypeSslTokenBinding
     * @type {Integer (Int32)}
     */
    static SslTokenBinding => 4

    /**
     * Native name: HttpRequestInfoTypeRequestTiming
     * @type {Integer (Int32)}
     */
    static RequestTiming => 5

    /**
     * Native name: HttpRequestInfoTypeTcpInfoV0
     * @type {Integer (Int32)}
     */
    static TcpInfoV0 => 6

    /**
     * Native name: HttpRequestInfoTypeRequestSizing
     * @type {Integer (Int32)}
     */
    static RequestSizing => 7

    /**
     * Native name: HttpRequestInfoTypeQuicStats
     * @type {Integer (Int32)}
     */
    static QuicStats => 8

    /**
     * Native name: HttpRequestInfoTypeTcpInfoV1
     * @type {Integer (Int32)}
     */
    static TcpInfoV1 => 9

    /**
     * Native name: HttpRequestInfoTypeQuicStatsV2
     * @type {Integer (Int32)}
     */
    static QuicStatsV2 => 10

    /**
     * Native name: HttpRequestInfoTypeTcpInfoV2
     * @type {Integer (Int32)}
     */
    static TcpInfoV2 => 11

    /**
     * Native name: HttpRequestInfoTypeTransportIdleConnectionTimeout
     * @type {Integer (Int32)}
     */
    static TransportIdleConnectionTimeout => 12

    /**
     * Native name: HttpRequestInfoTypeDscpTag
     * @type {Integer (Int32)}
     */
    static DscpTag => 13

    /**
     * Native name: HttpRequestInfoTypeInitialPacketTtl
     * @type {Integer (Int32)}
     */
    static InitialPacketTtl => 14
}
