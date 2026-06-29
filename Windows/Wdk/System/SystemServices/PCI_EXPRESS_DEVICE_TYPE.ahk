#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct PCI_EXPRESS_DEVICE_TYPE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
