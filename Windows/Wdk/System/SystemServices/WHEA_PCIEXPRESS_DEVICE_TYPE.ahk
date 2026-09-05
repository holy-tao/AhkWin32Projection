#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
class WHEA_PCIEXPRESS_DEVICE_TYPE extends Win32Enum {

    /**
     * Native name: WheaPciExpressEndpoint
     * @type {Integer (Int32)}
     */
    static PciExpressEndpoint => 0

    /**
     * Native name: WheaPciExpressLegacyEndpoint
     * @type {Integer (Int32)}
     */
    static PciExpressLegacyEndpoint => 1

    /**
     * Native name: WheaPciExpressRootPort
     * @type {Integer (Int32)}
     */
    static PciExpressRootPort => 4

    /**
     * Native name: WheaPciExpressUpstreamSwitchPort
     * @type {Integer (Int32)}
     */
    static PciExpressUpstreamSwitchPort => 5

    /**
     * Native name: WheaPciExpressDownstreamSwitchPort
     * @type {Integer (Int32)}
     */
    static PciExpressDownstreamSwitchPort => 6

    /**
     * Native name: WheaPciExpressToPciXBridge
     * @type {Integer (Int32)}
     */
    static PciExpressToPciXBridge => 7

    /**
     * Native name: WheaPciXToExpressBridge
     * @type {Integer (Int32)}
     */
    static PciXToExpressBridge => 8

    /**
     * Native name: WheaPciExpressRootComplexIntegratedEndpoint
     * @type {Integer (Int32)}
     */
    static PciExpressRootComplexIntegratedEndpoint => 9

    /**
     * Native name: WheaPciExpressRootComplexEventCollector
     * @type {Integer (Int32)}
     */
    static PciExpressRootComplexEventCollector => 10
}
