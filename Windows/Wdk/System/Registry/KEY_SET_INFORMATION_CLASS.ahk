#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.Registry
 */
export default struct KEY_SET_INFORMATION_CLASS {
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
    static KeyWriteTimeInformation => 0

    /**
     * @type {Integer (Int32)}
     */
    static KeyWow64FlagsInformation => 1

    /**
     * @type {Integer (Int32)}
     */
    static KeyControlFlagsInformation => 2

    /**
     * @type {Integer (Int32)}
     */
    static KeySetVirtualizationInformation => 3

    /**
     * @type {Integer (Int32)}
     */
    static KeySetDebugInformation => 4

    /**
     * @type {Integer (Int32)}
     */
    static KeySetHandleTagsInformation => 5

    /**
     * @type {Integer (Int32)}
     */
    static KeySetLayerInformation => 6

    /**
     * @type {Integer (Int32)}
     */
    static MaxKeySetInfoClass => 7
}
