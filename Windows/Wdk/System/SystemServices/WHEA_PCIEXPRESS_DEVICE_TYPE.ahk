#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 * @version v4.0.30319
 */
class WHEA_PCIEXPRESS_DEVICE_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static WheaPciExpressEndpoint => 0

    /**
     * @type {Integer (Int32)}
     */
    static WheaPciExpressLegacyEndpoint => 1

    /**
     * @type {Integer (Int32)}
     */
    static WheaPciExpressRootPort => 4

    /**
     * @type {Integer (Int32)}
     */
    static WheaPciExpressUpstreamSwitchPort => 5

    /**
     * @type {Integer (Int32)}
     */
    static WheaPciExpressDownstreamSwitchPort => 6

    /**
     * @type {Integer (Int32)}
     */
    static WheaPciExpressToPciXBridge => 7

    /**
     * @type {Integer (Int32)}
     */
    static WheaPciXToExpressBridge => 8

    /**
     * @type {Integer (Int32)}
     */
    static WheaPciExpressRootComplexIntegratedEndpoint => 9

    /**
     * @type {Integer (Int32)}
     */
    static WheaPciExpressRootComplexEventCollector => 10
}
