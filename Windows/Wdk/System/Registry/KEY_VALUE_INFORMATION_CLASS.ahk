#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.Registry
 */
export default struct KEY_VALUE_INFORMATION_CLASS {
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
    static KeyValueBasicInformation => 0

    /**
     * @type {Integer (Int32)}
     */
    static KeyValueFullInformation => 1

    /**
     * @type {Integer (Int32)}
     */
    static KeyValuePartialInformation => 2

    /**
     * @type {Integer (Int32)}
     */
    static KeyValueFullInformationAlign64 => 3

    /**
     * @type {Integer (Int32)}
     */
    static KeyValuePartialInformationAlign64 => 4

    /**
     * @type {Integer (Int32)}
     */
    static KeyValueLayerInformation => 5

    /**
     * @type {Integer (Int32)}
     */
    static MaxKeyValueInfoClass => 6
}
