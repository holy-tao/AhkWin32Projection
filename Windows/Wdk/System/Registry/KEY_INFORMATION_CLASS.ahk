#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.Registry
 */
export default struct KEY_INFORMATION_CLASS {
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
    static KeyBasicInformation => 0

    /**
     * @type {Integer (Int32)}
     */
    static KeyNodeInformation => 1

    /**
     * @type {Integer (Int32)}
     */
    static KeyFullInformation => 2

    /**
     * @type {Integer (Int32)}
     */
    static KeyNameInformation => 3

    /**
     * @type {Integer (Int32)}
     */
    static KeyCachedInformation => 4

    /**
     * @type {Integer (Int32)}
     */
    static KeyFlagsInformation => 5

    /**
     * @type {Integer (Int32)}
     */
    static KeyVirtualizationInformation => 6

    /**
     * @type {Integer (Int32)}
     */
    static KeyHandleTagsInformation => 7

    /**
     * @type {Integer (Int32)}
     */
    static KeyTrustInformation => 8

    /**
     * @type {Integer (Int32)}
     */
    static KeyLayerInformation => 9

    /**
     * @type {Integer (Int32)}
     */
    static MaxKeyInfoClass => 10
}
