#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.NetworkManagement.Ndis
 */
export default struct NDIS_INTERRUPT_MODERATION {
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
    static NdisInterruptModerationUnknown => 0

    /**
     * @type {Integer (Int32)}
     */
    static NdisInterruptModerationNotSupported => 1

    /**
     * @type {Integer (Int32)}
     */
    static NdisInterruptModerationEnabled => 2

    /**
     * @type {Integer (Int32)}
     */
    static NdisInterruptModerationDisabled => 3
}
