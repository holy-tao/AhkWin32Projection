#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct WHEA_PCIEXPRESS_DEVICE_TYPE {
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
