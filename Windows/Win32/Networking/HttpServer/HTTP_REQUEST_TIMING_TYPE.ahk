#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Networking.HttpServer
 * @version v4.0.30319
 */
class HTTP_REQUEST_TIMING_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static HttpRequestTimingTypeConnectionStart => 0

    /**
     * @type {Integer (Int32)}
     */
    static HttpRequestTimingTypeDataStart => 1

    /**
     * @type {Integer (Int32)}
     */
    static HttpRequestTimingTypeTlsCertificateLoadStart => 2

    /**
     * @type {Integer (Int32)}
     */
    static HttpRequestTimingTypeTlsCertificateLoadEnd => 3

    /**
     * @type {Integer (Int32)}
     */
    static HttpRequestTimingTypeTlsHandshakeLeg1Start => 4

    /**
     * @type {Integer (Int32)}
     */
    static HttpRequestTimingTypeTlsHandshakeLeg1End => 5

    /**
     * @type {Integer (Int32)}
     */
    static HttpRequestTimingTypeTlsHandshakeLeg2Start => 6

    /**
     * @type {Integer (Int32)}
     */
    static HttpRequestTimingTypeTlsHandshakeLeg2End => 7

    /**
     * @type {Integer (Int32)}
     */
    static HttpRequestTimingTypeTlsAttributesQueryStart => 8

    /**
     * @type {Integer (Int32)}
     */
    static HttpRequestTimingTypeTlsAttributesQueryEnd => 9

    /**
     * @type {Integer (Int32)}
     */
    static HttpRequestTimingTypeTlsClientCertQueryStart => 10

    /**
     * @type {Integer (Int32)}
     */
    static HttpRequestTimingTypeTlsClientCertQueryEnd => 11

    /**
     * @type {Integer (Int32)}
     */
    static HttpRequestTimingTypeHttp2StreamStart => 12

    /**
     * @type {Integer (Int32)}
     */
    static HttpRequestTimingTypeHttp2HeaderDecodeStart => 13

    /**
     * @type {Integer (Int32)}
     */
    static HttpRequestTimingTypeHttp2HeaderDecodeEnd => 14

    /**
     * @type {Integer (Int32)}
     */
    static HttpRequestTimingTypeRequestHeaderParseStart => 15

    /**
     * @type {Integer (Int32)}
     */
    static HttpRequestTimingTypeRequestHeaderParseEnd => 16

    /**
     * @type {Integer (Int32)}
     */
    static HttpRequestTimingTypeRequestRoutingStart => 17

    /**
     * @type {Integer (Int32)}
     */
    static HttpRequestTimingTypeRequestRoutingEnd => 18

    /**
     * @type {Integer (Int32)}
     */
    static HttpRequestTimingTypeRequestQueuedForInspection => 19

    /**
     * @type {Integer (Int32)}
     */
    static HttpRequestTimingTypeRequestDeliveredForInspection => 20

    /**
     * @type {Integer (Int32)}
     */
    static HttpRequestTimingTypeRequestReturnedAfterInspection => 21

    /**
     * @type {Integer (Int32)}
     */
    static HttpRequestTimingTypeRequestQueuedForDelegation => 22

    /**
     * @type {Integer (Int32)}
     */
    static HttpRequestTimingTypeRequestDeliveredForDelegation => 23

    /**
     * @type {Integer (Int32)}
     */
    static HttpRequestTimingTypeRequestReturnedAfterDelegation => 24

    /**
     * @type {Integer (Int32)}
     */
    static HttpRequestTimingTypeRequestQueuedForIO => 25

    /**
     * @type {Integer (Int32)}
     */
    static HttpRequestTimingTypeRequestDeliveredForIO => 26

    /**
     * @type {Integer (Int32)}
     */
    static HttpRequestTimingTypeHttp3StreamStart => 27

    /**
     * @type {Integer (Int32)}
     */
    static HttpRequestTimingTypeHttp3HeaderDecodeStart => 28

    /**
     * @type {Integer (Int32)}
     */
    static HttpRequestTimingTypeHttp3HeaderDecodeEnd => 29

    /**
     * @type {Integer (Int32)}
     */
    static HttpRequestTimingTypeMax => 30
}
