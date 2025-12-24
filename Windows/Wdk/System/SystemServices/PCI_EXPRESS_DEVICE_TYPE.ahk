#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 * @version v4.0.30319
 */
class PCI_EXPRESS_DEVICE_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static PciExpressEndpoint => 0

    /**
     * @type {Integer (Int32)}
     */
    static PciExpressLegacyEndpoint => 1

    /**
     * @type {Integer (Int32)}
     */
    static PciExpressRootPort => 4

    /**
     * @type {Integer (Int32)}
     */
    static PciExpressUpstreamSwitchPort => 5

    /**
     * @type {Integer (Int32)}
     */
    static PciExpressDownstreamSwitchPort => 6

    /**
     * @type {Integer (Int32)}
     */
    static PciExpressToPciXBridge => 7

    /**
     * @type {Integer (Int32)}
     */
    static PciXToExpressBridge => 8

    /**
     * @type {Integer (Int32)}
     */
    static PciExpressRootComplexIntegratedEndpoint => 9

    /**
     * @type {Integer (Int32)}
     */
    static PciExpressRootComplexEventCollector => 10
}
