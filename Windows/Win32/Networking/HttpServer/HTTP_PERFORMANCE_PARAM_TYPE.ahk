#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Networking.HttpServer
 * @version v4.0.30319
 */
class HTTP_PERFORMANCE_PARAM_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static PerformanceParamSendBufferingFlags => 0

    /**
     * @type {Integer (Int32)}
     */
    static PerformanceParamAggressiveICW => 1

    /**
     * @type {Integer (Int32)}
     */
    static PerformanceParamMaxSendBufferSize => 2

    /**
     * @type {Integer (Int32)}
     */
    static PerformanceParamMaxConcurrentClientStreams => 3

    /**
     * @type {Integer (Int32)}
     */
    static PerformanceParamMaxReceiveBufferSize => 4

    /**
     * @type {Integer (Int32)}
     */
    static PerformanceParamDecryptOnSspiThread => 5

    /**
     * @type {Integer (Int32)}
     */
    static PerformanceParamMax => 6
}
