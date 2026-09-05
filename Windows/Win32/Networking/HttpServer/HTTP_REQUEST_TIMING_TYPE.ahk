#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Networking.HttpServer
 */
class HTTP_REQUEST_TIMING_TYPE extends Win32Enum {

    /**
     * Native name: HttpRequestTimingTypeConnectionStart
     * @type {Integer (Int32)}
     */
    static ConnectionStart => 0

    /**
     * Native name: HttpRequestTimingTypeDataStart
     * @type {Integer (Int32)}
     */
    static DataStart => 1

    /**
     * Native name: HttpRequestTimingTypeTlsCertificateLoadStart
     * @type {Integer (Int32)}
     */
    static TlsCertificateLoadStart => 2

    /**
     * Native name: HttpRequestTimingTypeTlsCertificateLoadEnd
     * @type {Integer (Int32)}
     */
    static TlsCertificateLoadEnd => 3

    /**
     * Native name: HttpRequestTimingTypeTlsHandshakeLeg1Start
     * @type {Integer (Int32)}
     */
    static TlsHandshakeLeg1Start => 4

    /**
     * Native name: HttpRequestTimingTypeTlsHandshakeLeg1End
     * @type {Integer (Int32)}
     */
    static TlsHandshakeLeg1End => 5

    /**
     * Native name: HttpRequestTimingTypeTlsHandshakeLeg2Start
     * @type {Integer (Int32)}
     */
    static TlsHandshakeLeg2Start => 6

    /**
     * Native name: HttpRequestTimingTypeTlsHandshakeLeg2End
     * @type {Integer (Int32)}
     */
    static TlsHandshakeLeg2End => 7

    /**
     * Native name: HttpRequestTimingTypeTlsAttributesQueryStart
     * @type {Integer (Int32)}
     */
    static TlsAttributesQueryStart => 8

    /**
     * Native name: HttpRequestTimingTypeTlsAttributesQueryEnd
     * @type {Integer (Int32)}
     */
    static TlsAttributesQueryEnd => 9

    /**
     * Native name: HttpRequestTimingTypeTlsClientCertQueryStart
     * @type {Integer (Int32)}
     */
    static TlsClientCertQueryStart => 10

    /**
     * Native name: HttpRequestTimingTypeTlsClientCertQueryEnd
     * @type {Integer (Int32)}
     */
    static TlsClientCertQueryEnd => 11

    /**
     * Native name: HttpRequestTimingTypeHttp2StreamStart
     * @type {Integer (Int32)}
     */
    static Http2StreamStart => 12

    /**
     * Native name: HttpRequestTimingTypeHttp2HeaderDecodeStart
     * @type {Integer (Int32)}
     */
    static Http2HeaderDecodeStart => 13

    /**
     * Native name: HttpRequestTimingTypeHttp2HeaderDecodeEnd
     * @type {Integer (Int32)}
     */
    static Http2HeaderDecodeEnd => 14

    /**
     * Native name: HttpRequestTimingTypeRequestHeaderParseStart
     * @type {Integer (Int32)}
     */
    static RequestHeaderParseStart => 15

    /**
     * Native name: HttpRequestTimingTypeRequestHeaderParseEnd
     * @type {Integer (Int32)}
     */
    static RequestHeaderParseEnd => 16

    /**
     * Native name: HttpRequestTimingTypeRequestRoutingStart
     * @type {Integer (Int32)}
     */
    static RequestRoutingStart => 17

    /**
     * Native name: HttpRequestTimingTypeRequestRoutingEnd
     * @type {Integer (Int32)}
     */
    static RequestRoutingEnd => 18

    /**
     * Native name: HttpRequestTimingTypeRequestQueuedForInspection
     * @type {Integer (Int32)}
     */
    static RequestQueuedForInspection => 19

    /**
     * Native name: HttpRequestTimingTypeRequestDeliveredForInspection
     * @type {Integer (Int32)}
     */
    static RequestDeliveredForInspection => 20

    /**
     * Native name: HttpRequestTimingTypeRequestReturnedAfterInspection
     * @type {Integer (Int32)}
     */
    static RequestReturnedAfterInspection => 21

    /**
     * Native name: HttpRequestTimingTypeRequestQueuedForDelegation
     * @type {Integer (Int32)}
     */
    static RequestQueuedForDelegation => 22

    /**
     * Native name: HttpRequestTimingTypeRequestDeliveredForDelegation
     * @type {Integer (Int32)}
     */
    static RequestDeliveredForDelegation => 23

    /**
     * Native name: HttpRequestTimingTypeRequestReturnedAfterDelegation
     * @type {Integer (Int32)}
     */
    static RequestReturnedAfterDelegation => 24

    /**
     * Native name: HttpRequestTimingTypeRequestQueuedForIO
     * @type {Integer (Int32)}
     */
    static RequestQueuedForIO => 25

    /**
     * Native name: HttpRequestTimingTypeRequestDeliveredForIO
     * @type {Integer (Int32)}
     */
    static RequestDeliveredForIO => 26

    /**
     * Native name: HttpRequestTimingTypeHttp3StreamStart
     * @type {Integer (Int32)}
     */
    static Http3StreamStart => 27

    /**
     * Native name: HttpRequestTimingTypeHttp3HeaderDecodeStart
     * @type {Integer (Int32)}
     */
    static Http3HeaderDecodeStart => 28

    /**
     * Native name: HttpRequestTimingTypeHttp3HeaderDecodeEnd
     * @type {Integer (Int32)}
     */
    static Http3HeaderDecodeEnd => 29

    /**
     * Native name: HttpRequestTimingTypeMax
     * @type {Integer (Int32)}
     */
    static Max => 30
}
