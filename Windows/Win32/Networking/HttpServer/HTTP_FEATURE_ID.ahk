#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines constants that specify an identifier for an HTTP feature.
 * @see https://learn.microsoft.com/windows/win32/api/http/ne-http-http_feature_id
 * @namespace Windows.Win32.Networking.HttpServer
 */
export default struct HTTP_FEATURE_ID {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Specifies an unknown feature.
     * @type {Integer (Int32)}
     */
    static HttpFeatureUnknown => 0

    /**
     * Specifies HTTP response trailers.
     * @type {Integer (Int32)}
     */
    static HttpFeatureResponseTrailers => 1

    /**
     * Specifies HTTP API timings.
     * @type {Integer (Int32)}
     */
    static HttpFeatureApiTimings => 2

    /**
     * Specifies a request for delegation.
     * @type {Integer (Int32)}
     */
    static HttpFeatureDelegateEx => 3

    /**
     * @type {Integer (Int32)}
     */
    static HttpFeatureHttp3 => 4

    /**
     * @type {Integer (Int32)}
     */
    static HttpFeatureTlsSessionTickets => 5

    /**
     * @type {Integer (Int32)}
     */
    static HttpFeatureDisableTlsSessionId => 6

    /**
     * @type {Integer (Int32)}
     */
    static HttpFeatureTlsDualCerts => 7

    /**
     * @type {Integer (Int32)}
     */
    static HttpFeatureAutomaticChunkedEncoding => 8

    /**
     * @type {Integer (Int32)}
     */
    static HttpFeatureDedicatedReqQueueDelegationType => 9

    /**
     * @type {Integer (Int32)}
     */
    static HttpFeatureFastForwardResponse => 10

    /**
     * @type {Integer (Int32)}
     */
    static HttpFeatureCacheTlsClientHello => 11

    /**
     * @type {Integer (Int32)}
     */
    static HttpFeatureIdleConnectionTimeoutRequestProperty => 12

    /**
     * @type {Integer (Int32)}
     */
    static HttpFeatureDisableAiaFlag => 13

    /**
     * @type {Integer (Int32)}
     */
    static HttpFeatureDscp => 14

    /**
     * @type {Integer (Int32)}
     */
    static HttpFeatureQueryCipherInfo => 15

    /**
     * @type {Integer (Int32)}
     */
    static HttpFeatureQueryInitialPacketTtl => 16

    /**
     * @type {Integer (Int32)}
     */
    static HttpFeatureTlsHandshakePerformanceCounters => 17

    /**
     * @type {Integer (Int32)}
     */
    static HttpFeatureLast => 18

    /**
     * Specifies the maximum number of supported features.
     * @type {Integer (Int32)}
     */
    static HttpFeaturemax => -1
}
