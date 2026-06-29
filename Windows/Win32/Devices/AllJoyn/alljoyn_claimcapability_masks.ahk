#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.AllJoyn
 */
export default struct alljoyn_claimcapability_masks {
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
    static CAPABLE_ECDHE_NULL => 1

    /**
     * @type {Integer (Int32)}
     */
    static CAPABLE_ECDHE_ECDSA => 4

    /**
     * @type {Integer (Int32)}
     */
    static CAPABLE_ECDHE_SPEKE => 8
}
