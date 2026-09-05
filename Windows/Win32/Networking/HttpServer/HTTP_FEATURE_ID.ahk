#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines constants that specify an identifier for an HTTP feature.
 * @see https://learn.microsoft.com/windows/win32/api/http/ne-http-http_feature_id
 * @namespace Windows.Win32.Networking.HttpServer
 */
class HTTP_FEATURE_ID extends Win32Enum {

    /**
     * Specifies an unknown feature.
     * Native name: HttpFeatureUnknown
     * @type {Integer (Int32)}
     */
    static Unknown => 0

    /**
     * Specifies HTTP response trailers.
     * Native name: HttpFeatureResponseTrailers
     * @type {Integer (Int32)}
     */
    static ResponseTrailers => 1

    /**
     * Specifies HTTP API timings.
     * Native name: HttpFeatureApiTimings
     * @type {Integer (Int32)}
     */
    static ApiTimings => 2

    /**
     * Specifies a request for delegation.
     * Native name: HttpFeatureDelegateEx
     * @type {Integer (Int32)}
     */
    static DelegateEx => 3

    /**
     * Native name: HttpFeatureHttp3
     * @type {Integer (Int32)}
     */
    static Http3 => 4

    /**
     * Native name: HttpFeatureTlsSessionTickets
     * @type {Integer (Int32)}
     */
    static TlsSessionTickets => 5

    /**
     * Native name: HttpFeatureDisableTlsSessionId
     * @type {Integer (Int32)}
     */
    static DisableTlsSessionId => 6

    /**
     * Native name: HttpFeatureTlsDualCerts
     * @type {Integer (Int32)}
     */
    static TlsDualCerts => 7

    /**
     * Native name: HttpFeatureAutomaticChunkedEncoding
     * @type {Integer (Int32)}
     */
    static AutomaticChunkedEncoding => 8

    /**
     * Native name: HttpFeatureDedicatedReqQueueDelegationType
     * @type {Integer (Int32)}
     */
    static DedicatedReqQueueDelegationType => 9

    /**
     * Native name: HttpFeatureFastForwardResponse
     * @type {Integer (Int32)}
     */
    static FastForwardResponse => 10

    /**
     * Native name: HttpFeatureCacheTlsClientHello
     * @type {Integer (Int32)}
     */
    static CacheTlsClientHello => 11

    /**
     * Native name: HttpFeatureIdleConnectionTimeoutRequestProperty
     * @type {Integer (Int32)}
     */
    static IdleConnectionTimeoutRequestProperty => 12

    /**
     * Native name: HttpFeatureDisableAiaFlag
     * @type {Integer (Int32)}
     */
    static DisableAiaFlag => 13

    /**
     * Native name: HttpFeatureDscp
     * @type {Integer (Int32)}
     */
    static Dscp => 14

    /**
     * Native name: HttpFeatureQueryCipherInfo
     * @type {Integer (Int32)}
     */
    static QueryCipherInfo => 15

    /**
     * Native name: HttpFeatureQueryInitialPacketTtl
     * @type {Integer (Int32)}
     */
    static QueryInitialPacketTtl => 16

    /**
     * Native name: HttpFeatureTlsHandshakePerformanceCounters
     * @type {Integer (Int32)}
     */
    static TlsHandshakePerformanceCounters => 17

    /**
     * Native name: HttpFeatureLast
     * @type {Integer (Int32)}
     */
    static Last => 18

    /**
     * Specifies the maximum number of supported features.
     * Native name: HttpFeaturemax
     * @type {Integer (Int32)}
     */
    static Featuremax => -1
}
