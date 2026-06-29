#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct DMA_COMMON_BUFFER_EXTENDED_CONFIGURATION_TYPE {
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
    static CommonBufferConfigTypeLogicalAddressLimits => 0

    /**
     * @type {Integer (Int32)}
     */
    static CommonBufferConfigTypeSubSection => 1

    /**
     * @type {Integer (Int32)}
     */
    static CommonBufferConfigTypeHardwareAccessPermissions => 2

    /**
     * @type {Integer (Int32)}
     */
    static CommonBufferConfigTypeMax => 3
}
