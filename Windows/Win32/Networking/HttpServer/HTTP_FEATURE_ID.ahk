#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines constants that specify an identifier for an HTTP feature.
 * @remarks
 * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//http/ne-http-http_feature_id
 * @namespace Windows.Win32.Networking.HttpServer
 * @version v4.0.30319
 */
class HTTP_FEATURE_ID{

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
    static HttpFeatureLast => 12

    /**
     * Specifies the maximum number of supported features.
     * @type {Integer (Int32)}
     */
    static HttpFeaturemax => -1
}
