#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Networking.HttpServer
 */
class HTTP_PERFORMANCE_PARAM_TYPE extends Win32Enum {

    /**
     * Native name: PerformanceParamSendBufferingFlags
     * @type {Integer (Int32)}
     */
    static SendBufferingFlags => 0

    /**
     * Native name: PerformanceParamAggressiveICW
     * @type {Integer (Int32)}
     */
    static AggressiveICW => 1

    /**
     * Native name: PerformanceParamMaxSendBufferSize
     * @type {Integer (Int32)}
     */
    static MaxSendBufferSize => 2

    /**
     * Native name: PerformanceParamMaxConcurrentClientStreams
     * @type {Integer (Int32)}
     */
    static MaxConcurrentClientStreams => 3

    /**
     * Native name: PerformanceParamMaxReceiveBufferSize
     * @type {Integer (Int32)}
     */
    static MaxReceiveBufferSize => 4

    /**
     * Native name: PerformanceParamDecryptOnSspiThread
     * @type {Integer (Int32)}
     */
    static DecryptOnSspiThread => 5

    /**
     * Native name: PerformanceParamMax
     * @type {Integer (Int32)}
     */
    static Max => 6
}
