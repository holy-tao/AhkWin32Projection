#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
class PCI_EXPRESS_DEVICE_TYPE extends Win32Enum {

    /**
     * Native name: PciExpressEndpoint
     * @type {Integer (Int32)}
     */
    static Endpoint => 0

    /**
     * Native name: PciExpressLegacyEndpoint
     * @type {Integer (Int32)}
     */
    static LegacyEndpoint => 1

    /**
     * Native name: PciExpressRootPort
     * @type {Integer (Int32)}
     */
    static RootPort => 4

    /**
     * Native name: PciExpressUpstreamSwitchPort
     * @type {Integer (Int32)}
     */
    static UpstreamSwitchPort => 5

    /**
     * Native name: PciExpressDownstreamSwitchPort
     * @type {Integer (Int32)}
     */
    static DownstreamSwitchPort => 6

    /**
     * Native name: PciExpressToPciXBridge
     * @type {Integer (Int32)}
     */
    static ToPciXBridge => 7

    /**
     * @type {Integer (Int32)}
     */
    static PciXToExpressBridge => 8

    /**
     * Native name: PciExpressRootComplexIntegratedEndpoint
     * @type {Integer (Int32)}
     */
    static RootComplexIntegratedEndpoint => 9

    /**
     * Native name: PciExpressRootComplexEventCollector
     * @type {Integer (Int32)}
     */
    static RootComplexEventCollector => 10
}
